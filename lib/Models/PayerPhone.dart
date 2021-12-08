import 'package:equatable/equatable.dart';
import './PayerPhoneNumber.dart';

class PayerPhone extends Equatable {

  final PayerPhoneNumber phoneNumber;


  const PayerPhone({
      required this.phoneNumber,
  });
  @override
  List<Object> get props => [
    phoneNumber,
  ];

  static PayerPhone fromJson(dynamic json) {

    return PayerPhone(
      phoneNumber: json['phone_number'],
    );
  }
  toJson() {
    return {
      "phoneNumber": phoneNumber,
    };
  }

}