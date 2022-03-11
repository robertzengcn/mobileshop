import 'dart:convert';
import 'dart:async';
import 'package:amigatoy/Models/ListOrder.dart';
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
     String? token=await this.getToken();
    if(token==null){
      throw Exception('token empty');
    }
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
  ///fetch order list
  Future <ListOrder> fetchOrderlist(int start, int length)async{
    var url = Uri.parse('$appServerUrl/OrderList/start/'+start.toString()+'/length/'+length.toString());
    String? token=await this.getToken();
    if(token==null){
      throw Exception('token empty');
    }
    http.Response response = await http.get(
      url,
      headers: {
        'Application-Id': '$appId',
        'Client-Key':token
      },
    );
    // print(token);
    if (response.statusCode != 200) {

      throw Exception('Unable to fetch products from the REST API');
    }
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){
      List<Order?> lorderst=[];
      lorderst=(responseJson['data']['list'] as List)
          .map((p) => Order.fromJson(p))
          .toList();
      int orderNum=responseJson['data']['num'];
      return new ListOrder(lorder:lorderst,totalNum: orderNum);

    }else{
      throw Exception('get product data failure');
    }

  }

  ///fetch order detail
  Future <OrderDetail> getOrderDetail(int orderId)async{
    var url = Uri.parse('$appServerUrl/OrderDetail/'+orderId.toString());
    String? token=await this.getToken();
    if(token==null){
      throw Exception('token empty');
    }
    http.Response response = await http.get(
      url,
      headers: {
        'Application-Id': '$appId',
        'Client-Key':token
      },
    );
    if (response.statusCode != 200) {

      throw Exception('Unable to fetch order detail from the REST API');
    }
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){
      // List<Order?> lorderst=[];
      // lorderst=(responseJson['data']['list'] as List)
      //     .map((p) => Order.fromJson(p))
      //     .toList();
      // int orderNum=responseJson['data']['num'];
      return OrderDetail.fromJson(responseJson['data']);

    }else{
      throw Exception(responseJson['msg']);
    }

  }

}