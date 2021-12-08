import 'package:equatable/equatable.dart';

class PayerAddress extends Equatable {

  final String address_line_1;
  final String? address_line_2;
  final String admin_area_2;//city,town, or village
  final String admin_area_1; //province, state

  const PayerAddress({
      required this.address_line_1,
    this.address_line_2,
    required this.admin_area_2,
    required this.admin_area_1,
  });
  @override
  List<Object> get props => [
    address_line_1,admin_area_2,admin_area_1
  ];

  static PayerAddress fromJson(dynamic json) {
    return PayerAddress(
      address_line_1:json['address_line_1'],
      address_line_2:json['address_line_2'],
      admin_area_2: json['city'],
      admin_area_1: json['province'],
    );
  }
  toJson() {
    return {
      "address_line_1": address_line_1,
      "address_line_2": address_line_2,
      "admin_area_2": admin_area_2,
      "admin_area_1":admin_area_1
    };
  }

}