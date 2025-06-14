import 'package:equatable/equatable.dart';
// import 'package:intl/intl.dart';
import 'package:amigatoy/Repository/repository.dart';

class User extends Equatable {

  final int userid;
  final String username;
  final String usertoken;
  final String userexpired;//the expire time of token


  const User({
    required this.userid,
    required this.username,
    required this.usertoken,
    required this.userexpired
  });
  @override
  List<Object> get props => [
    userid,
    username,
    usertoken
  ];
//convert item from json to object
  static User fromJson(dynamic json){

   // print(json);
//    int expiretime=DateTime.now().millisecondsSinceEpoch+json['expire'] as int;
//    print('expiretime:'+expiretime.toString());
//     var today = DateTime.now();
//     var expireObj = today.add(const Duration(days: 30));
// //    var expireObj = new DateTime.fromMicrosecondsSinceEpoch(expiretime);
//     var format = new DateFormat('yyyy-MM-dd HH:mm ss');
//     final String userexpire = format.format(expireObj);
//     final String userexpire =(DateTime.now().millisecondsSinceEpoch+2592000000).toString();
    final String userexpire =(DateTime.now().millisecondsSinceEpoch+json['token_expire']).toString();
//    print(userexpire);
//     UserRepository userRepository=new UserRepository();

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
    "user_token":this.usertoken,
    "user_expired":this.userexpired
  };

  factory User.fromMap(Map<String, dynamic> json) => new User(
    userid: json["user_id"],
    username: json["user_name"],
    usertoken: json["user_token"],
      userexpired:json["user_expired"],
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