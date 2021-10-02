import 'dart:convert';
import 'dart:async';
//import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/constants/application_constants.dart';
//import 'dart:developer' as developer;
import 'package:amigatoy/dao/user_dao.dart';
import 'package:amigatoy/Repository/BaseApiClient.dart';

class CustomerAddressApiClient extends BaseApiClient{
  final userDao = UserDao();

  @override
  Future<List<CustomerAddress?>> queryCustomeraddress() async{
    var url = Uri.parse('$appServerUrl/customeraddress');
    String token=await this.getToken();
    http.Response response = await http.get(
        url,
      headers: {
        'Application-Id': '$appId',
        'Client-Key':token
      }
    );
    if (response.statusCode != 200) {
    } else {
      throw Exception('Unable to fetch customer address from the REST API');

    }
//    developer.log('log me 25', name: 'my.app.category', error: jsonEncode(response.body));
      var responseJson = json.decode(response.body);

      if(responseJson['status']==true){
        if(responseJson['data'] ==null){
          return [];
        }
        return (responseJson['data'] as List)
            .map((p) => CustomerAddress.fromJson(p))
            .toList();
      }else{
        throw Exception('get customer address failure');
      }

  }
  ///获取token
//  Future <String> getToken() async{
//    User? user=await userDao.getToken();
//    String token=user!=null?user.usertoken:"";
//    return token;
//  }

}