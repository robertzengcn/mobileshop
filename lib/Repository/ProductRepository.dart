import 'package:meta/meta.dart';
import 'dart:async';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/Product_api_client.dart';

class ProductRepository{
  final ProductApiClient productApiClient;

  ProductRepository({@required this.productApiClient})
      : assert(productApiClient != null);

  Future<List> loadProductlist() async {


    Future<List<Product>> lst = productApiClient.getProductlist();

    return lst;
  }

  /// 通过type参数载入菜单
//  Future<List> fetchProducttype(String type) async {
//    var queryBuilder = QueryBuilder<Product>(Product())
//      ..whereContains(Product.keyProductType, "home");
//
//    var response = await queryBuilder.query();
//    List<Product> lst = new List();
//    if (response.success&& response.result != null) {
//      for (Product m in response.result) {
//        lst.add(m);
//      }
//    }
//    return lst;
//  }
}
