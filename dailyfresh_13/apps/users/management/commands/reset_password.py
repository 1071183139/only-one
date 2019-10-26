from django.core.management.base import BaseCommand
from users.models import User
from django.core.exceptions import ObjectDoesNotExist

class Command(BaseCommand):
    help = '超过一天没下单释放订单'

    def add_arguments(self, parser):
        parser.add_argument(dest='username', metavar='username')
        parser.add_argument(dest='password', metavar='password')

    def handle(self, *args, **options):
        try:
            user = User.objects.get(username=options['username'])
        except ObjectDoesNotExist:
            raise SystemExit('{} 用户不存在'.format(options['username']))
        user.set_password(options['password'])
        user.save()
        print('修改密码成功')
