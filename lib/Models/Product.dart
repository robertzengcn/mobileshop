import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/Product_options.dart';
import 'package:amigatoy/Models/Product_attributes.dart';
//import 'dart:convert';

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
  final String? products_shortdesc; //产品简要描述
  final Map<int, List<ProductAtttibutes>>? products_attributor;
  final Map<int, ProductOptions>? products_option;
  final double? product_specials;
  final int? product_sales;//how many product sale out
  final int? product_wish;// how many people add it to wish list

  const Product(
      {required this.products_id,
      required this.products_quantity,
      required this.products_name,
      required this.products_model,
      required this.products_image,
      required this.products_price,
      required this.products_weight,
      this.products_image_list,
      this.products_description,
      this.products_shortdesc,
      this.products_attributor,
      this.products_option,
        this.product_specials,
        this.product_sales,
        this.product_wish,
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
    bool imagenull = json['image_list'] == null ? true : false;
    bool attrnull = json['attrlist'] == null || (json['attrlist'].length == 0)
        ? true
        : false;

    bool optionnull =
        json['optlist'] == null || (json['optlist'].length == 0) ? true : false;
    List<String> products_image_list = [];
    if (!imagenull) {
      json['image_list'].forEach((value) {

        products_image_list.add(value['fullurl']);
      });

    }
    Map<int, List<ProductAtttibutes>> productattributes = new Map();
    Map<int, ProductOptions> productoption = new Map();

//   productattributes=Map.fromEntries(json['attrlist'].map((e) => MapEntry(e.key, e.val)));
//   print(products_image_list);
//    var map = Map<String, int>.fromIterable(json['attrlist'],
//        key: (item) => item.toString(),
//        value: (item) => item * item);
    if (!attrnull) {

      json['attrlist']?.forEach((i, v) {
        productattributes[int.parse(i)] = [];
        v.forEach((item) {
          productattributes[int.parse(i)]
              ?.add(ProductAtttibutes.fromJson(item));
        });
      });
    }
    if(!optionnull) {
      json['optlist']?.forEach((i, v) {
        productoption[int.parse(i)] = ProductOptions.fromJson(v);
      });
    }
    double products_specials=0;
    if(json['products_specials'] !=null){
      products_specials=json['products_specials'].toDouble();
    }
    int product_sales=0;
    if(json['products_sales'] !=null){
      product_sales=json['products_sales'] as int;
    }
    int product_wish=0;
    if(json['products_wish'] !=null){
      product_wish=json['products_wish'] as int;
    }

    return Product(
        products_name: json['products_name'],
        products_id: json['products_id'] as int,
        products_quantity: json['products_quantity'] as int,
        products_model: json['products_model'].toString(),
        products_image: json['products_image'],
        products_price: json['products_price'].toDouble() as double,
        products_weight: json['products_weight'].toDouble() as double,
        products_image_list: products_image_list,
        products_description: json['products_description'],
        products_shortdesc: json['products_shortdesc'],
        products_attributor: productattributes,
        products_option: productoption,
        product_specials:products_specials,
        product_sales:product_sales,
        product_wish:product_wish
    );
  }
}
