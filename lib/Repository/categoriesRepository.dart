//import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
//import 'package:amigatoy/Repository/carouselsApiClient.dart;
//import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Repository/categoriesApiClient.dart';

class CategoriesRepository {
  final CategoriesApiClient categoriesApiClient=new CategoriesApiClient();

  // CategoriesRepository({required this.categoriesApiClient});

  ///获取图片列表
  Future<List<Categories>> getCategorieslist(int categories) async {
    Future<List<Categories>> lst = categoriesApiClient.getCatelist(categories);
    return lst;
  }

}
