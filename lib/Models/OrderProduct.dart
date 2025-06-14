import 'package:equatable/equatable.dart';
// import 'package:amigatoy/Models/Product_options.dart';
import 'package:amigatoy/Models/models.dart';
//import 'dart:convert';

class OrderProduct extends Equatable {
  final int ordersProductsId;
  final int productsId;
  final String productsModel;
  final String productsName;
  final int productsQuantity;
  final double finalPrice;
  final String productsImage;
  final List<OrderProductAttributes>? productAttributes;
  final double? productstax;

  const OrderProduct(
      {required this.ordersProductsId,
      required this.productsId,
      required this.productsModel,
      required this.productsName,
      required this.productsQuantity,
      required this.finalPrice,
      required this.productsImage,
        this.productAttributes,
        this.productstax,
      });
  @override
  List<Object> get props => [
    ordersProductsId,
    productsId,
    productsModel,
    productsName,
    productsQuantity,
    finalPrice,
    productsImage,
      ];

  static OrderProduct fromJson(dynamic json) {
    bool imagenull = json['products_image'] == null ? true : false;
    String imgSrc="";
    if(!imagenull){
      imgSrc=json['products_image'];
    }
    //product attributes
    bool attributesNull =
    json['attributes'] == null || (json['attributes'].length == 0) ? true : false;
    List<OrderProductAttributes> productsAttributesList = [];
    if(!attributesNull){
      json['attributes'].forEach((value) {
        productsAttributesList.add(OrderProductAttributes.fromJson(value));
      });
    }
    double? productTax;
    if(json['products_tax']!=null){
      productTax=json['products_tax'].toDouble() as double;
    }

    return OrderProduct(
        ordersProductsId: json['orders_products_id'] as int,
        productsId :json['products_id'] as int,
        productsModel: json['products_model'],
        productsName: json['products_name'],
        productsQuantity: json['products_quantity'],
        finalPrice: json['final_price'].toDouble() as double,
        productsImage: imgSrc,
        productAttributes:productsAttributesList,
        productstax:productTax
    );
  }
}
