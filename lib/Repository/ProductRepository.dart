import 'package:meta/meta.dart';
import 'dart:async';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/repository.dart';

class ProductRepository{
  ProductApiClient productApiClient=ProductApiClient();

  ProductRepository();

  Future<List<Product>> loadProductlist() async {


    List<Product> lst =await productApiClient.getProductlist();

    return lst;
  }

  Future <Product> getProductbyid(int id) async {
    Product product=await productApiClient.getProductbyid(id);

    return product;
  }

}
