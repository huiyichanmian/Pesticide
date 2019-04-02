from django.urls import re_path

from apps.cart.views import CartAddView, CartInfoView, CartUpdateView, CartDeleteView

app_name = 'cart'

urlpatterns = [
    re_path(r'^add', CartAddView.as_view(), name='add'),  # 添加购物车
    re_path(r'^update', CartUpdateView.as_view(), name='update'),  # 更新购物车
    re_path(r'^delete$', CartDeleteView.as_view(), name='delete'),  # 购物车记录删除
    re_path(r'^$', CartInfoView.as_view(), name='show'),  # 购物车页面显示
]
