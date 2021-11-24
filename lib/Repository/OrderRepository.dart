import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/repository.dart';


class OrderRepository{
//  final CartApiClient cartApiClient;
  OrderApiClient orderApiClient=new OrderApiClient();
  OrderRepository();

  ///create order
  Future<Invoice> createOrder(String payment,String? currency,String? comment,String? shipping) async {

    Invoice invoice=await orderApiClient.createOrder(payment,currency,comment,shipping);
    return invoice;
  }

}
