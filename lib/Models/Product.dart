import 'package:equatable/equatable.dart';

class Product extends Equatable {

  final int products_id;
  final int products_quantity;
  final String products_name;
  final String products_model;
  final String products_image;
  final double products_price;
  final double products_weight;

  const Product({
    required this.products_id,
    required this.products_quantity,
    required this.products_name,
    required this.products_model,
    required this.products_image,
    required this.products_price,
    required this.products_weight
  });
  @override
  List<Object> get props => [
    products_id,
    products_quantity,
    products_name,
    products_model,
    products_image,
    products_price,
    products_weight
  ];

  static Product fromJson(dynamic json) {
    return Product(
      products_name:json['products_name'],
      products_id: json['products_id'] as int,
      products_quantity: json['products_quantity'] as int,
      products_model: json['products_model'],
      products_image: json['products_image'],
      products_price: json['products_price'].toDouble() as double,
      products_weight: json['products_weight'].toDouble() as double,
    );
  }


}