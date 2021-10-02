import 'package:equatable/equatable.dart';
//import 'package:amigatoy/Models/models.dart';

class CustomerAddress extends Equatable {

  final int addressBookId;
  final String? company;
  final String firstName;
  final String lastName;
  final String streetAddress;
  final String postcode;
  final String city;
  final String state;
  final String countryId;
  final int? zoneId;
  final String telephone;



  CustomerAddress({
    required this.addressBookId,
    this.company,
    required this.firstName,
    required this.lastName,
    required this.streetAddress,
    required this.postcode,
    required this.city,
    required this.state,
    required this.countryId,
    this.zoneId,
    required this.telephone
  });
  @override
  List<Object> get props => [
    addressBookId,firstName,lastName,streetAddress,postcode,city,state,countryId,telephone
  ];
  static CustomerAddress fromJson(dynamic json) {

    return CustomerAddress(
      addressBookId: json['address_book_id'],
      company:json['entry_company'],
      firstName:json['entry_firstname'],
      lastName:json['entry_lastname'],
      streetAddress:json['entry_street_address'],
      postcode:json['entry_postcode'],
      city:json['entry_city'],
      state:json['entry_state'],
      countryId:json['entry_country_id'],
      zoneId:json['entry_zone_id'],
      telephone:json['entry_telephone'],
    );
  }
}