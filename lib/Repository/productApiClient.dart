import 'dart:convert';
import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/constants/application_constants.dart';
//import 'dart:developer' as developer;

class ProductApiClient{

//  final http.Client httpClient;

  ProductApiClient();


  Future<List<Product>> getProductlist() async{
    var url = Uri.parse('$appServerUrl/ProductList');
    http.Response response = await http.get(
      url,
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


  Future<ListProduct> getFeaturelist(int start, int length) async{
    var url = Uri.parse('$appServerUrl/Featurelist/start/$start/length/$length');
    http.Response response = await http.get(
      url,
      headers: {
        'Application-Id': '$appId',
      },
    );


    if (response.statusCode != 200) {

      throw Exception('Unable to fetch feature products from the REST API');
    }
      var responseJson = json.decode(response.body);
      if(responseJson['status']==true){
        List<Product?> lproduct=(responseJson['data']['list'] as List)
            .map((p) => Product.fromJson(p))
            .toList();
        return new ListProduct(lproduct:lproduct,totalNum: responseJson['data']['num']);
      }else{
        throw Exception('get product data failure');
      }

  }

  ///从api处获取产品
  Future <Product> getProductbyid(int id) async{
    var url = Uri.parse('$appServerUrl/getProduct/'+id.toString());
    http.Response response = await http.get(
      url,
      headers: {
        'Application-Id': '$appId',
      },
    );


    if (response.statusCode != 200) {

      throw Exception('Unable to get product from the REST API');
    }
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){

      return Product.fromJson(responseJson['data']);

    }else{
      throw Exception('get product data failure');
    }

  }
  ///get relative product by product pid
  Future<List<Product>> getRelativelist(int pid) async{
    var url = Uri.parse('$appServerUrl/Related/'+pid.toString());
    http.Response response = await http.get(
      url,
      headers: {
        'Application-Id': '$appId',
      },
    );


    if (response.statusCode != 200) {

      throw Exception('Unable to fetch relative products from the REST API');
    }
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){

      return (responseJson['data'] as List)
          .map((p) => Product.fromJson(p))
          .toList();
    }else{
      throw Exception('get relative product data failure');
    }

  }

  ///get special product list
  Future<List<Product>> getSpeciallist(int start, int length) async{
    var url = Uri.parse('$appServerUrl/Special/start/'+start.toString()+'/length/'+length.toString());
    http.Response response = await http.get(
      url,
      headers: {
        'Application-Id': '$appId',
      },
    );


    if (response.statusCode != 200) {

      throw Exception('Unable to fetch special products list from the REST API');
    }
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){

      return (responseJson['data'] as List)
          .map((p) => Product.fromJson(p))
          .toList();
    }else{
      throw Exception('get special product list failure');
    }

  }
}