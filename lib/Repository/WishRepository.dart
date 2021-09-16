import 'dart:async';

import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/repository.dart';


class WishRepository {
WishApiClient wishApiClient=new WishApiClient();

  WishRepository();

  Future<int> addWish(int productId) async {

    int cartQuantity=await wishApiClient.addWish(productId);
    return cartQuantity;
  }

  ///check whether the product in wish list
Future<bool> checkWish(int productId) async {

  bool productWish=await wishApiClient.checkWish(productId);
  return productWish;
}


}
