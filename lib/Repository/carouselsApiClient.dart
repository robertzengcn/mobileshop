import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/constants/application_constants.dart';

import 'dart:developer' as developer;

class CarouselsApiClient{

  final http.Client httpClient;
  CarouselsApiClient({required this.httpClient}) : assert(httpClient != null);

  @override
  Future<List<Carousel>> getCarousellist() async{

    http.Response response = await http.get(
        '$appServerUrl/Carouse',
      headers: {
        'Application-Id': '$appId',
      }
    );
//    Future<http.Response> response =httpclient.get('Carouse');

    if (response.statusCode != 200) {
    } else {
      throw Exception('Unable to fetch products from the REST API');

    }
//    developer.log('log me 25', name: 'my.app.category', error: jsonEncode(response.body));
      var responseJson = json.decode(response.body);

      if(responseJson['status']==true){
        return (responseJson['data'] as List)
            .map((p) => Carousel.fromJson(p))
            .toList();
      }else{
        throw Exception('get product data failure');
      }

  }

  ///get carousel by type
  @override
  Future<List<Carousel>> getCarouselbytype(String type) async{
    http.Response response = await http.get(
        '$appServerUrl/Carouse/?type='+type,
          headers: {
        'Application-Id': '$appId',
      },
    );
//    developer.log('log me',
//        name: 'my.app.category',
//        error: response.body,
//    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      if(responseJson['status']==true){
        return (responseJson['data'] as List)
            .map((p) => Carousel.fromJson(p))
            .toList();
      }else{
        throw Exception('get menu data failure');
      }
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }

  }

}