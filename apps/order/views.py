import os

from datetime import datetime

from django.db import transaction
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.urls import reverse
from django.views.generic.base import View
from django_redis import get_redis_connection
from alipay import AliPay
from django.conf import settings

from goods.models import GoodsSKU
from user.models import Address
from order.models import OrderInfo, OrderGoods

from utils.mixin import LoginRequiredMixin


class OrderPlaceView(LoginRequiredMixin, View):
    '''提交订单页面显示'''
    # 获取参数sku_ids
    def post(self,request):
        '''提交订单页面显示'''
        user = request.user
        # 获取参数sku_ids
        sku_ids = request.POST.getlist('sku_ids')

        # 校验参数
        if not sku_ids:
            # 跳转到购物车页面
            return redirect(reverse('cart:show'))

        conn = get_redis_connection('default')
        cart_key = 'cart_%d' % user.id

        skus = []
        total_count = 0
        total_price = 0
        # 遍历sku_ids获取用户要购买的商品信息
        for sku_id in sku_ids:
            # 根据商品的id获取商品信息
            sku = GoodsSKU.objects.get(id=sku_id)
            # 获取用户所要购买的商品数量
            count = conn.hget(cart_key, sku_id)
            # 计算商品的小计
            amount = sku.price * int(count)

            # 动态给sku增加属性count,保存购买商品数量
            sku.count = int(count)
            # 动态给sku增加属性count,保存购买商品总价格
            sku.amount = amount
            # 追加
            skus.append(sku)
            total_count += int(count)
            total_price += amount

        # 运费：实际开发时候，属于一个子系统
        transit_price = 10  # 写死

        # 实付款
        total_pay = total_price + transit_price

        # 获取用户收货地址
        address = Address.objects.filter(user=user)

        # 组织上下文
        sku_ids = ','.join(sku_ids)
        context = {
            'skus': skus,
            'total_count': int(total_count),
            'total_price': total_price,
            'transit_price': transit_price,
            'total_pay': total_pay,
            'address': address,
            'sku_ids': sku_ids
        }

        # 使用模板
        return render(request, 'place_order.html', context)


# 前端传递的参数:地址id(addr_id) 支付方式(pay_method) 用户要购买的商品id字符串(sku_ids)
# mysql事务: 一组sql操作，要么都成功，要么都失败
# 高并发:秒杀
# 支付宝支付
# class OrderCommitView(View):
#     '''订单创建'''
#     @transaction.atomic
#     def post(self, request):
#         '''订单创建'''
#         # 判断用户是否登录
#         user = request.user
#         if not user.is_authenticated:
#             # 用户未登录
#             return JsonResponse({'res': 0, 'errmsg': '用户未登录'})
#
#         # 接收参数
#         addr_id = request.POST.get('addr_id')
#         pay_method = request.POST.get('pay_method')
#         sku_ids = request.POST.get('sku_ids')  # 1,3
#
#         # 校验参数
#         if not all([addr_id, pay_method, sku_ids]):
#             return JsonResponse({'res': 1, 'errmsg': '参数不完整'})
#
#         # 校验支付方式
#         if pay_method not in OrderInfo.PAY_METHODS.keys():
#             return JsonResponse({'res': 2, 'errmsg': '非法的支付方式'})
#
#         # 校验地址
#         try:
#             addr = Address.objects.get(id=addr_id)
#         except Address.DoesNotExist:
#             # 地址不存在
#             return JsonResponse({'res': 3, 'errmsg': '地址非法'})
#
#         # todo: 创建订单核心业务
#
#         # 组织参数
#         order_id = datetime.now().strftime('%Y%m%d%H%M%S')+str(user.id)
#
#         # 运费
#         transit_price = 10
#
#         # 总数目和总金额
#         total_count = 0
#         total_price = 0
#         # 设置事物保存点
#         save_id = transaction.savepoint()
#         # todo: 向order_info表中添加一条记录
#         try:
#             order = OrderInfo.objects.create(order_id=order_id,
#                                              user=user,
#                                              addr=addr,
#                                              pay_method=pay_method,
#                                              total_count=total_count,
#                                              total_price=total_price,
#                                              transit_price=transit_price)
#
#             # todo: 用户的订单中有几个商品，需要向order_goods表中加入几条记录
#             conn = get_redis_connection('default')
#             cart_key = 'cart_%d' % user.id
#
#             sku_ids = sku_ids.split(',')
#             for sku_id in sku_ids:
#                 # 获取商品的信息
#                 try:
#                     # select * from goods_sku where id=sku_id for update;
#                     sku = GoodsSKU.objects.select_for_update().get(id=sku_id)
#                 except:
#                     # 商品不存在
#                     transaction.savepoint_rollback(save_id)
#                     return JsonResponse({'res': 4, 'errmsg': '商品不存在'})
#
#                 print('user:%d stock:%d' % (user.id, sku_id))
#                 # 从redis中获取用户所要购买的商品的数量
#                 count = conn.hget(cart_key, sku_id)
#
#                 # todo: 判断商品的库存
#                 if int(count) > sku.stock:
#                     transaction.savepoint_rollback(save_id)
#                     return JsonResponse({'res': 6, 'errmsg': '商品库存不足'})
#
#                 # todo: 向order_goods表中添加一条记录
#                 OrderGoods.objects.create(order=order,
#                                           sku=sku,
#                                           count=count,
#                                           price=sku.price)
#
#                 # todo: 更新商品的库存和销量
#                 sku.stock -= int(count)
#                 sku.sales += int(count)
#                 sku.save()
#
#                 # todo: 累加计算订单商品的总数量和总价格
#                 amount = sku.price*int(count)
#                 total_count += int(count)
#                 total_price += amount
#
#             # todo: 更新订单信息表中的商品的总数量和总价格
#             order.total_count = total_count
#             order.total_price = total_price
#             order.save()
#         except Exception as e:
#             transaction.savepoint_rollback(save_id)
#             return JsonResponse({'res': 7, 'errmsg': '下单失败'})
#
#         # 提交事物
#         transaction.savepoint_commit(save_id)
#         # todo: 清除用户购物车中对应的记录
#         conn.hdel(cart_key, *sku_ids)
#
#         # 返回应答
#         return JsonResponse({'res': 5, 'message': '创建成功'})

