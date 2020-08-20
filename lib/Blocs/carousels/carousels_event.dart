import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class CarouselsEvent extends Equatable {
  const CarouselsEvent();

  @override
  List<Object> get props => [];
}

class FetchCarousels extends CarouselsEvent {
  final String type;

  const FetchCarousels({@required this.type}) : assert(type != null);

  @override
  List<Object> get props => [type];
}

//class ImagesliderUpdated extends CarouselsEvent {
//  final List<Imageslider> imageslider;
//
//  const ImagesliderUpdated(this.imageslider);
//
//  @override
//  List<Object> get props => [imageslider];
//}
class LoadingCarousels extends CarouselsEvent {}

class LoadedCarousels  extends CarouselsEvent {}