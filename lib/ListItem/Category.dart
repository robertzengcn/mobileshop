class Category {
  String id;
  String title;
  String image;
  String description;

  Category({this.id, this.title,this.image,this.description});

  Category.fromMap(Map snapshot,String id) :
        id = id ?? '',
        title = snapshot['title'] ?? '',
        description= snapshot['description'] ?? '',
        image = snapshot['image'] ?? '';

  toJson() {
    return {
      "id":id,
      "title": title,
      "image": image,
      "description":description
    };
  }
}