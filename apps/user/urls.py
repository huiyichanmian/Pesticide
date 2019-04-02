from django.urls import re_path
from apps.user.views import *


app_name = 'user'

urlpatterns = [
    # re_path('^register/', views.register, name='register'),   #注册
    # re_path('^register_handle', views.register_handler, name='register_handle')  #处理注册
    re_path(r'^register/', RegisterView.as_view(), name='register'),  #注册
    re_path(r'active/(?P<token>.*)/$', ActiveView.as_view(), name='active'),  #用户激活
    re_path(r'login/', LoginView.as_view(), name='login'),  #登录

    re_path(r'^logout$', LogoutView.as_view(), name='logout'), # 注销登录

    # url(r'^$', login_required(UserInfoView.as_view()), name='user'), # 用户中心-信息页
    # url(r'^order$', login_required(UserOrderView.as_view()), name='order'), # 用户中心-订单页
    # url(r'^address$', login_required(AddressView.as_view()), name='address'), # 用户中心-地址页

    re_path(r'^$', UserInfoView.as_view(), name='user'), # 用户中心-信息页
    re_path(r'^order/(?P<page>\d+)$', UserOrderView.as_view(), name='order'), # 用户中心-订单页
    re_path(r'^address$', AddressView.as_view(), name='address'), # 用户中心-地址页
]