import 'package:equatable/equatable.dart';
import 'package:firebase_repository/firebase_repository.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
  @override
  List<Object> get props => [];
}
class ProductsLoading extends ProductsState {}

