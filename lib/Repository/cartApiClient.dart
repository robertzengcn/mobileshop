import 'dart:convert';
import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/constants/application_constants.dart';
import 'package:amigatoy/dao/user_dao.dart';

class CartApiClient{

//  final http.Client httpClient;
  CartApiClient();
  final userDao = UserDao();

  @override
  Future <int> addCart(int product_id,int quantity,Map<int, int?>? args) async{
    var url = Uri.parse('$appServerUrl/addCart');
    Map<String,String>data;
    data={"products_id":product_id.toString(),
      "cart_quantity":quantity.toString()
    };
//    for(int i=0;i<args.length;i++){
//      data.addAll({"attriarr[$i]":id[i]});
//    }
    args?.forEach((key, value){
      if(value!=null&&value>0){
        data.addAll({"attriarr[$key]":value.toString()});
      }
    });
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

      throw Exception('Unable to fetch data from the REST API');
    }
      var responseJson = json.decode(response.body);
      if(responseJson['status']==true){
        return responseJson['data']['quantity'] as int;
//        return User.fromJson(responseJson['data']);
//        return (responseJson['data'] as List)
//            .map((p) => Menu.fromJson(p))
//            .toList();
      }else{
        throw Exception(responseJson['msg']);
      }

  }

  ///获取token
  Future <String> getToken() async{
    User? user=await userDao.getToken();
    String token=user!=null?user.usertoken:"";
    return token;
  }
  ///获取购物车种的商品数量
  Future <int> getCartquantity() async{
    var url = Uri.parse('$appServerUrl/getCartquantity');
    String token=await this.getToken();
    http.Response response = await http.get(
      url,
      headers: {
        'Application-Id': '$appId',
        'Client-Key':token
      },
    );
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){
      return responseJson['data'] as int;
//        return User.fromJson(responseJson['data']);
//        return (responseJson['data'] as List)
//            .map((p) => Menu.fromJson(p))
//            .toList();
    }else{
      throw Exception(responseJson['msg']);
    }
  }

  ///获取购物车种的商品
  Future <List<Cart>> getCartcontent() async{
    var url = Uri.parse('$appServerUrl/listCart');
    String token=await this.getToken();
    http.Response response = await http.get(
      url,
      headers: {
        'Application-Id': '$appId',
        'Client-Key':token
      },
    );
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){
      if(responseJson['data']['list']==null){
        return [];
      }

      return (responseJson['data']['list'] as List)
          .map((p) => Cart.fromJson(p))
          .toList();

    }else{
      throw Exception(responseJson['msg']);
    }
  }

  ///获取购物车种的商品
  Future <void> updateCartquanity() async{
    var url = Uri.parse('$appServerUrl/updateCart');
    String token=await this.getToken();
    http.Response response = await http.get(
      url,
      headers: {
        'Application-Id': '$appId',
        'Client-Key':token
      },
    );
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){
      if(responseJson['data']['list']==null){
        return [];
      }

      return (responseJson['data']['list'] as List)
          .map((p) => Cart.fromJson(p))
          .toList();

    }else{
      throw Exception(responseJson['msg']);
    }
  }



}