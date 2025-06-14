import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/repository.dart';


class OrderRepository{
//  final CartApiClient cartApiClient;
  OrderApiClient orderApiClient=new OrderApiClient();
  OrderRepository();

  ///create order
  Future<Map<String, dynamic>> createOrder(String payment,String? currency,String? comment,String? shipping,String? platform ) async {

    Map<String, dynamic> paypalRequest=await orderApiClient.createOrder(payment,currency,comment,shipping,platform);

    return paypalRequest;
  }
  ///fetch order list
  Future<ListOrder>featchOrderlist(int start, int length) async{
    ListOrder orderlst =await orderApiClient.fetchOrderlist(start,length);
    return orderlst;
  }

  ///fetch order detail
  Future<OrderDetail>featchOrderdetail(int orderId) async{
    OrderDetail orderdetail =await orderApiClient.getOrderDetail(orderId);
    return orderdetail;
  }
  ///check order has been make payment success
  Future <void> checkOrderpayment(int orderId) async{
    await orderApiClient.checkOrderpayment(orderId);
  }

}
