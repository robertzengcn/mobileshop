import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/repository.dart';


class OrderRepository{
//  final CartApiClient cartApiClient;
  OrderApiClient orderApiClient=new OrderApiClient();
  OrderRepository();

  ///create order
  Future<Object> createOrder(String payment,String? currency,String? comment,String? shipping) async {

    Object paypalRequest=await orderApiClient.createOrder(payment,currency,comment,shipping);

    return paypalRequest;
  }

}
