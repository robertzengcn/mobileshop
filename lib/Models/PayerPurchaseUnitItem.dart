import 'package:amigatoy/Models/Money.dart';
import 'package:equatable/equatable.dart';

class PayerPurchaseUnitItem extends Equatable {
  final String name;
  final Money money;
  final Money? tax;
  final String quantity;
  final String description;
  final String sku;

  const PayerPurchaseUnitItem({
    required this.name,
    required this.money,
    this.tax,
    required this.quantity,
    required this.description,
    required this.sku
  });
  @override
  List<Object> get props => [
    name,money,quantity,description,sku
  ];
  static PayerPurchaseUnitItem fromJson(dynamic json) {
    Money? iTax;
    if(json['tax']!=null) {
      iTax=Money.fromJson(json['tax']);
    }
    return PayerPurchaseUnitItem(
        name: json['name'],
        money:json['money'],
        tax:iTax,
        quantity:json['quantity'],
        description:json['description'],
        sku:json['sku'],
    );
  }
  toJson() {
    return {
      "name": name,
      "money":money,
      "tax":tax,
      "quantity":quantity,
      "description":description,
    "sku":sku
    };
  }
}