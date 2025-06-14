class cartItem{
  String img,title,desc,price;
  int id;
  double? totalPrice;
  cartItem({
    required this.id,
    required this.img,
    required this.title,
    required this.desc,
    required this.price,
    this.totalPrice
});
}