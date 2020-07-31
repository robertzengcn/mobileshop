import 'package:equatable/equatable.dart';
import 'package:firebase_repository/firebase_repository.dart';

abstract class ImageslidersState extends Equatable {
  const ImageslidersState();
  @override
  List<Object> get props => [];
}
/**
 * loading home images
 */
class HomeImagesliderLoading extends ImageslidersState {}
/**
 * home images slider load completed
 */
class HomeImageslidercompleted extends ImageslidersState {}


