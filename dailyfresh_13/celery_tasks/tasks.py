from orders.models import OrderInfo, OrderGoods
import datetime

from django.core.mail import send_mail
from django.conf import settings
from django.template import loader
from goods.models import GoodsCategory, IndexGoodsBanner, IndexPromotionBanner
from goods.models import IndexCategoryGoodsBanner
import os


from celery import shared_task
# # 定义任务
@shared_task()
def send_active_email(user_name, to_email, token):
    """发送激活邮件"""
    subject = "天天生鲜用户激活"  # 邮件标题
    body = ""  # 邮件体
    sender = settings.EMAIL_FROM  # 发件人
    receivers = [to_email]  # 接收人
    html_body = '<h1>尊敬的用户 %s, 感谢您注册天天生鲜！</h1>' \
                '<br/><p>请点击此链接激活您的帐号<a href="http://127.0.0.1:8000/users/active/%s">' \
                'http://127.0.0.1:8000/users/active/%s<a></p>' % (user_name, token, token) # html邮件体
    send_mail(subject, body, sender, receivers, html_message=html_body)


@shared_task()
def generate_static_index_html():
    """生成主页的静态html文件"""
    # 需要查询的数据
    # 商品分类信息
    categorys = GoodsCategory.objects.all()

    # 首页轮播图信息, 按照index排序
    index_goods_banners = IndexGoodsBanner.objects.all().order_by("index")

    # 首页广告活动
    promotions_banners = IndexPromotionBanner.objects.all().order_by("index")

    # 分类商品展示  标题和图片
    for category in categorys:
        title_banners = IndexCategoryGoodsBanner.objects.filter(category=category, display_type=0).order_by("index")[:4]
        category.title_banners = title_banners
        image_banners = IndexCategoryGoodsBanner.objects.filter(category=category, display_type=1).order_by("index")[:4]
        category.image_banners = image_banners

    # 用户的购物车信息
    cart_num = 0

    # 处理模板页面
    context = {
        "categorys": categorys,
        "index_banners": index_goods_banners,
        "promotion_banners": promotions_banners,
        "cart_num": cart_num
    }

    # 加载模板
    template = loader.get_template("static_index.html")
    # 渲染模板,生成html数据
    html_data = template.render(context)
    # 保存产生的静态html数据
    file_path = os.path.join(settings.STATICFILES_DIRS[0], "index.html")
    with open(file_path, "w") as f:
        f.write(html_data)

from celery import shared_task

@shared_task()
def send_test():
    print(123)

    now = datetime.datetime.now()
    date_before_one_day = now + datetime.timedelta(minutes=-30)
    print(date_before_one_day)

    # 查询下单后一分钟没支付的订单
    overdue_Order = OrderInfo.objects.filter(
        create_time__lte=date_before_one_day,
        status=1
    ).all()

    print(overdue_Order)
    for order in overdue_Order:

        # 根据订单号获取订单详情
        goods = OrderGoods.objects.filter(order=order)

        # 根据订单详情获取商品，恢复库存
        for good in goods:
            print(good.sku.name)
            good.sku.stock += good.count
            good.sku.save()

        # 删除过时的下单，订单详情也会自动删除（因为删除一，自动会清理多的）
        order.delete()

