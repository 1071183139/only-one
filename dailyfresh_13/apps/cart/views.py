from django.shortcuts import render
from django.views.generic import View
from django.http import JsonResponse
from goods.models import GoodsSKU
from django_redis import get_redis_connection
import json


class AddCartView(View):
    """添加购物车"""
    def post(self, request):
        # 判断用户是否登录
        # if not request.user.is_authenticated():
        #     # 表示用户未登录
        #     return JsonResponse({"code": 1, "message": "用户未登录"})

        # sku_id 商品id
        # count 商品数量
        # 接受参数
        sku_id = request.POST.get("sku_id")
        count = request.POST.get("count")

        # 校验参数
        if not all([sku_id, count]):
            return JsonResponse({"code": 2, "message": "参数不完整"})

        # 判断商品存在与否
        try:
            sku = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            # 表示商品不存在
            return JsonResponse({"code": 3, "message": "商品不存在"})

        # 判断用户请求的count是不是整数
        try:
            count = int(count)
        except Exception:
            # 数量不是整数
            return JsonResponse({"code": 4, "message": "参数错误"})

        # 判断数量有没有超过库存
        if count > sku.stock:
            return JsonResponse({"code": 5, "message": "库存不足"})
        if request.user.is_authenticated():
            # 业务逻辑处理，将数据保存到redis中
            # {"sku_1": 10, "sku_2": 20}
            redis_conn = get_redis_connection("default")

            # 先从redis中尝试获取用户原有购物车中相同商品的信息
            user_id = request.user.id
            origin_count = redis_conn.hget("cart_%s" % user_id, sku_id)

            # 如果redis中不存在，则直接将数据保存到redis的购物车中
            # 如果redis中原本包含了这个商品的数量信息， 进行数量累加，在保存到redis中
            if origin_count is not None:
                count += int(origin_count)
            # 在把新的购物信息设置会 redis中
            redis_conn.hset("cart_%s" % user_id, sku_id, count)
            cart_num = 0
            # 取出所有的购物车的数量返回给前端
            cart =redis_conn.hgetall('cart_%s' %user_id)
            for val in cart.values():
                cart_num +=int(val)
            # 通过返回json数据，告知前端处理的结果
            return JsonResponse({"code": 0, "message": "添加购物车成功",'cart_num':cart_num})
        else:
            # 如果用户未登录，则将数据保存到cookie中
            # 先获取用户的cookie中的购物车数据
            cart_json = request.COOKIES.get("cart") # 取原来存储在浏览器中的cookie
            if cart_json is not None:
                cart=json.loads(cart_json)    # 把原来的转成字典
            else:
                cart={}
            # 判断cookies是否包含传来的商品shu_id如果有则求和，没有则增加
            if sku_id in cart:   # 判断传过来的商品id是在以前的cookies中有，有则叠加
                origin_count= cart[sku_id]
                count += origin_count

            # 把最新的商品数量设置到字典中
            cart[sku_id]=count
            new_cart_json = json.dumps(cart)

            # 统计购物车中的商品总数
            cart_num = 0
            for val in cart.values():
                cart_num += val

            response = JsonResponse({"code": 0, "message": "添加购物车成功", "cart_num": cart_num})
            # 设置最新的cookie信息

            response.set_cookie('cart',new_cart_json)
            return response

class CartInfoView(View):
    def get(self, request):

        # 1 用户登陆的时候,从redis中获取数据
        # 2 用户未登录的时候,从cookie中获取数据
        if request.user.is_authenticated():
            user_id=request.user.id
            redis_con = get_redis_connection('default')
            cart = redis_con.hgetall('cart_%s' % user_id)
        else:
            cart_json = request.COOKIES.get('cart')
            if cart_json is not None:
                print(cart_json,type(cart_json))
                cart = json.loads(cart_json)
            else:
                cart={}
        # 遍历cart字典购物车，从mysql数据中查询商品信息
        print(cart,type(cart))
        skus = []
        total_count = 0  # 商品总数
        total_amount = 0  # 商品总金额
        for sku_id,count in cart.items():
            try:
                sku = GoodsSKU.objects.get(id=sku_id)
            except GoodsSKU.DoesNotExist:
                continue
            count = int(count)
            sku.count=count
            skus.append(sku)
            amount = sku.price * count  # price字段是DecimalField, 在python中是Decimal数据类型
            sku.amount = amount
            total_amount +=amount
            total_count +=count

        context = {
            "skus": skus,
            "total_count": total_count,
            "total_amount": total_amount
        }

        return render(request, 'cart.html', context)


class UpdateCartView(View):

    def post(self,request):
        # 接受前端传送过来的数据
        sku_id = request.POST.get('sku_id')
        count = request.POST.get('count')
        # 参数校验
        if not all([sku_id, count]):
            return JsonResponse({'code':1, 'message': '参数不完整'})
        try:
            sku = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            return JsonResponse({'code':2, 'message' :'商品不存在'})
        try:
            count = int(count)
        except Exception:
            return JsonResponse({'code':3, 'message': '参数有误'})

        if count > sku.stock:
            return JsonResponse({'code':4, 'message': '库存不足'})
        # 业务处理保存数据
        if not request.user.is_authenticated():
            # 如果用户未登录，把数据保存在cookie中
            cart_json = request.COOKIES.get('cart')
            if cart_json is not None:
                cart = json.loads(cart_json)
            else:
                cart=[]
            # 把最新的数量信息保存
            cart[sku_id]=count
            response = JsonResponse({'code':0,'message': '修改成功'})
            response.set_cookie('cart',json.dumps(cart))
            return response

        else:
            # 如果用户登陆，把数据保存在redis中
            redis_con= get_redis_connection('default')
            user_id = request.user.id
            # 把数据设置到redis中
            redis_con.hset("cart_%s" % user_id, sku_id, count)
            # 返回结果， 返回Json数据
            return JsonResponse({"code": 0, "message": "修改成功"})



class DeleteCartView(View):
    def post(self, request):
        # 接受参数
        sku_id = request.POST.get('sku_id')
        # 参数校验
        if not sku_id:
            return JsonResponse({'code':1,'message':'参数不完整'})

        # 根据sku_id把对应的商品删除
        if not request.user.is_authenticated():
            # 如果用户未登录，从cookie中删除数据
            cart_json = request.COOKIES.get('cart')
            if cart_json is not None:
                cart = json.loads(cart_json)
                if sku_id in cart:
                    del cart[sku_id]

                response = JsonResponse({'code':0, 'message':'删除成功'})
                response.set_cookie('cart',json.dumps(cart))
                return response
            else:
                return JsonResponse({'code':0 ,'message': '删除成功'})

        else:
            # 如果用户登陆，从redis中删除数据
            redis_con = get_redis_connection('default')
            user_id = request.user.id
            redis_con.hdel('cart_%s' % user_id, sku_id)
            return JsonResponse({'code':0,'message': '删除成功'})


