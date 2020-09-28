import 'package:meta/meta.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:amigatoy/Models/models.dart';

class ProductRepository{
  ProductRepository();
//  Future<List> loadPicbytype(String type) async {
////    var apiResponse = await Carousel().getAll();
////
////    List<Carousel> lst = new List();
////    if (apiResponse.success && apiResponse.result != null) {
////      for (Carousel m in apiResponse.result) {
////        lst.add(m);
////      }
////    }
////
////    return lst;
////  }
  Future<List> loadProductlist() async {
    var apiResponse = await Product().getAll();

    List<Product> lst = new List();
    if (apiResponse.success && apiResponse.result != null) {
      for (Product m in apiResponse.result) {
        lst.add(m);
      }
    }

    return lst;
  }

  /// 通过type参数载入菜单
  Future<List> fetchProducttype(String type) async {
    var queryBuilder = QueryBuilder<Product>(Product())
      ..whereContains(Product.keyMenuType, "home");

    var response = await queryBuilder.query();
    List<Product> lst = new List();
    if (response.success&& response.result != null) {
      for (Product m in response.result) {
        lst.add(m);
      }
    }
    return lst;
  }
}
