import 'package:equatable/equatable.dart';

class Product extends Equatable {

  final int products_id;
  final int products_quantity;
  final String products_name;
  final String products_model;
  final String products_image;
  final double products_price;
  final double products_weight;
  final List<dynamic>? products_image_list;
  final String? products_description;
  final String? products_shortdesc;//产品简要描述

  const Product({
    required this.products_id,
    required this.products_quantity,
    required this.products_name,
    required this.products_model,
    required this.products_image,
    required this.products_price,
    required this.products_weight,
    this.products_image_list,
    this.products_description,
    this.products_shortdesc
  });
  @override
  List<Object> get props => [
    products_id,
    products_quantity,
    products_name,
    products_model,
    products_image,
    products_price,
    products_weight,
  ];

  static Product fromJson(dynamic json) {
   bool imagenull=json['image_list'] == null ?true: false;
   List<String> products_image_list=[];
   if(!imagenull){//
     json['image_list'].map((value) {
       products_image_list.add(value.fullurl);
     });
   }
   print(products_image_list);
    return Product(
      products_name:json['products_name'],
      products_id: json['products_id'] as int,
      products_quantity: json['products_quantity'] as int,
      products_model: json['products_model'],
      products_image: json['products_image'],
      products_price: json['products_price'].toDouble() as double,
      products_weight: json['products_weight'].toDouble() as double,
        products_image_list:products_image_list,
        products_description:json['products_description'],
        products_shortdesc:json['products_shortdesc']
    );
  }


}