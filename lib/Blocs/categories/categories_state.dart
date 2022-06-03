part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
  @override
  List<Object> get props => [];
}
class Categorieslistfetched extends CategoriesState {
  final List<Categories> listcategories;
  Categorieslistfetched({required this.listcategories});
  @override
  List<Object> get props => [listcategories];
}

class Categorieserror extends CategoriesState {
  final String error;
  Categorieserror({required this.error});
  @override
  List<Object> get props => [error];
}