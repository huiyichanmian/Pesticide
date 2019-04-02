from django.urls import re_path
from apps.goods.views import DetailView, ListView

from apps.goods.views import IndexView

app_name = 'goods'

urlpatterns = [
    re_path(r'^goods/(?P<goods_id>\d+)$', DetailView.as_view(), name='detail'),  # 商品详情
    re_path(r'^goods/(?P<type_id>\d+)/(?P<page>\d+)$', ListView.as_view(), name='list'),  # 列表页
    re_path(r'^$', IndexView.as_view(), name='index'),   # 首页
]
