import 'dart:convert';
import 'dart:async';

// import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/constants/application_constants.dart';
//import 'dart:developer' as developer;

class CategoriesApiClient{

//  final http.Client httpClient;

  CategoriesApiClient();
  Future<List<Categories>> getCatelist(int categoriesId) async{
    var url = Uri.parse('$appServerUrl/catelist/'+categoriesId.toString());
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
            .map((p) => Categories.fromJson(p))
            .toList();
      }else{
        throw Exception('get categories data failure');
      }
    } else {
      throw Exception('Unable to fetch categories from the REST API');
    }
  }



}