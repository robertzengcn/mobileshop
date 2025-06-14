import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';



abstract class SpecialsState extends Equatable {
  const SpecialsState();
//  CarouselsState([List props = const[]]) : super([props]);
//  @override
 List<Object> get props => [];
}
class SpecialsEmpty extends SpecialsState  {}

///loading home images
class SpecialsLoading extends SpecialsState {

}
///home images slider load completed
class Specialsloaded extends SpecialsState {
  final List<Product> lstSpecials;


  const Specialsloaded({required this.lstSpecials});

  @override
  List<Object> get props => [lstSpecials];
}

class SpecialsError extends SpecialsState {}




