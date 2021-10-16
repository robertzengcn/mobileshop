import 'package:equatable/equatable.dart';
//import 'package:amigatoy/Models/models.dart';

class CustomerAddress extends Equatable {

  final int? addressBookId;
  final String? company;
  final String firstName;
  final String lastName;
  final String streetAddress;
  final String? postcode;
  final String city;
  final String state;
  final int countryId;
  final int? zoneId;
  final String telephone;
  final String? countriesName;
  final String? zoneName;



  CustomerAddress({
    this.addressBookId,
    this.company,
    required this.firstName,
    required this.lastName,
    required this.streetAddress,
    this.postcode,
    required this.city,
    required this.state,
    required this.countryId,
    this.zoneId,
    required this.telephone,
    this.countriesName,
    this.zoneName
  });
  @override
  List<Object> get props => [
    firstName,lastName,streetAddress,city,state,countryId,telephone
  ];
  static CustomerAddress fromJson(dynamic json) {
    String countries_name="";
    if(json['countries_name']!=null){
      countries_name=json['countries_name'].toString();
    }
    String zone_name="";
    if(json['zone_name']!=null){
      zone_name=json['zone_name'].toString();
    }
    int zoneId=0;
    if(json['entry_zone_id']!=null&&json['entry_zone_id']>0){
      zoneId=json['entry_zone_id'];
    }
    return CustomerAddress(
      addressBookId: json['address_book_id'],
      company:json['entry_company'],
      firstName:json['entry_firstname'],
      lastName:json['entry_lastname'],
      streetAddress:json['entry_street_address'],
      postcode:json['entry_postcode'].toString(),
      city:json['entry_city'],
      state:json['entry_state'],
      countryId:json['entry_country_id'],
      zoneId:zoneId,
      telephone:json['entry_telephone'].toString(),
      countriesName:countries_name,
      zoneName:zone_name,
    );
  }
}