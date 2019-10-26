
from django.shortcuts import render,redirect
from django.views.generic import View
from .models import GoodsCategory
from .models import *
from django.core.cache import cache
from django.http import Http404
from django.core.urlresolvers import reverse
from django_redis import get_redis_connection
from goods.models import GoodsCategory
from goods.models import GoodsSKU
from django.core.cache import cache
from django.core.urlresolvers import reverse
from django.core.paginator import Paginator, EmptyPage
import json
from django.http import HttpResponse

class BaseCartView(View):
    """提供统计购物车数据的功能"""
    def get_cart_num(self, request):
        cart_num = 0
        # 如果用户登录，从redis中获取用户的购物车数据
        if request.user.is_authenticated():
            # 从redis中取购物车数据
            redis_conn = get_redis_connection("default")
            # 返回一个字典数据
            cart = redis_conn.hgetall("cart_%s" % request.user.id)
            # cart = {"sku_1": "10", "sku_2": "11"}
            for value in cart.values():
                cart_num += int(value)
        else:
            # 用户未登录，从cookie中获取购物车数据
            cart_json = request.COOKIES.get("cart")
            if cart_json is not None:
                cart = json.loads(cart_json)   # 购物车的字典数据
            else:
                cart = {}
            # 遍历购物车的字典数据，统计求和
            for val in cart.values():
                cart_num += val

        return cart_num

class IndexView(BaseCartView):
    """主页"""

    def get(self, request):
        """提供主页页面"""
        # 尝试先从缓存中读取上次保存的数据
        context = cache.get("index_page_data")
        # data = {}
        # 如果没有拿到数据，则表示缓存中没有备份，需要从新查询数据库
        if context is None:
            print("没有用上缓存，查询的数据库")
            # 需要查询的数据
            # 商品分类信息
            categorys = GoodsCategory.objects.all()

            # 首页轮播图信息, 按照index排序
            index_goods_banners = IndexGoodsBanner.objects.all().order_by("index")[:4]

            # 首页广告活动
            promotions_banners = IndexPromotionBanner.objects.all().order_by("index")

            # 分类商品展示  标题和图片
            for category in categorys:
                title_banners = IndexCategoryGoodsBanner.objects.filter(category=category, display_type=0).order_by(
                    "index")[:4]
                category.title_banners = title_banners
                image_banners = IndexCategoryGoodsBanner.objects.filter(category=category, display_type=1).order_by(
                    "index")[:4]
                category.image_banners = image_banners

                # data['category'] = category

            context = {
                "categorys": categorys,
                "index_banners": index_goods_banners,
                "promotion_banners": promotions_banners,
            }
            # 将数据保存到缓存中（ 隐含的是通过django_redis保存到了redis中）
            #                                    缓存的时间
            cache.set("index_page_data", context, 3600)

        # 用户的购物车信息
        cart_num = self.get_cart_num(request)
        # 如果用户登录，则获取用户的购物车数据，否则直接设置为0
        # if request.user.is_authenticated():
        #     # 从redis中取购物车数据
        #     redis_conn = get_redis_connection("default")
        #     # 返回一个字典数据
        #     cart = redis_conn.hgetall("cart_%s" % request.user.id)
        #     # cart = {"sku_1": "10", "sku_2": "11"}
        #     for value in cart.values():
        #         cart_num += int(value)

        # 将购物车数量添加到模板变量中
        context.update(cart_num=cart_num)




        # return HttpResponse({'data':data})





        # 处理模板页面
        return render(request, "index.html", context)


