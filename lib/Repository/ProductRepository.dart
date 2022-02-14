//import 'package:meta/meta.dart';
import 'dart:async';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/repository.dart';

class ProductRepository{
  ProductApiClient productApiClient=ProductApiClient();

  ProductRepository();

  ///load product list from api
  Future<List<Product>> loadProductlist(int catalogueId,int start, int length) async {


    List<Product> lst =await productApiClient.getProductlist(catalogueId,start,length);

    return lst;
  }

  Future <Product> getProductbyid(int id) async {
    Product product=await productApiClient.getProductbyid(id);

    return product;
  }

  Future<List<Product>> loadrelativeProductlist(int pid) async {


    List<Product> lst =await productApiClient.getRelativelist(pid);

    return lst;
  }
  Future<List<Product>> loadspecialProductlist(int start,int length) async {


    List<Product> lst =await productApiClient.getSpeciallist(start,length);

    return lst;
  }

}
