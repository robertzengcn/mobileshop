import 'package:equatable/equatable.dart';

class Payment extends Equatable {

  final String code;
  final String name;

  Payment({
    required this.code,
    required this.name,
  });
  @override
  List<Object> get props => [
    code,
    name,
  ];

  static Payment fromJson(dynamic json) {

    return Payment(
      code: json['code'].toString(),
      name:json['name'].toString(),
    );
  }


}