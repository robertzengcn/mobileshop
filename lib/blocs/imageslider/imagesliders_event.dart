import 'package:equatable/equatable.dart';
import 'package:firebase_repository/firebase_repository.dart';

abstract class ImageslidersEvent extends Equatable {
  const ImageslidersEvent();

  @override
  List<Object> get props => [];
}

class LoadImageslider extends ImageslidersEvent {}

class ImagesliderUpdated extends ImageslidersEvent {
  final List<Imageslider> imageslider;

  const ImagesliderUpdated(this.imageslider);

  @override
  List<Object> get props => [imageslider];
}
class LoadinghomeImageslider extends ImageslidersEvent {}

class LoadedhomeImageslider extends ImageslidersEvent {}