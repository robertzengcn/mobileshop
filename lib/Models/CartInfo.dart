import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';

class CartInfo extends Equatable {

  final List<Cart?> cartlist;
  final CartTotal carttotal;

  CartInfo({
    required this.cartlist,
    required this.carttotal,
  });
  @override
  List<Object> get props => [
    carttotal,
  ];

}