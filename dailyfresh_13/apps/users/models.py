from django.db import models
from django.db import models
from django.contrib.auth.models import AbstractUser
from utils.models import BaseModel
from django.conf import settings
from goods.models import GoodsSKU

from itsdangerous import TimedJSONWebSignatureSerializer as Serializer

# Create your models here.

# django默认的认证机制，在setting installAPPs中的    'django.contrib.auth',
# 所以我们要声明自己的认证路径 去setting配置,AUTH_USER_MODEL = "users.User"

class User(AbstractUser, BaseModel):
    """用户"""
    # 我们自己不用指明字段，django的默认字段，都通过继承AbstractUser它就有了
    class Meta:
        db_table = "df_users"

    def generate_active_token(self):
        """生成激活令牌"""
        serializer = Serializer(settings.SECRET_KEY, 3600)
        token = serializer.dumps({"confirm": self.id})  # 返回bytes类型
        return token.decode()


class Address(BaseModel):
    """地址"""
    user = models.ForeignKey(User, verbose_name="所属用户")
    receiver_name = models.CharField(max_length=20, verbose_name="收件人")
    receiver_mobile = models.CharField(max_length=11, verbose_name="联系电话")
    detail_addr = models.CharField(max_length=256, verbose_name="详细地址")
    zip_code = models.CharField(max_length=6, verbose_name="邮政编码")

    class Meta:
        db_table = "df_address"
