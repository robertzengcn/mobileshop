import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:amigatoy/constants/application_constants.dart';
import 'package:amigatoy/Repository/BaseApiClient.dart';
import 'package:amigatoy/Models/models.dart';

class OrderApiClient extends BaseApiClient{

  OrderApiClient();

  @override
  Future <Map<String, dynamic>> createOrder(String payment,String? currency,String? comment,String? shipping) async{
    var url = Uri.parse('$appServerUrl/createOrder');
    Map<String,String?>data;
    data={"payment":payment,
      "currency":currency!=null?currency:"USD",
      "comment":comment!=null?comment:"",
      "shipping":shipping
    };

//    User? user=await userDao.getToken();
//    String token=user!=null?user.usertoken:"";
     String token=await this.getToken();

    http.Response response = await http.post(
      url,
      body: data,
      headers: {
        'Application-Id': '$appId',
        'Client-Key':token
      },
    );

    if (response.statusCode != 200) {

      throw Exception('create order failure');
    }
      var responseJson = json.decode(response.body);
      if(responseJson['status']==true){
        return responseJson['data'];
      }else{
        throw Exception(responseJson['msg']);
      }

  }

}