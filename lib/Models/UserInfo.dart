import 'package:equatable/equatable.dart';
// import 'package:intl/intl.dart';


class UserInfo extends Equatable {

  final int userid;
  final String firstname;
  final String lastname;
  final String emailAddress;
  final String telephone;//the expire time of token


  const UserInfo({
    required this.userid,
    required this.firstname,
    required this.lastname,
    required this.emailAddress,
    required this.telephone
  });
  @override
  List<Object> get props => [
    userid,
    firstname,
    lastname,
    emailAddress,
    telephone,
  ];
//convert item from json to object
  static UserInfo fromJson(dynamic json){

    return UserInfo(
      userid: json['customers_id'] as int,
      firstname: json['customers_firstname'],
      lastname:json['customers_lastname'],
      emailAddress:json['customers_email_address'],
      telephone:json['customers_telephone'].toString(),
    );
  }

}