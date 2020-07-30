import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_repository/firebase_repository.dart';
import 'entities/entities.dart';



class FirebaseImagesliderRepository implements ImageslidersRepository {
  final productCollection = Firestore.instance.collection('product');


  @override
  Stream<List<ImageSlider>> imagesliders() {
    return imageslideCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Product.fromEntity(ProductEntity.fromSnapshot(doc)))
          .toList();
    });
  }


}