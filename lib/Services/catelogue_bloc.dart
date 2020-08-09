import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:amigatoy/ListItem/Category.dart';

class CatelogueBloc{
  final _repository = Repository();
  Stream<QuerySnapshot> catelogueImagesList(String type) {
    return _repository.catelogueImagesList(type);
  }
  Stream<QuerySnapshot> fetchlevelCategoryAsStream(int level,[int top=0]) {

    //return Firestore.instance.collection('category').where('level', isEqualTo: level).where('top', isEqualTo: top).orderBy("id").snapshots();
    return  _repository.fetchlevelCategoryAsStream(level,top);
  }
}