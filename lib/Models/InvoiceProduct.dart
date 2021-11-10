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

  @override
  List<Object> get props => [

  ];
}