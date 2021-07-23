part of 'reviews_bloc.dart';

abstract class ReviewsEvent extends Equatable {
  const ReviewsEvent();
}
//取产品评论
class FetchProReviewsEvent extends ReviewsEvent {
  final int pid;

  const FetchProReviewsEvent({required this.pid});

  @override
  List<Object> get props => [pid];
}