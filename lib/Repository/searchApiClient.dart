import 'dart:convert';
import 'dart:async';

// import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/constants/application_constants.dart';

class SearchApiClient{
  SearchApiClient();

  Future<List<String?>> getSearchterms() async{
    var url = Uri.parse('$appServerUrl/searchterm');
    http.Response response = await http.get(
      url,
      headers: {
        'Application-Id': '$appId',
      },
    );
    if (response.statusCode != 200) {

      throw Exception('Unable to fetch search terms from the REST API');
    }
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){
      // List<dynamic> lterms=(responseJson['data']['list'] as List)
      //     .map((p) => cast<String>(p))
      //     .toList();
      List<String?> searchTerms =new List<String?>.from(responseJson['data']['list'] as List);
      return searchTerms;
    }else{
      throw Exception(responseJson['msg']);
    }
  }
  ///search product by api
  Future<SearchResList> searchProduct(String searchkey,int page,int num,[String? sort='products_price',String? sortway='asc']) async{
    var url = Uri.parse('$appServerUrl/search');
    final Map<String,String>data;
    data={"keyword":searchkey,
      "page":page.toString(),
      "num":num.toString(),
    };

    if(sort!=null){
      data["sort"] = sort;
    }
    if(sortway!=null){
      data["sortway"] = sortway;
    }


    http.Response response = await http.post(
      url,
      body: data,
      headers: {
        'Application-Id': '$appId',
      },
    );
    if (response.statusCode != 200) {

      throw Exception('Unable to search product from the REST API');
    }
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){

      List<Product?> lps=(responseJson['data']['data'] as List)
           .map((p) => Product.fromJson(p))
           .toList();
      int num=responseJson['data']['num'] as int;
      return SearchResList(lps:lps,resNum:  num);
    }else{
      throw Exception(responseJson['msg']);
    }

  }

}
