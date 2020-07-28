import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ImageSliderEntity extends Equatable {
  final String document_id;
  final int status;
  final String type;
  final String url;



  const ImageSliderEntity(this.document_id, this.status, this.type,this.url);

  Map<String, Object> toJson() {
    return {
      "document_id": document_id,
      "status": status,
      "type": type,
      "url": url
    };
  }
  @override
  List<Object> get props => [document_id,status,type,url];

  @override
  String toString() {
    return 'ImageSliderEntity { id: $document_id, status: $status, type: $type, url: $url}';
  }

  static ImageSliderEntity fromJson(Map<String, Object> json) {
    return ImageSliderEntity(
    json["document_id"] as String,
    json["status"] as int,
    json["type"] as String,
    json["url"] as String
    );
  }

  static ImageSliderEntity fromSnapshot(DocumentSnapshot snap) {
    return ImageSliderEntity(
      snap.data['document_id'],
      snap.data['status'],
      snap.data['type'],
      snap.data['url']
    );
  }

  Map<String, Object> toDocument() {
    return {
      "document_id": document_id,
      "status": status,
      "type": type,
      "url":url
    };
  }
}



