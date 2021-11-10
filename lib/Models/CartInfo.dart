import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';

class CartInfo extends Equatable {

  final List<Cart?> cartlist;
  final CartTotal carttotal;
  final List<ShippingMethod?> shippingMethod;


  CartInfo({
    required this.cartlist,
    required this.carttotal,
    required this.shippingMethod,

  });
  @override
  List<Object> get props => [
    cartlist,carttotal,shippingMethod
  ];

}