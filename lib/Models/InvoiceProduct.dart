import 'package:equatable/equatable.dart';

class InvoiceProduct extends Equatable {
  final String productName;
  final int quantity;
  final double price;
  final String currency;

  const InvoiceProduct({
  required this.productName,
    required this.quantity,
    required this.price,
    required this.currency
  });

  static InvoiceProduct fromJson(dynamic json) {
      return InvoiceProduct(
          productName:json['name'],
          quantity:json['qty'],
          price:json['price'].toDouble(),
        currency:json['currency'],
      );
  }

  @override
  List<Object> get props => [
    productName,quantity,price,currency
  ];
}