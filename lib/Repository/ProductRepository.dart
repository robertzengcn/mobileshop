import 'package:meta/meta.dart';
import 'dart:async';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/repository.dart';

class ProductRepository{
  final ProductApiClient productApiClient;

  ProductRepository({@required this.productApiClient})
      : assert(productApiClient != null);

  Future<List> loadProductlist() async {


    Future<List<Product>> lst = productApiClient.getProductlist();

    return lst;
  }

}
