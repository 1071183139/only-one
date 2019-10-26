from django.core.management.base import BaseCommand
from orders.models import OrderInfo, OrderGoods
import datetime

from djcelery.management.commands.celery import Command

class Command(BaseCommand):
    help = '超过一天没下单释放订单'

    def handle(self, *args, **options):
        now = datetime.datetime.now()
        date_before_one_day = now + datetime.timedelta(minutes=-1)
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


'python manage.py release_order'

