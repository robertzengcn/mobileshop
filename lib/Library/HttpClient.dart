import 'package:meta/meta.dart';
import 'package:amigatoy/constants/application_constants.dart';
import 'package:http/http.dart' as http;

class HttpClient{
  final http.Client httpClient;
  HttpClient({required this.httpClient}) : assert(httpClient != null);

  Future<http.Response> get(String request) async{
    return await http.get(
        '$appServerUrl/'+request,
        headers: {
          'Application-Id': '$appId',
        }
    );

  }
}