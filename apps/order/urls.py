from django.urls import path, include, re_path

from apps.order.views import OrderPlaceView, OrderCommitView, OrderPayView

app_name = 'order'

urlpatterns = [
    re_path(r'^place', OrderPlaceView.as_view(), name='place'),  # 订单显示页面
    re_path(r'^commit', OrderCommitView.as_view(), name='commit'),  # 提交创建
    re_path(r'^pay', OrderPayView.as_view(), name='pay'),  # 订单支付
    # re_path(r'^check', CheckPayView.as_view(), name='check'),  # 查询支付订单结果
    # re_path(r'^comment/(?P<order_id>.+)', CommentView.as_view(), name='comment'),  # 订单评论
]