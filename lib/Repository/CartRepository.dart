import 'package:meta/meta.dart';
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
  Future<List<Cart>> getCartcontent()async{
    List<Cart> cartList=await cartApiClient.getCartcontent();
    return cartList;
  }

}
