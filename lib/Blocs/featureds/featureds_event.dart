// import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class FeaturedEvent extends Equatable {
  const FeaturedEvent();

  @override
  List<Object> get props => [];
}

class FetchFeatureds extends FeaturedEvent {

  final int start;
  final int length;
  const FetchFeatureds({required this.start,required this.length});

  @override
  List<Object> get props => [start,length];
}

class FetchFeaturedtype extends FeaturedEvent {
  final String type;

  const FetchFeaturedtype({required this.type});

  @override
  List<Object> get props => [type];
}

class FeaturedloadMore extends FeaturedEvent {

  final int start;
  final int length;
  const FeaturedloadMore({required this.start,required this.length});

  @override
  List<Object> get props => [start,length];
}

