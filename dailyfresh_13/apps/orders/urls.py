from django.conf.urls import url
from . import views

urlpatterns = [
    url(r"^place$", views.PlaceOrderView.as_view(), name="place"),
    url(r"^commit$", views.CommitOrderView.as_view(), name="commit"),
    url('^(?P<page>\d+)$', views.UserOrdersView.as_view(), name="info"),
    url('^pay$', views.PayView.as_view(), name="pay"),
    url('^check_pay$', views.CheckPayStatusView.as_view(), name="check_pay"),
]
