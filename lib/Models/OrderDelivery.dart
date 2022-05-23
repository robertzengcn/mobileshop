import 'package:equatable/equatable.dart';
// import 'package:amigatoy/Models/models.dart';

class OrderDelivery extends Equatable {
  final String name;
  final String? company;
  final String country;
  final String? suburb;
  final String city;
  final String postcode;
  final String state;
  final String countryCode;
  final String streetAddress;

  OrderDelivery({
    required this.name,
    this.company,
    required this.country,
    this.suburb,
    required this.city,
    required this.postcode,
    required this.state,
    required this.countryCode,
    required this.streetAddress,
    });
  @override
  List<Object> get props => [name,country,city,postcode,state,countryCode];

  static OrderDelivery fromJson(dynamic json) {

      return OrderDelivery(
        name: json['name'].toString(),
        company: json['company']?.toString(),
        country: json['country'].toString(),
        suburb: json['suburb'].toString(),
        city: json['city'].toString(),
        postcode: json['postcode'].toString(),
        state: json['state'].toString(),
        countryCode: json['country_code'].toString(),
          streetAddress:json['street_address'].toString(),
      );
  }
}
