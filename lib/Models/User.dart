import 'package:equatable/equatable.dart';

class User extends Equatable {

  final int userid;
  final String username;
  final String usertoken;


  const User({
    required this.userid,
    required this.username,
    required this.usertoken
  });
  @override
  List<Object> get props => [
    userid,
    username,
    usertoken
  ];
//convert item from json to object
  static User fromJson(dynamic json) {
    return User(
      userid: json['id'] as int,
      username: json['username'],
      usertoken:json['token'],
    );
  }
  Map<String, dynamic> toDatabaseJson() => {
    //This will be used to convert User objects that
    //are to be stored into the datbase in a form of JSON        "id": this.id,
    "userid": this.userid,
    "username": this.username,
    "usertoken":this.usertoken
  };

  factory User.fromMap(Map<String, dynamic> json) => new User(
    userid: json["userid"],
    username: json["username"],
    usertoken: json["usertoken"],
  );


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