import 'package:equatable/equatable.dart';

class Money extends Equatable {
  final String currencyCode;
  final String value;

  const Money({
    required this.currencyCode,
    required this.value
  });
  @override
  List<Object> get props => [
    currencyCode,value
  ];
  static Money fromJson(dynamic json) {

    return Money(
      currencyCode: json['currency_code'],
        value: json['value'],
    );
  }
  toJson() {
    return {
      "currency_code": currencyCode,
      "value":value,
    };
  }
}