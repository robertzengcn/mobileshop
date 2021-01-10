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

    var responseJson = json.decode(response.body);
    return (responseJson['data'] as List)
        .map((p) => Product.fromJson(p))
        .toList();
  }
}