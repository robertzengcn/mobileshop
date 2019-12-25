import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'repository.dart';
import 'package:rxdart/rxdart.dart';

class CatelogueBloc{
  final _repository = Repository();
  Stream<QuerySnapshot> catelogueImagesList(String type) {
    return _repository.catelogueImagesList(type);
  }
}