import 'package:equatable/equatable.dart';
import 'package:firebase_repository/firebase_repository.dart';

abstract class ImagesliderEvent extends Equatable {
  const ImagesliderEvent();

  @override
  List<Object> get props => [];
}

class LoadImageslider extends ImagesliderEvent {}

class ImagesliderUpdated extends ImagesliderEvent {
  final List<Imageslider> imageslider;

  const ImagesliderUpdated(this.imageslider);

  @override
  List<Object> get props => [imageslider];
}