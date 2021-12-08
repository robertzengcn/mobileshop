import 'package:equatable/equatable.dart';


class PayerPhoneNumber extends Equatable {

  final String phoneNumber;

  const PayerPhoneNumber({
      required this.phoneNumber,
  });
  @override
  List<Object> get props => [
    phoneNumber,
  ];

  static PayerPhoneNumber fromJson(dynamic json) {

    return PayerPhoneNumber(
      phoneNumber: json['phoneNumber'],
    );
  }
  toJson() {
    return {
      "national_number": phoneNumber,
    };
  }

}