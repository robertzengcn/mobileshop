import 'package:equatable/equatable.dart';

class Product extends Equatable {

  final int products_id;
  final int products_quantity;
  final String products_model;
  final String products_image;
  final double products_price;
  final double products_weight;

  const Product({
    this.products_id,
    this.products_quantity,
    this.products_model,
    this.products_image,
    this.products_price,
    this.products_weight
  });
  @override
  List<Object> get props => [
    products_id,
    formattedCondition,
    minTemp,
    temp,
    maxTemp,
    locationId,
    created,
    lastUpdated,
    location,
  ];


}