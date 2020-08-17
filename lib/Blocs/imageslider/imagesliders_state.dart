import 'package:equatable/equatable.dart';
import 'package:firebase_repository/firebase_repository.dart';
import 'package:amigatoy/models/models.dart';

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
class HomeImagesliderloaded extends ImageslidersState {
  final List<Imageslider> filteredImagesliders;
  final VisibilityFilter activeFilter;

  const HomeImagesliderloaded(
      this.filteredImagesliders,
      this.activeFilter,
      );
  @override
  List<Object> get props => [filteredImagesliders, activeFilter];

  @override
  String toString() {
    return 'FilteredTodosLoaded { filteredTodos: $filteredImagesliders, activeFilter: $activeFilter }';
  }


}


