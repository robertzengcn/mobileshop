import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class SpecialsEvent extends Equatable {
  const SpecialsEvent();

  @override
  List<Object> get props => [];
}

class FetchSpecials extends SpecialsEvent {

  final int start;
  final int length;
  const FetchSpecials({required this.start,required this.length});

  @override
  List<Object> get props => [start,length];
}



