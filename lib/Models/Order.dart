import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';

class Order extends Equatable {
  final String ordersId;
  final String datePurchasedtime;
  final String deliveryName;
  final String deliveryCountry;
  final String billingName;
  final String billingCountry;
  final double orderTotal;
  final String ordersStatusName;
  final String? trackNumber;
  final List<Product> lproduct;

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
    });
  @override
  List<Object> get props => [ordersId,datePurchasedtime,deliveryName,deliveryCountry,billingName,billingCountry,orderTotal,ordersStatusName];

  static Order fromJson(dynamic json) {
    bool productNull =
    json['order_product'] == null || (json['order_product'].length == 0) ? true : false;
    List<Product> productsList = [];
    if(!productNull){
      json['order_product'].forEach((value) {
        productsList.add(Product.fromJson(value));
      });
    }

      return Order(ordersId: json['orders_id'],
          datePurchasedtime: json['date_purchased'],
          deliveryName: json['delivery_name'],
          deliveryCountry: json['delivery_country'],
          billingName: json['billing_name'],
          billingCountry: json['billing_country'],
          orderTotal: json['order_total'],
          ordersStatusName: json['orders_status_name'],
        trackNumber: json['track_number'],
       lproduct:productsList,
      );
  }
}
