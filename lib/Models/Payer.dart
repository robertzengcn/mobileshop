import 'package:amigatoy/Models/PayerAddress.dart';
import 'package:amigatoy/Models/PayerPhone.dart';
import 'package:equatable/equatable.dart';
import './PayerName.dart';

class Payer extends Equatable {

  final String emailAddress;
  final PayerName name;
  final PayerPhone payerPhone;
  final PayerAddress payerAddress;

  const Payer({
    required this.emailAddress,
    required this.name,
    required this.payerPhone,
    required this.payerAddress
  });
  @override
  List<Object> get props => [
    emailAddress,
    name,
    payerPhone,
    payerAddress
  ];

  static Payer fromJson(dynamic json) {
    return Payer(
        emailAddress: json['emailAddress'],
        name:json['name'],
        payerPhone: json['payerPhone'],
        payerAddress:json['payerAddress']
    );
  }

  toJson() {
    return {
      "email_address": emailAddress,
      "name": name.toJson(),
      "phone":payerPhone.toJson(),
      "address":payerAddress.toJson()
    };
  }

}