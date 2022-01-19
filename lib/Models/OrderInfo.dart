import 'package:equatable/equatable.dart';
// import 'package:amigatoy/Models/models.dart';

class OrderInfo extends Equatable {
  final int ordersId;
  final String datePurchasedtime;
  final String currency;
  final String paymentMethod;
  final String shippingMethod;
  final String couponCode;
  final double orderTotal;
  final String ordersStatusName;
  final String? trackNumber;
  final double? tax;

  OrderInfo({
    required this.ordersId,
    required this.datePurchasedtime,
    required this.currency,
    required this.paymentMethod,
    required this.shippingMethod,
    required this.couponCode,
    required this.orderTotal,
    required this.ordersStatusName,
    this.trackNumber,
    this.tax,
    });
  @override
  List<Object> get props => [ordersId,datePurchasedtime,currency,paymentMethod,shippingMethod,couponCode,orderTotal,ordersStatusName];

  static OrderInfo fromJson(dynamic json) {

      return OrderInfo(
          ordersId: json['orders_id'] as int,
          datePurchasedtime: json['date_purchased'],
          currency: json['currency'],
          paymentMethod: json['payment_method'],
        shippingMethod: json['shipping_method'],
        orderTotal: json['order_total'].toDouble() as double,
        couponCode: json['coupon_code'],
        ordersStatusName: json['orders_status'],
        trackNumber: json['track_number'],
        tax:json['tax'].toDouble() as double,
      );
  }
}
