import 'package:equatable/equatable.dart';

class Review extends Equatable {

  final int id;
  final int pid; //产品id
  final String customer_name;//评论的客户名称
  final String description;
  final DateTime review_time;
  final int rating;

  const Review({
    required this.id,
    required this.pid,
    required this.customer_name,

    required this.description,
    required this.review_time,
    required this.rating
  });
  @override
  List<Object> get props => [
    id,
    pid,
    customer_name,
    review_time,
    rating
  ];

  static Review fromJson(dynamic json) {
    DateTime dt=DateTime.now().subtract(Duration(days:1));
    if(json['review_time']!=null){
      dt=DateTime.parse(json['review_time']);
    }
    return Review(
        id: json['review_id'] as int,
        pid:json['review_pid'],
        customer_name: json['customer_name'],
        description:json['review_description'],
        review_time:dt,
      rating:json['review_rating'],
    );
  }

}