class OrderCommitView1(View):
    '''订单创建'''
    def post(self, request):
        '''订单创建'''
        # 判断用户是否登录
        user = request.user
        if not user.is_authenticated:
            # 用户未登录
            return JsonResponse({'res':0, 'errmsg':'用户未登录'})

        # 接收参数
        addr_id = request.POST.get('addr_id')
        pay_method = request.POST.get('pay_method')
        sku_ids = request.POST.get('sku_ids') # 1,3

        # 校验参数
        if not all([addr_id, pay_method, sku_ids]):
            return JsonResponse({'res':1, 'errmsg':'参数不完整'})

        # 校验支付方式
        if pay_method not in OrderInfo.PAY_METHODS.keys():
            return JsonResponse({'res':2, 'errmsg':'非法的支付方式'})

        # 校验地址
        try:
            addr = Address.objects.get(id=addr_id)
        except Address.DoesNotExist:
            # 地址不存在
            return JsonResponse({'res':3, 'errmsg':'地址非法'})

        # todo: 创建订单核心业务

        # 组织参数
        # 订单id
        order_id = datetime.now().strftime('%Y%m%d%H%M%S')+str(user.id)

        # 运费
        transit_price = 10

        # 总数目和总金额
        total_count = 0
        total_price = 0

        # todo: 向order_info表中添加一条记录
        order = OrderInfo.objects.create(order_id=order_id,
                                         user=user,
                                         addr=addr,
                                         pay_method=pay_method,
                                         total_count=total_count,
                                         total_price=total_price,
                                         transit_price=transit_price)

        # todo: 用户的订单中有几个商品，需要向df_order_goods表中加入几条记录
        conn = get_redis_connection('default')
        cart_key = 'cart_%d'%user.id

        sku_ids = sku_ids.split(',')
        for sku_id in sku_ids:
            # 获取商品的信息
            try:
                sku = GoodsSKU.objects.get(id=sku_id)
            except:
                # 商品不存在
                return JsonResponse({'res':4, 'errmsg':'商品不存在'})

            # 从redis中获取用户所要购买的商品的数量
            count = conn.hget(cart_key, sku_id)

            # todo: 向rder_goods表中添加一条记录
            OrderGoods.objects.create(order=order,
                                      sku=sku,
                                      count=count,
                                      price=sku.price)

            # todo: 更新商品的库存和销量
            sku.stock -= int(count)
            sku.sales += int(count)
            sku.save()

            # todo: 累加计算订单商品的总数量和总价格
            amount = sku.price*int(count)
            total_count += int(count)
            total_price += amount

        # todo: 更新订单信息表中的商品的总数量和总价格
        order.total_count = total_count
        order.total_price = total_price
        order.save()

        # todo: 清除用户购物车中对应的记录
        conn.hdel(cart_key, *sku_ids)

        # 返回应答
        return JsonResponse({'res':5, 'message':'创建成功'})

