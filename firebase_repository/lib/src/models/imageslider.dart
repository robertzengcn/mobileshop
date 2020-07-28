import 'package:meta/meta.dart';
import '../entities/entities.dart';
@immutable
class ImageSlider {

  final String document_id;
  final int status;
  final String type;
  final String url;

  ImageSlider(this.document_id, this.status, this.type,this.url);




  @override
  int get hashCode =>
      document_id.hashCode ^ status.hashCode ^ type.hashCode ^ url.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ImageSlider &&
              runtimeType == other.runtimeType &&
              document_id == other.document_id &&
              status == other.status &&
              type == other.type &&
              url == other.url;

  @override
  String toString() {
    return 'ImageSlider { document_id: $document_id, price: $status, title: $type, url: $url}';
  }

  ImageSliderEntity toEntity() {
    return ImageSliderEntity(document_id, status, type,url);
  }

  static ImageSlider fromEntity(ImageSliderEntity entity) {
    return ImageSlider(
       entity.document_id,
      entity.status,
      entity.type,
      entity.url
    );
  }
}