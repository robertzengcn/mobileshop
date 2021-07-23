part of 'reviews_bloc.dart';

abstract class ReviewsState extends Equatable {
  const ReviewsState();
}

class ReviewsInitialState extends ReviewsState {
  @override
  List<Object> get props => [];
}
class ReviewloadingState extends ReviewsState {

  @override
  List<Object> get props => [];
}
class ReviewloadedState extends ReviewsState{
  final List<Review> reviewlist;
  const ReviewloadedState({required this.reviewlist});

  @override
  List<Object> get props => [reviewlist];
}
class ReviewErrorState extends ReviewsState {
  @override
  List<Object> get props => [];
}