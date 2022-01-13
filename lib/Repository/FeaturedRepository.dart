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

  Future<ListProduct> loadFeaturedlist(int start, int length) async {
    ListProduct lst = await productApiClient.getFeaturelist(start,length);

    return lst;
  }

}
