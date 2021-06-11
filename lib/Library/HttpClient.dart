import 'package:meta/meta.dart';
import 'package:amigatoy/constants/application_constants.dart';
import 'package:http/http.dart' as http;


class HttpClient{
//  HttpClient client = new HttpClient();
//  HttpClient({required this.httpClient}) : assert(httpClient != null);

  Future<http.Response> get(String request) async{
    var url = Uri.parse('$appServerUrl/'+request);
    return await http.get(
        url,
        headers: {
          'Application-Id': '$appId',
        }
    );

  }
}