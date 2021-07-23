import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  late ReviewRepository reviewRepository;
  ReviewsBloc({required this.reviewRepository}) : super(ReviewsInitialState());

  @override
  Stream<ReviewsState> mapEventToState(
    ReviewsEvent event
  ) async* {
    if(event is FetchProReviewsEvent){
      yield ReviewloadingState();
      List<Review> loadreviews=await reviewRepository.featchReviewbypid(event.pid);

      yield ReviewloadedState(reviewlist:loadreviews);
    }

  }
}
