//import 'dart:convert';
import 'dart:async';
//import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/dao/user_dao.dart';

class BaseApiClient{
  final userDao = UserDao();
  ///获取token
  Future <String> getToken() async{
    User? user=await userDao.getToken();
    String token=user!=null?user.usertoken:"";
    return token;
  }
}