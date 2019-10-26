from django.core.management.base import BaseCommand
from users.models import User
from django.core.exceptions import ObjectDoesNotExist
from django import db
class Command(BaseCommand):
    help = '创建新用户'

    def add_arguments(self, parser):
        parser.add_argument(dest='username', metavar='username')
        parser.add_argument(dest='password', metavar='password')
        parser.add_argument(dest='email', metavar='email')

    def handle(self, *args, **options):
        try:
            # django的AbstractUser基类提供的创建用户的方法
            user = User.objects.create_user(
            username = options['username'],
            password = options['password'],
            email=options['email'])
        except db.IntegrityError:
            # 如果用户名已存在，则抛出此异常信息
            raise SystemExit('{} 用户名移存在'.format(options['username']))
        user.save()
        print('创建新用户')

