from django.contrib import admin
from django.core.cache import cache
from goods.models import GoodsSKU, Goods, GoodsType, GoodsImage, IndexGoodsBanner, IndexTypeGoodsBanner, IndexPromotionBanner
# Register your models here.


class BaseModelAdmin(admin.ModelAdmin):
    def save_model(self, request, obj, form, change):
        '''新增或更新表中的数据时调用'''
        super().save_model(request, obj, form, change)

        # 发出任务，让celery worker重新生成首页静态页
        from celery_tasks.tasks import generate_static_index_html
        generate_static_index_html.delay()

        # 清除首页的缓存数据
        cache.delete('index_page_data')

    def delete_model(self, request, obj):
        '''删除表中的数据时调用'''
        super().delete_model(request, obj)
        # 发出任务，让celery worker重新生成首页静态页
        from celery_tasks.tasks import generate_static_index_html
        generate_static_index_html.delay()

        # 清除首页的缓存数据
        cache.delete('index_page_data')


# class GoodsTypeAdmin(BaseModelAdmin):
#     pass
#
#
# class IndexGoodsBannerAdmin(BaseModelAdmin):
#     pass
#
#
# class IndexTypeGoodsBannerAdmin(BaseModelAdmin):
#     pass
#
#
# class IndexPromotionBannerAdmin(BaseModelAdmin):
#     pass
#
#
#
#
# admin.site.register(GoodsType, GoodsTypeAdmin)
# admin.site.register(IndexGoodsBanner, IndexGoodsBannerAdmin)
# admin.site.register(IndexTypeGoodsBanner, IndexTypeGoodsBannerAdmin)
# admin.site.register(IndexPromotionBanner, IndexPromotionBannerAdmin)
class GoodsSKUAdmin(BaseModelAdmin):
    # 自定义显示的样式
    search_fields = ['name']
    list_display = ['id', 'type', 'goods', 'name', 'price', 'stock', 'sales', 'status']
    list_filter = ['update_time']


class GoodsAdmin(BaseModelAdmin):
    # 自定义显示的样式
    search_fields = ['name']
    list_display = ['id', 'name', 'update_time']
    list_filter = ['update_time']


class GoodsTypeAdmin(BaseModelAdmin):
    search_fields = ['name']
    list_display = ['name', 'logo', 'update_time', 'image']
    list_filter = ['update_time']


class GoodsImageAdmin(BaseModelAdmin):
    search_fields = ['sku']
    list_display = ['sku', 'image', 'update_time']
    list_filter = ['update_time']


class IndexGoodsBannerAdmin(BaseModelAdmin):
    search_fields = ['sku']
    list_display = ['sku', 'image', 'index', 'update_time']
    list_filter = ['update_time']



class IndexTypeGoodsBannerAdmin(BaseModelAdmin):
    search_fields = ['sku']
    list_display = ['type', 'sku', 'display_type', 'index', 'update_time']
    list_filter = ['update_time']


class IndexPromotionBannerAdmin(BaseModelAdmin):
    search_fields = ['name']
    list_display = ['name', 'url', 'image', 'index', 'update_time']
    list_filter = ['update_time']


# Register models here.
admin.site.register(Goods, GoodsAdmin)
admin.site.register(GoodsSKU, GoodsSKUAdmin)
admin.site.register(GoodsType, GoodsTypeAdmin)
admin.site.register(GoodsImage, GoodsImageAdmin)
admin.site.register(IndexGoodsBanner, IndexGoodsBannerAdmin)
admin.site.register(IndexTypeGoodsBanner, IndexTypeGoodsBannerAdmin)
admin.site.register(IndexPromotionBanner, IndexPromotionBannerAdmin)
