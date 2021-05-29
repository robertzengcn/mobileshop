class Product {
  int id;
  double price;
  String title;
  String img;
  int rattingValue;
  int itemSale;
  String description;
  int catalogueId;



  Product({required this.id,
    required this.price,
    required this.title,
    required this.img,
    required this.rattingValue,
    required this.itemSale,
    required this.description,
    required this.catalogueId
  });

  Product.fromMap(Map snapshot,String id) :
        id = snapshot['id'] ?? '',
        price = snapshot['price'].toDouble() ?? "",
        title = snapshot['title'] ?? '',
        rattingValue = snapshot['rattingValue'] ?? '',
        itemSale = snapshot['itemSale'] ?? '',
        description= snapshot['description'] ?? '',
        img = snapshot['img'] ?? '',
        catalogueId=snapshot['catalogueId'] ?? '';

  toJson() {
    return {
      "price": price,
      "title": title,
      "img": img,
      "rattingValue":rattingValue,
      "itemSale":itemSale,
      "description":description,
      "catalogueId":catalogueId
    };
  }
}