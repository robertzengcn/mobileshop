class Product {
  String id;
  String price;
  String title;
  String img;
  String rattingValue;
  String itemSale;
  String description;

  Product({this.id, this.price, this.title,this.img,this.rattingValue,this.itemSale,this.description});

  Product.fromMap(Map snapshot,String id) :
        id = id ?? '',
        price = snapshot['price'] ?? '',
        title = snapshot['title'] ?? '',
        rattingValue = snapshot['rattingValue'] ?? '',
        itemSale = snapshot['itemSale'] ?? '',
        description= snapshot['description'] ?? '',
        img = snapshot['img'] ?? '';

  toJson() {
    return {
      "price": price,
      "title": title,
      "img": img,
      "rattingValue":rattingValue,
      "itemSale":itemSale,
      "description":description
    };
  }
}