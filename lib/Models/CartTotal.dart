import 'package:equatable/equatable.dart';

class CartTotal extends Equatable {

  final double totalPrice;
  final double totalWeight;




  CartTotal({
    required this.totalPrice,
    required this.totalWeight,
  });
  @override
  List<Object> get props => [
    totalPrice,
    totalWeight,
  ];

  static CartTotal fromJson(dynamic json) {

    return CartTotal(
      totalPrice: json['total'].toDouble(),
      totalWeight:json['weight'].toDouble(),
    );
  }


}