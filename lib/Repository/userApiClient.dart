import 'dart:convert';
import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/constants/application_constants.dart';

class UserApiClient{

//  final http.Client httpClient;
  UserApiClient() ;

  @override
  Future <User> loginAuth(String username,String password) async{
    var url = Uri.parse('$appServerUrl/loginAuth');
    http.Response response = await http.post(
      url,
      body: {'email': username, 'password': password},
      headers: {
        'Application-Id': '$appId',
      },
    );

    if (response.statusCode != 200) {

      throw Exception('Unable to fetch data from the REST API');
    }
      var responseJson = json.decode(response.body);
      if(responseJson['status']==true){
        return User.fromJson(responseJson['data']);
//        return (responseJson['data'] as List)
//            .map((p) => Menu.fromJson(p))
//            .toList();
      }else{
        throw Exception(responseJson['msg']);
      }

  }


}