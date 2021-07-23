import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/constants/application_constants.dart';
import 'dart:io';
import 'dart:developer' as developer;

class ReviewsApiClient{


  @override
  Future<List<Review>> getReviewbypid(int pid) async{
    var url = Uri.parse('$appServerUrl/Review/'+pid.toString());
    http.Response response = await http.get(
        url,
      headers: {
        'Application-Id': '$appId',
      }
    );
//    Future<http.Response> response =httpclient.get('Carouse');

    if (response.statusCode != 200) {
    } else {
      throw Exception('Unable to fetch reviews from the REST API');

    }
//    developer.log('log me 25', name: 'my.app.category', error: jsonEncode(response.body));
      var responseJson = json.decode(response.body);

      if(responseJson['status']==true){

        return (responseJson['data'] as List)
            .map((p) => Review.fromJson(p))
            .toList();
      }else{
        throw Exception('get review data failure');
      }

  }


}