part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();
}

@immutable
class ListcategoriesEvent extends CategoriesEvent {
  final int parentId;


  ListcategoriesEvent({
    required this.parentId
  });

  @override
  List<Object> get props => [parentId];
}
