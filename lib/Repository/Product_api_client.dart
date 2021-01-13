import 'dart:convert';
import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:amigatoy/Models/models.dart';

class ProductApiClient{
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;
  ProductApiClient({@required this.httpClient}) : assert(httpClient != null);

  @override
  Future<List<Product>> getProductlist() async{
    http.Response response = await http.get(
        '$baseUrl/');

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
}