import 'package:meta/meta.dart';
//import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/product_api_client.dart';
//import 'package:amigatoy/Repository/repository.dart';

/**
 * get featured products
 */
class FeaturedRepository{
  final ProductApiClient productApiClient;
  FeaturedRepository({@required this.productApiClient})
      : assert(productApiClient != null);

  Future<List> loadFeaturedlist() async {
    Future<List<Product>> lst = productApiClient.getFeaturelist();

    return lst;
  }

}
