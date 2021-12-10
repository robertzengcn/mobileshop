import 'package:equatable/equatable.dart';
import './PayerPurchaseUnitAmount.dart';
import './PayerPurchaseUnitItem.dart';

class PayerPurchaseUnit extends Equatable {
  final PayerPurchaseUnitAmount amount;
  final String description;
  final String customId;
  final String invoiceId;
  final List<PayerPurchaseUnitItem> item;

  const PayerPurchaseUnit({
    required this.amount,
    required this.description,
    required this.customId,
    required this.invoiceId,
    required this.item,
  });

  @override
  List<Object> get props => [
    amount,description,customId,invoiceId,item
  ];
  static PayerPurchaseUnit fromJson(dynamic json) {
    return PayerPurchaseUnit(
        amount: json['money'],
        description:json['description'],
        customId:json['custom_id'],
        invoiceId:json['invoice_id'],
        item:json['item']
    );
  }

  toJson() {
    return {
      "amount": amount,
      "description": description,
      "custom_id":customId,
      "invoice_id":invoiceId,
      "item":item.map((e) =>e.toJson()).toList(),
    };
  }
}