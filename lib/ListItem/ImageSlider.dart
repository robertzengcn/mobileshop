class ImageSlider {
  String id;
  String url;


  ImageSlider({
    required this.id,
    required this.url});

  ImageSlider.fromMap(Map snapshot,String id) :
        id = id ?? '',
        url = snapshot['url'] ?? '';

  toJson() {
    return {
      "id": id,
      "url": url,
    };
  }

}