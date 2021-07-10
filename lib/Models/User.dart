import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class User extends Equatable {

  final int userid;
  final String username;
  final String usertoken;
  final String? userexpired;//用户数据过期时间


  const User({
    required this.userid,
    required this.username,
    required this.usertoken,
    this.userexpired
  });
  @override
  List<Object> get props => [
    userid,
    username,
    usertoken
  ];
//convert item from json to object
  static User fromJson(dynamic json) {
    int expiretime=DateTime.now().millisecondsSinceEpoch+json['expire'] as int;
    var expireObj = new DateTime.fromMicrosecondsSinceEpoch(expiretime);
    var format = new DateFormat('yyyy-MM-dd HH:mm ss');
    final String userexpire = format.format(expireObj);
    return User(
      userid: json['id'] as int,
      username: json['username'],
      usertoken:json['token'],
      userexpired:userexpire,
    );
  }
  Map<String, dynamic> toDatabaseJson() => {
    //This will be used to convert User objects that
    //are to be stored into the datbase in a form of JSON        "id": this.id,
    "user_id": this.userid,
    "user_name": this.username,
    "user_token":this.usertoken
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