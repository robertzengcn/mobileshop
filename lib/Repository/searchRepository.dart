//import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
//import 'package:amigatoy/Repository/carouselsApiClient.dart;
//import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Repository/searchApiClient.dart';

class SearchRepository {
  final SearchApiClient searchApiClient=new SearchApiClient();

  // CategoriesRepository({required this.categoriesApiClient});

  Future<List<String?>> getSearchterms() async{
    return searchApiClient.getSearchterms();
  }
  /// search product
  Future<SearchResList> searchProduct(String searchkey,int page,int num,[String? sort='products_price',String? sortway='asc']) async{
    return searchApiClient.searchProduct(searchkey,page,num,sort,sortway);
  }


}