class OrderCommitView(View):
    @transaction.atomic
    def post(self, request):
        """创建订单"""

        user = request.user
        if not user.is_authenticated:
            return JsonResponse({'res': 0, 'errmsg': '用户未登录'})

        # 接收数据
        addr_id = request.POST.get('addr_id')
        pay_method = request.POST.get('pay_method')
        sku_ids = request.POST.get('sku_ids')

        if not all([addr_id, pay_method, sku_ids]):
            return JsonResponse({'res': 1, 'errmsg': '参数不完整'})

        if pay_method not in OrderInfo.PAY_METHODS.keys():
            return JsonResponse({'res': 2, 'errmsg': '非法的支付方式'})

        try:
            addr = Address.objects.get(id=addr_id)
        except Address.DoesNotExist:
            return JsonResponse({'res': 3, 'errmsg': '地址不存在'})

        order_id = datetime.now().strftime('%Y%m%d%H%M%S') + str(user.id)

        transit_price = 10

        total_count = 0
        total_price = 0

        save_id = transaction.savepoint()
        try:
            order = OrderInfo.objects.create(order_id=order_id,
                                             user=user,
                                             addr=addr,
                                             pay_method=pay_method,
                                             total_count=total_count,
                                             total_price=total_price,
                                             transit_price=transit_price)

            conn = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id

            sku_ids = sku_ids.split(',')
            for sku_id in sku_ids:
                # 获取商品信息
                try:
                    # 悲观锁：select * from df_goods_sku where id=sku_id for update; for update 为加琐操作
                    sku = GoodsSKU.objects.select_for_update().get(id=sku_id)
                except Exception as e:
                    print(e)
                    transaction.savepoint_rollback(save_id)
                    return JsonResponse({'res': 4, 'errmsg': '商品不存在'})

                # 从redis中获取商品和数量
                count = conn.hget(cart_key, sku_id)
                # 判断商品库存
                if int(count) > sku.stock:
                    transaction.savepoint_rollback(save_id)
                    return JsonResponse({'res': 6, 'errmsg': '商品库存不足'})

                # 向数据库订单表中添加数据
                OrderGoods.objects.create(order=order,
                                          sku=sku,
                                          count=count,
                                          price=sku.price)

                # 更新商品库存
                sku.stock -= int(count)
                sku.sales += int(count)
                sku.save()

                # 累计
                amount = int(count) * sku.price
                total_count += int(count)
                total_price += amount

            # 更新订单中的数据
            order.total_count = int(total_count)
            order.total_price = total_price
            order.save()

        except Exception as e:
            print(e)
            transaction.savepoint_rollback(save_id)
            return JsonResponse({'res': 7, 'errmsg': '下单失败'})

        # 提交事务
        transaction.savepoint_commit(save_id)

        # 移除购物车记录
        conn.hdel(cart_key, *sku_ids)
        return JsonResponse({'res':5, 'message': '下单成功'})
# ajax post
# 前端传递的参数:订单id(order_id)
# /order/pay
class OrderPayView(View):
    '''订单支付'''
    def post(self, request):
        '''订单支付'''
        # 用户是否登录
        user = request.user
        if not user.is_authenticated:
            return JsonResponse({'res':0, 'errmsg':'用户未登录'})

        # 接收参数
        order_id = request.POST.get('order_id')

        # 校验参数
        if not order_id:
            return JsonResponse({'res':1, 'errmsg':'无效的订单id'})

        try:
            order = OrderInfo.objects.get(order_id=order_id,
                                          user=user,
                                          pay_method=3,
                                          order_status=1)
        except OrderInfo.DoesNotExist:
            return JsonResponse({'res':2, 'errmsg':'订单错误'})

        # 业务处理:使用python sdk调用支付宝的支付接口
        # 初始化

        alipay = AliPay(
            appid="2016092700605492", # 应用id
            app_notify_url=None,  # 默认回调url
            app_private_key_path=open(os.path.join(settings.BASE_DIR, 'apps\\order\\app_private_key.pem')).read(),
            alipay_public_key_path=open(os.path.join(settings.BASE_DIR, 'apps\\order\\alipay_public_key.pem')).read(),

            sign_type="RSA2",  # RSA 或者 RSA2
            debug=True  # 默认False
        )

        # 调用支付接口
        # 电脑网站支付，需要跳转到https://openapi.alipaydev.com/gateway.do? + order_string
        total_pay = order.total_price+order.transit_price # Decimal
        order_string = alipay.api_alipay_trade_page_pay(
            out_trade_no=order_id, # 订单id
            total_amount=str(total_pay), # 支付总金额
            subject='稼稼乐农药网%s'%order_id,
            return_url=None,
            notify_url=None  # 可选, 不填则使用默认notify url
        )

        # 返回应答
        pay_url = 'https://openapi.alipaydev.com/gateway.do?' + order_string
        return JsonResponse({'res':3, 'pay_url':pay_url})


