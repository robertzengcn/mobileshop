import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class FeaturedEvent extends Equatable {
  const FeaturedEvent();

  @override
  List<Object> get props => [];
}

class FetchFeatureds extends FeaturedEvent {


  const FetchFeatureds();

  @override
  List<Object> get props => [];
}

class FetchFeaturedtype extends FeaturedEvent {
  final String type;

  const FetchFeaturedtype({@required this.type}) : assert(type != null);

  @override
  List<Object> get props => [type];
}

