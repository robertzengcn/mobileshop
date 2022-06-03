//import 'dart:convert';
import 'dart:async';
//import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
// import 'package:amigatoy/dao/user_dao.dart';
// import 'package:amigatoy/Repository/userApiClient.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BaseApiClient{
  // final userDao = UserDao();
  // UserApiClient userapi=new UserApiClient();


  ///获取token
  Future <String?> getToken() async{
    String _usertokenkey="usertokenkey";
    final storage = new FlutterSecureStorage();
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

    final options = IOSOptions(accessibility: IOSAccessibility.first_unlock);

    // String? token=await userapi.getUsertoken();
    String? tokenStr= await storage.read(key: _usertokenkey,
        iOptions: options,
        aOptions: _getAndroidOptions()
    );
    if (tokenStr != null && tokenStr.length > 0) {
      List<String> tokenArr = tokenStr.split(":");

      if (int.parse(tokenArr[1]) > DateTime.now().millisecondsSinceEpoch) {
        return tokenArr[0];
      } else {
        return null;
      }
    } // String token=user!=null?user.usertoken:"";

  }
}