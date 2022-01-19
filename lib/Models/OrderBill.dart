import 'package:equatable/equatable.dart';
// import 'package:amigatoy/Models/models.dart';

class OrderBill extends Equatable {
  final String name;
  final String? company;
  final String country;
  final String? suburb;
  final String city;
  final String postcode;
  final double state;
  final String countryCode;
  final String streetAddress;

  OrderBill({
    required this.name,
    this.company,
    required this.country,
    this.suburb,
    required this.city,
    required this.postcode,
    required this.state,
    required this.countryCode,
    required this.streetAddress
    });
  @override
  List<Object> get props => [name,country,city,postcode,state,countryCode,streetAddress];

  static OrderBill fromJson(dynamic json) {
      return OrderBill(
        name: json['name'],
        company: json['company'],
        country: json['country'],
        suburb: json['suburb'],
        city: json['city'],
        postcode: json['postcode'],
        state: json['state'],
        countryCode: json['country_code'],
        streetAddress:json['street_address'],
      );
  }
}
