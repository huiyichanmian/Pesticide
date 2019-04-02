#使用celery
import time
from celery import Celery
from django.core.mail import send_mail
from django.template import loader,RequestContext

from Pesticide import settings
from Pesticide.settings import EMAIL_FROM

# 在任务处理者一端加这几句
import os
import django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Pesticide.settings")
os.environ.setdefault('FORKED_BY_MULTIPROCESSING', '1')
django.setup()

from goods.models import IndexTypeGoodsBanner, IndexGoodsBanner, IndexPromotionBanner, GoodsType

# os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Pesticide.settings")
# os.environ.setdefault('FORKED_BY_MULTIPROCESSING', '1')
# django.setup()

#创建一个Celery类的实例对象
app = Celery('celery_tasks.tasks', broker='redis://10.35.166.81:6379/0')

#定义任务函数
@app.task
def send_register_active_email(to_email, username, token):
    '''发送激活邮件'''
    # 组织邮件信息
    subject = '稼稼乐欢迎信息'
    message = ''
    sender = EMAIL_FROM
    receiver = [to_email]
    html_message = '<h1>%s,欢迎您成为稼稼乐农药网注册会员</h1>请点击下面链接激活您的账户<br><a href="http://10.35.166.81:8888/user/active/%s">http://127.0.0.1:8000/user/active/%s'%(username, token, token)

    send_mail(subject, message, sender, receiver, html_message=html_message)
    time.sleep(5)


@app.task
def generate_static_index_html():
    '''产生首页静态页面'''
    types = GoodsType.objects.all()

    # 获取首页轮播商品信息
    goods_banners = IndexGoodsBanner.objects.all().order_by('index')

    # 获取首页促销信息
    promotion_banners = IndexPromotionBanner.objects.all()

    # 获取首页分类商品展示信息
    # type_goods_banners = IndexTypeGoodsBanner.objects.all()
    for type in types:
        # 获取type种类首页分类商品的图片展示信息
        image_banners = IndexTypeGoodsBanner.objects.filter(type=type, display_type=1).order_by('index')
        # 获取type种类首页分类商品的文字提示信息
        title_banners = IndexTypeGoodsBanner.objects.filter(type=type, display_type=0).order_by('index')

        type.image_banners = image_banners
        type.title_banners = title_banners

        # 组织模板上下文
        context = {
            'types': types,
            'goods_banners': goods_banners,
            'promotion_banners': promotion_banners,
        }

        # 使用模板
        # 1.加载末班文件，返回模板对象
        temp = loader.get_template('static_index.html')
        # # 2.定义模板上下文
        # context = RequestContext(request,context)
        # 2.渲染模板
        static_index_html = temp.render(context)

        # 生成首页对应的静态文件
        save_path = os.path.join(settings.BASE_DIR, 'static/index.html')
        with open(save_path, 'w') as f:
            f.write(static_index_html)

