import 'package:meta/meta.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:amigatoy/Models/models.dart';

class MenuRepository{
  MenuRepository();
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
    var apiResponse = await Menu().getAll();

    List<Menu> lst = new List();
    if (apiResponse.success && apiResponse.result != null) {
      for (Menu m in apiResponse.result) {
        lst.add(m);
      }
    }

    return lst;
  }
}
