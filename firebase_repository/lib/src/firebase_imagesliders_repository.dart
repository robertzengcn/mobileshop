import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_repository/firebase_repository.dart';
import 'entities/entities.dart';



class FirebaseImageslidersRepository implements ImageslidersRepository {
  final imagesliderCollection = Firestore.instance.collection('images_slider');


  @override
  Stream<List<Imageslider>> imagesliders() {
    return imagesliderCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Imageslider.fromEntity(ImageSliderEntity.fromSnapshot(doc)))
          .toList();
    });
  }


}