import 'package:equatable/equatable.dart';
import 'package:firebase_repository/firebase_repository.dart';
import 'package:amigatoy/models/models.dart';

abstract class CarouselsState extends Equatable {
  const CarouselsState();
  @override
  List<Object> get props => [];
}
class CarouselsEmpty extends CarouselsState {}
/**
 * loading home images
 */
class CarouselsLoading extends CarouselsState {}
/**
 * home images slider load completed
 */
class HomeCarouselsloaded extends CarouselsState {}




