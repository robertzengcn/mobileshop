import 'package:meta/meta.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:amigatoy/Models/models.dart';

class CarouselRepository{
  CarouselRepository();
  Future<List> loadPicbytype(String type) async {
    var apiResponse = await Carousel().getAll();

    List<Carousel> lst = new List();
    if (apiResponse.success && apiResponse.result != null) {
      for (Carousel m in apiResponse.result) {
        lst.add(m);
      }
    }

    return lst;
  }
  Future<List> loadAllPic() async {
    var apiResponse = await Carousel().getAll();

    List<Carousel> lst = new List();
    if (apiResponse.success && apiResponse.result != null) {
      for (Carousel m in apiResponse.result) {
        lst.add(m);
      }
    }

    return lst;
  }
}
