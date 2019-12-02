class Category {
  int id;
  String title;
  String image;
  String description;

  Category({this.id, this.title,this.image,this.description});

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