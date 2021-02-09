import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
//import 'package:amigatoy/Repository/carousels_api_client.dart;
//import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Repository/carousels_api_client.dart';


class CarouselRepository{
  final CarouselsApiClient carouselApiClient;

  CarouselRepository({@required this.carouselApiClient})
      : assert(carouselApiClient != null);
  ///获取图片列表
  Future<List> loadPicbytype(String type) async {
    Future<List<Carousel>> lst = carouselApiClient.getCarouselbytype(type);
//    var apiResponse = await Carousel().getAll();

//    List<Carousel> lst = new List();
//    if (apiResponse.success && apiResponse.result != null) {
//      for (Carousel m in apiResponse.result) {
//        lst.add(m);
//      }
//    }

    return lst;
  }
//  Future<List> loadAllPic() async {
//    var apiResponse = await Carousel().getAll();
//
//    List<Carousel> lst = new List();
//    if (apiResponse.success && apiResponse.result != null) {
//      for (Carousel m in apiResponse.result) {
//        lst.add(m);
//      }
//    }
//
//    return lst;
//  }
}
