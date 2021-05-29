import 'dart:convert';
import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/constants/application_constants.dart';

class MenuApiClient{

  final http.Client httpClient;
  MenuApiClient({required this.httpClient}) : assert(httpClient != null);

  @override
  Future<List<Menu>> getMenulist() async{
    http.Response response = await http.get(
        '$appServerUrl/MenuList',
      headers: {
        'Application-Id': '$appId',
      },
    );

    if (response.statusCode != 200) {

      throw Exception('Unable to fetch products from the REST API');
    }
      var responseJson = json.decode(response.body);
      if(responseJson['status']==true){
        return (responseJson['data'] as List)
            .map((p) => Menu.fromJson(p))
            .toList();
      }else{
        throw Exception('get product data failure');
      }

  }
  ///get menu by type
  @override
  Future<List<Menu>> getMenubytype(String type) async{
    http.Response response = await http.get(
        '$appServerUrl/MenuList/?type='+type,
      headers: {
        'Application-Id': '$appId',
      },
    );

    if (response.statusCode != 200) {

      throw Exception('Unable to fetch products from the REST API');
    }
      var responseJson = json.decode(response.body);
      if(responseJson['status']==true){

        return (responseJson['data'] as List)
            .map((p) => Menu.fromJson(p))
            .toList();
      }else{
        throw Exception('get menu data failure');
      }


  }

}