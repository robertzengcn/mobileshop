//import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/cartApiClient.dart';


class CartRepository{
//  final CartApiClient cartApiClient;
  CartApiClient cartApiClient=new CartApiClient();
  CartRepository();
  ///add item to cart
  Future<int> addCart(int product_id,int quantity,Map<int, int?>? args) async {
//    await Future.delayed(Duration(seconds: 1));
    int cartQuantity=await cartApiClient.addCart(product_id, quantity, args);
    return cartQuantity;
  }
  ///get total quantity in cart
  Future<int> getCartquantity()async{
    int quantity=await cartApiClient.getCartquantity();
    return quantity;
  }
  ///get cart content list
  Future<CartInfo> getCartcontent()async{
    CartInfo cartInfo=await cartApiClient.getCartcontent();
    return cartInfo;
  }

  ///更新购物车产品数量
  Future<bool> updateCartquanity(String product_id, int quantity) async {
    bool res =
    await cartApiClient.updateCartquanity(product_id, quantity);
  return res;
  }

  ///更新购物车产品数量
  Future<bool> deleteCart(String product_id) async {
    bool res =
    await cartApiClient.deleteCart(product_id);
    return res;
  }

}
