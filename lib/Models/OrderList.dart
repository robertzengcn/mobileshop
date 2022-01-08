// import 'package:amigatoy/UI/CartUIComponent/Payment.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';

class CartInfo extends Equatable {

  final List<Cart?> cartlist;
  final CartTotal carttotal;
  final List<ShippingMethod?> shippingMethod;
  final List<Payment?> payment;
  final symbol;


  CartInfo({
    required this.cartlist,
    required this.carttotal,
    required this.shippingMethod,
    required this.payment,
    required this.symbol,
  });
  @override
  List<Object> get props => [
    cartlist,carttotal,shippingMethod,payment,symbol
  ];

}