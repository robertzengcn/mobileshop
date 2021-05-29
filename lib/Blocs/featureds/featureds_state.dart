import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';



abstract class FeaturedState extends Equatable {
  const FeaturedState();
//  CarouselsState([List props = const[]]) : super([props]);
//  @override
 List<Object> get props => [];
}
class FeaturedEmpty extends FeaturedState {}
/**
 * loading home images
 */
class FeaturedLoading extends FeaturedState {

}
/**
 * home images slider load completed
 */
class Featuredloaded extends FeaturedState {
  final List<Product> lstFeatureds;


  const Featuredloaded({required this.lstFeatureds}) : assert(lstFeatureds != null);

  @override
  List<Object> get props => [lstFeatureds];
}

class FeaturedError extends FeaturedState {}




