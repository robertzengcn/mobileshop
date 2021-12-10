import 'package:amigatoy/Models/PayerPurchaseUnit.dart';
import './Payer.dart';
import 'package:equatable/equatable.dart';

class PaypalRequest extends Equatable {
  final Payer payer;
  final List<PayerPurchaseUnit> payerpurchaseUnit;

  const PaypalRequest({
    required this.payer,
    required this.payerpurchaseUnit
  });

  @override
  List<Object> get props => [
    payer,
    payerpurchaseUnit,
  ];

  static PaypalRequest fromJson(dynamic json) {
    return PaypalRequest(
      payer: json['payer'],
      payerpurchaseUnit:json['payerpurchaseUnit'],
    );
  }
  toJson() {
    return {
      "payer": payer,
      "payerpurchaseUnit": payerpurchaseUnit,
    };
  }
}