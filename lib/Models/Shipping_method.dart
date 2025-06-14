import 'package:equatable/equatable.dart';

class ShippingMethod extends Equatable {

  final String id;
  final String title;
  final double cost;


  const ShippingMethod({
    required this.id,
    required this.title,
    required this.cost,
  });
  @override
  List<Object> get props => [
    id,
    title,
    cost
  ];

  static ShippingMethod fromJson(dynamic json) {
    return ShippingMethod(
        id: json['id'],
        title:json['title'],
        cost: json['cost'].toDouble() as double,
    );
  }

}