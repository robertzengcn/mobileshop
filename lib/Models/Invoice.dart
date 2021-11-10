import 'package:equatable/equatable.dart';
import './InvoiceProduct.dart';

class Invoice extends Equatable {
  final double totalAmount;
  final double subTotalAmount;
  final double shippingCost;
  final double shippingDiscountCost;
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
    required this.totalAmount,
    required this.subTotalAmount,
    required this.shippingCost,
    required this.shippingDiscountCost,
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
    shippingDiscountCost,
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
    'shippingDiscountCost':shippingDiscountCost,
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
}
