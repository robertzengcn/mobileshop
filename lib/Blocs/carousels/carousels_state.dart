import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';



abstract class CarouselsState extends Equatable {
  const CarouselsState();
//  CarouselsState([List props = const[]]) : super([props]);
//  @override
 List<Object> get props => [];
}
class CarouselsEmpty extends CarouselsState {}
/**
 * loading home images
 */
class CarouselsLoading extends CarouselsState {

}
/**
 * home images slider load completed
 */
class Carouselsloaded extends CarouselsState {
  final List<Carousel> lstCarousel;


  const Carouselsloaded({@required this.lstCarousel}) : assert(lstCarousel != null);

  @override
  List<Object> get props => [lstCarousel];
}

class CarouselsError extends CarouselsState {}




