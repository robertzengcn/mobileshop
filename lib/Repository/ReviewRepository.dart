import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/reviewsApiClient.dart';


class ReviewRepository{
  ReviewsApiClient reviewApiClient=new ReviewsApiClient();

  ReviewRepository();
  ///获取图片列表
  Future<List<Review>> featchReviewbypid(int pid) async {

    Future<List<Review>> lst = reviewApiClient.getReviewbypid(pid);

    return lst;
  }

}
