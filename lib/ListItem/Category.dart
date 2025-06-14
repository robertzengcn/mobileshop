class Category {
  int id;
  String title;
  String image;
  String description;

  Category({
    required this.id,
    required this.title,
    required this.image,
    required this.description});

  Category.fromMap(Map snapshot,String documentid) :
        id = snapshot['id']??0,
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