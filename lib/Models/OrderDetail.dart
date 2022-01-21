import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';

class OrderDetail extends Equatable {
  final OrderInfo orderinfo;
  final OrderDelivery orderDelivery;
  final OrderBill orderBill;
  final List<OrderProduct> orderProduct;

  OrderDetail({
    required this.orderinfo,
    required this.orderDelivery,
    required this.orderBill,
    required this.orderProduct
    });
  @override
  List<Object> get props => [orderinfo,orderDelivery,orderBill,orderProduct];

  static OrderDetail fromJson(dynamic json) {
    bool productNull =
    json['order_products'] == null || (json['order_products'].length == 0) ? true : false;
    List<OrderProduct> productsList = [];
    if(!productNull){
      json['order_products'].forEach((value) {
        productsList.add(OrderProduct.fromJson(value));
      });
    }
      return OrderDetail(
          orderinfo: OrderInfo.fromJson(json['info']),
          orderDelivery: OrderDelivery.fromJson(json['delivery']),
          orderBill: OrderBill.fromJson(json['bill']),
        orderProduct: productsList,
      );
  }
}
