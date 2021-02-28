import 'dart:convert';
import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/constants/application_constants.dart';
import 'dart:developer' as developer;

class ProductApiClient{

  final http.Client httpClient;
  ProductApiClient({@required this.httpClient}) : assert(httpClient != null);

  @override
  Future<List<Product>> getProductlist() async{
    http.Response response = await http.get(
        '$appServerUrl/ProductList',
      headers: {
        'Application-Id': '$appId',
      },
    );
//    developer.log('product api list',
//      name: 'my.app.category',
//      error: response.body,
//    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      if(responseJson['status']==true){
        return (responseJson['data'] as List)
            .map((p) => Product.fromJson(p))
            .toList();
      }else{
        throw Exception('get product data failure');
      }
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  @override
  Future<List<Product>> getFeaturelist() async{
    http.Response response = await http.get(
        '$appServerUrl/Featurelist',
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
            .map((p) => Product.fromJson(p))
            .toList();
      }else{
        throw Exception('get product data failure');
      }

  }
}