class DetailView(BaseCartView):

    def get(self, request, sku_id):

        # 获取缓存的数据;
        context = cache.get('detail_%s' %sku_id)
        # 如果缓存的数据不存在:
        if context is None:
            try:
            # 查询当前商品的数据
                sku = GoodsSKU.objects.get(id=sku_id)
            except GoodsSKU.DoesNotExist:
                return redirect(reverse('goods:index'))
            # 获取全部商品的数据;
            categorys = GoodsCategory.objects.all()

            # 新品推荐 :
            new_skus = GoodsSKU.objects.filter(category=sku.category)[:2]
            # 查询其他的规格,goods表和Goodssku是一对多的关系,草莓对应的是不同的草莓类型
            goods_skus=sku.goods.goodssku_set.exclude(id=sku_id)

            # 从订单中获取评论的信息
            sku_orders=sku.ordergoods_set.all().order_by('create_time')[:30]
            if sku_orders:
                for sku_order in sku_orders:
                    sku_order.ctime = sku_order.create_time.strftime('%Y-%m-%d %H:%M:%S')
                    sku_order.username = sku_order.order.user.username
            else:
                sku_orders = []

            context={
                'categorys': categorys,
                'sku': sku,
                'goods_skus': goods_skus,
                'new_skus': new_skus,
                'sku_orders':sku_orders
            }
            # 设置缓存数据
            cache.set('detail_%s' %sku_id,context,3600)

        # 购物车的数量
        cart_num = self.get_cart_num(request)
        # 如果是登陆的用户，
        if request.user.is_authenticated():

            user_id=request.user.id
            redis_con=get_redis_connection('default')
            # 没有返回的是一个空的列表
            cart= redis_con.hgetall('cart_%s'% user_id)

            for val in cart.values():
                cart_num += int(val)

            # 移除已经存在的本商品浏览记录
            redis_con.lrem('history_%s'%user_id,0,sku_id)
            # 添加本次的浏览记录
            redis_con.lpush('history_%s'%user_id,sku_id)
            # 只保留5条用户的浏览记录
            redis_con.ltrim('history_%s'%user_id,0,4)


        context.update({'cart_num':cart_num})
        return render(request, 'detail.html',context)

class ListView(BaseCartView):
    """商品列表页"""
    def get(self, request, category_id, page):
        """category_id 是商品分类id， page是页数"""
        # 分析在视图中需要用到哪些参数
        # 商品的分类   指定的排序  返回的哪一页的数据
        # 访问的url格式： /list/(商品的分类id)/(页数)?sort=排序
        sort = request.GET.get("sort", "default")  # 排序的关键字  price价格  hot 人气
        if sort not in ("price", "hot"):
            sort = "default"

        # 参数校验
        try:
            category = GoodsCategory.objects.get(id=category_id)
        except GoodsCategory.DoesNotExist:
            # 表示分类id不存在，用户访问传递的参数错误
            return reverse("goods:index")

        # 查询数据
        # 购物车数据
        # 购物车数量
        cart_num = self.get_cart_num(request)
        # 如果是登录的用户
        if request.user.is_authenticated():
            user_id = request.user.id
            # 从redis中获取购物车信息
            redis_conn = get_redis_connection("default")
            # 如果redis中不存在，会返回0
            cart = redis_conn.hgetall("cart_%s" % user_id)
            for val in cart.values():
                cart_num += int(val)

        # 分类信息
        categorys = GoodsCategory.objects.all()

        # 分类的新品推荐
        new_skus = GoodsSKU.objects.filter(category=category).order_by("-create_time")[:2]

        # 分类的商品数据
        if sort == "price":
            skus = GoodsSKU.objects.filter(category=category).order_by("price")
        elif sort == "hot":
            skus = GoodsSKU.objects.filter(category=category).order_by("-sales")
        else:
            skus = GoodsSKU.objects.filter(category=category)

        # 分页处理
        # 创建分页器
        # paginator(要分页的数据， 每页的数据数目
        paginator = Paginator(skus, 1)
        # page传进来的时候是字符串，需要转换成整数传给分页器
        page = int(page)
        try:
            page_skus = paginator.page(page)
        except EmptyPage:
            # 表示用户请求的页数不存在相应的数据, 返回第一页的数据
            page_skus = paginator.page(1)
            page = 1

        num_pages = paginator.num_pages
        # 页面展示的页数
        # 如果页数小于5页
        # 如果页数超过5页 页数属于前三页 page<=3
        # 如果页数超过5页 页数属于最后三页  页面总数 paginator.num_pages    paginator.num_pages - page < 3
        # 其他剩余情况

        if num_pages <= 5:
            page_list = range(1, num_pages + 1)
        elif page <= 3:
            # 页数属于前三页, 页数展示前5页
            page_list = range(1, 6)
        elif num_pages - page < 3:
            # 页数属于最后三页
            page_list = range(num_pages-4, num_pages+1)
        else:
            page_list = range(page-2, page+3)
        print(list(page_list))

        # 渲染模板
        context = {
            "category": category,  # 当前的分类
            "categorys": categorys,  # 所有分类
            "cart_num": cart_num,  # 购物车数据
            "new_skus": new_skus,  # 新品推荐
            "page_skus": page_skus,  # 当前页面的商品信息
            "page_list": page_list,  # 页数列表
            "sort": sort  # 当前的排序
        }

        return render(request, "list.html", context)

