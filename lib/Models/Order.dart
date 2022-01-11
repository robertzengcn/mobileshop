import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';

class Order extends Equatable {
  final int ordersId;
  final String datePurchasedtime;
  final String deliveryName;
  final String deliveryCountry;
  final String billingName;
  final String billingCountry;
  final String orderTotal;
  final String ordersStatusName;
  final String? trackNumber;
  final List<OrderProduct> lproduct;
  final double shipingValue;
  final String shipingText;
  final double subtotalValue;
  final String subtotalText;

  Order({
    required this.ordersId,
    required this.datePurchasedtime,
    required this.deliveryName,
    required this.deliveryCountry,
    required this.billingName,
    required this.billingCountry,
    required this.orderTotal,
    required this.ordersStatusName,
    this.trackNumber,
    required this.lproduct,
    required this.shipingText,
    required this.shipingValue,
    required this.subtotalText,
    required this.subtotalValue,
    });
  @override
  List<Object> get props => [ordersId,datePurchasedtime,deliveryName,deliveryCountry,billingName,billingCountry,orderTotal,ordersStatusName,lproduct,shipingText,shipingValue,subtotalText,subtotalValue];

  static Order fromJson(dynamic json) {
    bool productNull =
    json['order_product'] == null || (json['order_product'].length == 0) ? true : false;
    List<OrderProduct> productsList = [];
    if(!productNull){
      json['order_product'].forEach((value) {
        productsList.add(OrderProduct.fromJson(value));
      });
    }

      return Order(ordersId: json['orders_id'] as int,
          datePurchasedtime: json['date_purchased'],
          deliveryName: json['delivery_name'],
          deliveryCountry: json['delivery_country'],
          billingName: json['billing_name'],
          billingCountry: json['billing_country'],
          orderTotal: json['order_total'],
          ordersStatusName: json['orders_status_name'],
        trackNumber: json['track_number'],
       lproduct:productsList,
          shipingText:json['shiping_text'].toString(),
        shipingValue:json['shiping_value'] .toDouble() as double,
          subtotalText:json['subtotal_text'].toString(),
        subtotalValue:json['subtotal_value'] .toDouble() as double,
      );
  }
}
