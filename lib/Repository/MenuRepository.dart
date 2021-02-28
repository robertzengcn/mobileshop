import 'package:meta/meta.dart';
//import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/menuApiClient.dart';

class MenuRepository{
  final MenuApiClient menuApiClient;
  MenuRepository({@required this.menuApiClient})
      : assert(menuApiClient != null);
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
  Future<List> loadMenulist() async {

    Future<List<Menu>> lst = menuApiClient.getMenulist();



    return lst;
  }

  /// 通过type参数载入菜单
  Future<List> fetchMenutype(String type) async {
    Future<List<Menu>> lst = menuApiClient.getMenubytype(type);
//    var queryBuilder = QueryBuilder<Menu>(Menu())
//      ..whereContains(Menu.keyMenuType, "home");
//
//    var response = await queryBuilder.query();
//    List<Menu> lst = new List();
//    if (response.success&& response.result != null) {
//      for (Menu m in response.result) {
//        lst.add(m);
//      }
//    }
    return lst;

  }
}
