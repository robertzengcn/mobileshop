import 'package:equatable/equatable.dart';

class Cart extends Equatable {

  final String id;
  final String name;
  final String model;
  final String image;
  final double price;
int quantity;
double? weight;
double final_price;
  final String option_name;
  final String option_value;



  Cart({
    required this.id,
    required this.name,
    required this.model,
    required this.image,
    required this.price,
    required this.quantity,
    this.weight,
    required this.final_price,
    required this.option_name,
    required this.option_value
  });
  @override
  List<Object> get props => [
    id,
    name,
    model,
    image,
    price,
    quantity,
    final_price,
    option_name,
    option_value,
  ];

  static Cart fromJson(dynamic json) {
    double proWeight=0;
    bool weightnull = json['weight'] == null ? true : false;
    if (!weightnull) {
      proWeight=json['weight'].toDouble();
    }
    return Cart(
        id: json['id'],
        name:json['name'],
        model: json['model'],
        image:json['image'],
        quantity:json['quantity'],
        weight:proWeight,
        price:json['price'].toDouble(),
        final_price:json['final_price'].toDouble(),
        option_name:json['option_name'],
        option_value:json['option_name'],
    );
  }


}