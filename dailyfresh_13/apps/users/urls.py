from django.conf.urls import url
from . import views

urlpatterns=[
    url(r'^register$', views.RegisterView.as_view(), name="register"),
    # 激活的请求
    url(r'^active/(?P<token>.+)', views.ActiveView.as_view(), name="active"),
    # 登陆的请求路径
    url(r'^login$', views.LoginView.as_view(), name="login"),
    # 定义退出的请求路径
    url(r'^logout$', views.LogoutView.as_view(), name="logout"),
    # 定义用户通过登陆后的地址信息
    url(r'^address$', views.AddressView.as_view(), name="address"),

    url(r'^info$', views.UserInfoView.as_view(), name="info"),

]
