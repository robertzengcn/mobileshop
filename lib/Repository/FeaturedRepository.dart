import 'package:meta/meta.dart';
//import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/productApiClient.dart';
//import 'package:amigatoy/Repository/repository.dart';


///get featured products

class FeaturedRepository{
//  final ProductApiClient productApiClient;
  ProductApiClient productApiClient=ProductApiClient();
  FeaturedRepository();
//      : assert(productApiClient != null);

  Future<List<Product>> loadFeaturedlist() async {
    Future<List<Product>> lst = productApiClient.getFeaturelist();

    return lst;
  }

}
