import 'package:equatable/equatable.dart';
import './PayerPurchaseUnitAmount.dart';

class PayerPurchaseUnit extends Equatable {
  final PayerPurchaseUnitAmount amount;
  final String description;

  const PayerPurchaseUnit({
    required this.amount,
    required this.description
  });

  @override
  List<Object> get props => [
    amount
  ];
}