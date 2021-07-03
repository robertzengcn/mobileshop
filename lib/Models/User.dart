import 'package:equatable/equatable.dart';

class User extends Equatable {

  final int id;
  final String username;
  final String token;


  const User({
    required this.id,
    required this.username,
    required this.token
  });
  @override
  List<Object> get props => [
    id,
    username,
    token
  ];

  static User fromJson(dynamic json) {
    return User(
        id: json['id'] as int,
      username: json['username'],
        token:json['token'],
    );
  }

//  String get userToken{
//    return token;
//  }
//  Map<String,dynamic> get map {
//    return {
//      "make": make,
//      "model": model,
//      "manufactureYear":manufactureYear,
//      "color": color,
//    };



}