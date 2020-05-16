import 'dart:async';

import 'package:products_repository/products_repository.dart';

abstract class ProductsRepository {

  //Future<void> addNewProduct(Product product);

  //Future<void> deleteProduct(Product product);

  Stream<List<Product>> products();

  //Future<void> updateTodo(Product todo);
}