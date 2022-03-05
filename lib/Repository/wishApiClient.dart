import 'dart:convert';
import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/constants/application_constants.dart';
import 'package:amigatoy/Repository/BaseApiClient.dart';
// import 'package:amigatoy/dao/user_dao.dart';

class WishApiClient extends BaseApiClient{

//  final http.Client httpClient;
  WishApiClient();
  // final userDao = UserDao();

  @override
  Future <int> addWish(int productId) async{
    var url = Uri.parse('$appServerUrl/addWish');


//    User? user=await userDao.getToken();
//    String token=user!=null?user.usertoken:"";
     String? token=await this.getToken();
     if(token==null){
       throw Exception('token empty');
     }

    http.Response response = await http.post(
      url,
      body: {'products_id': productId.toString()},
      headers: {
        'Application-Id': '$appId',
        'Client-Key':token
      },
    );

    if (response.statusCode != 200) {

      throw Exception('Unable to fetch data from the REST API');
    }
      var responseJson = json.decode(response.body);
      if(responseJson['status']==true){
        return responseJson['data']['number'] as int;
//        return User.fromJson(responseJson['data']);
//        return (responseJson['data'] as List)
//            .map((p) => Menu.fromJson(p))
//            .toList();
      }else{
        throw Exception(responseJson['msg']);
      }

  }

  ///获取token
  // Future <String> getToken() async{
  //   String token=await this.getToken();
  //   // String token=user!=null?user.usertoken:"";
  //   return token;
  // }
  @override
  ///check whether the product in wish
  Future <bool> checkWish(int productId) async{
    var url = Uri.parse('$appServerUrl/checkWish');


//    User? user=await userDao.getToken();
//    String token=user!=null?user.usertoken:"";
    String? token=await this.getToken();
    if(token==null){
      return false;
    }
    http.Response response = await http.post(
      url,
      body: {'products_id': productId.toString()},
      headers: {
        'Application-Id': '$appId',
        'Client-Key':token
      },
    );

    if (response.statusCode != 200) {

      throw Exception('Unable check the product in wish from the REST API');
    }
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){
      if(responseJson['data']==true){
        return true;
      }else{
        return false;
      }
    }else{
      throw Exception(responseJson['msg']);
    }

  }


}