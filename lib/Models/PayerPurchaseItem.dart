import 'package:amigatoy/Models/Money.dart';
import 'package:equatable/equatable.dart';

class PayerPurchaseUnitAmount extends Equatable {
  final Money money;

  const PayerPurchaseUnitAmount({
    required this.money,
  });
  @override
  List<Object> get props => [
    money
  ];
  static PayerPurchaseUnitAmount fromJson(dynamic json) {
    return PayerPurchaseUnitAmount(
        money: json['money']
    );
  }
}