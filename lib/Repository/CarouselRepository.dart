//import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
//import 'package:amigatoy/Repository/carouselsApiClient.dart;
//import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Repository/carouselsApiClient.dart';

class CarouselRepository {
  final CarouselsApiClient carouselApiClient;

  CarouselRepository({required this.carouselApiClient});

  ///获取图片列表
  Future<List<Carousel>> loadPicbytype(String type) async {
    Future<List<Carousel>> lst = carouselApiClient.getCarouselbytype(type);
    return lst;
  }

}
