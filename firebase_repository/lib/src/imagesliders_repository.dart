import 'dart:async';

import 'package:firebase_repository/firebase_repository.dart';

abstract class ImageslidersRepository {

  //Future<void> addNewProduct(Product product);

  //Future<void> deleteProduct(Product product);

  Stream<List<ImageSlider>> imagesliders();

  //Future<void> updateTodo(Product todo);
}