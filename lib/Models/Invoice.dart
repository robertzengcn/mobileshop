import 'package:equatable/equatable.dart';
import './InvoiceProduct.dart';

class Invoice extends Equatable {
  final String orderNumber;
  final double totalAmount;
  final double subTotalAmount;
  final double shippingCost;
  // final double shippingDiscountCost;
  final String userFirstName;
  final String userLastName;
  final String addressCity;
  final String addressStreet;
  final String addressZipCode;
  final String addressCountry;
  final String addressState;
  final String addressPhoneNumber;
  final List<InvoiceProduct> product;

  const Invoice({
    required this.orderNumber,
    required this.totalAmount,
    required this.subTotalAmount,
    required this.shippingCost,
    // required this.shippingDiscountCost,
    required this.userFirstName,
    required this.userLastName,
    required this.addressCity,
    required this.addressStreet,
    required this.addressZipCode,
    required this.addressCountry,
    required this.addressState,
    required this.addressPhoneNumber,
    required this.product
  });
  @override
  List<Object> get props => [
    totalAmount,
    subTotalAmount,
    shippingCost,
    // shippingDiscountCost,
    userFirstName,
    userLastName,
    addressCity,
    addressStreet,
    addressZipCode,
    addressCountry,
    addressState,
    addressPhoneNumber,
    product,
  ];

  Map<String, dynamic> toJson() => {
    'totalAmount': totalAmount,
    'subTotalAmount': subTotalAmount,
    'shippingCost':shippingCost,
    // 'shippingDiscountCost':shippingDiscountCost,
    'userFirstName':userFirstName,
    'userLastName':userLastName,
    'addressCity':addressCity,
    'addressStreet':addressStreet,
    'addressZipCode':addressZipCode,
    'addressCountry':addressCountry,
    'addressState':addressState,
    'addressPhoneNumber':addressPhoneNumber,
    'product':product
  };
  static Invoice fromJson(dynamic json) {
    bool productNull =
    json['product'] == null || (json['product'].length == 0) ? true : false;
    List<InvoiceProduct> productsList = [];
    if(!productNull){
      json['product'].forEach((value) {
        productsList.add(InvoiceProduct.fromJson(value));
      });
    }
    String addressState="";
    if(json['addressState']!=null){
      addressState=json['addressState'];
    }
    return Invoice(
      orderNumber: json['order_number'].toString(),
        totalAmount:json['totalAmount'] .toDouble(),
        subTotalAmount:json['totalAmount'] .toDouble(),
        shippingCost:json['shippingCost'] .toDouble(),
        userFirstName:json['userFirstName'],
        userLastName:json['userLastName'],
        addressCity:json['addressCity'],
      addressStreet:json['addressStreet'],
        addressZipCode:json['addressZipCode'],
        addressCountry:json['addressCountry'],
        addressState:addressState.toString(),
      addressPhoneNumber:json['addressPhoneNumber'].toString(),
       product:productsList,
    );
  }
}
