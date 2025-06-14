import 'package:flutter/material.dart';
import 'package:amigatoy/Models/models.dart';

Widget productListWidget(List<Product> productList) {
// return ListView.builder(
//     itemCount: productList.length,
//     itemBuilder: (context, index) {
//       return Card(
//           child: ListTile(
//               title: Text(productList[index].products_name),
//               subtitle: productPriceWidget(productList[index].products_price,productList[index].product_specials),
//               leading: Container(
//                  child: new Image.network(
//                      productList[index].products_image,
//                      height:150,
//                    width: 150,
//                  )),
//               trailing: Icon(Icons.add_shopping_cart)));
//     });
  return ListView(
    padding: const EdgeInsets.all(8.0),
    itemExtent: 106.0,
      children: ItemList(productList)
  );
}
///
List<CustomListItem> ItemList(List<Product> productList) {
  List<CustomListItem> prolist = [];
  productList.forEach((value) {
  prolist.add(CustomListItem(itemImage: value.products_image,itemName: value.products_name,itemPrice: value.products_price,itemSpecial: value.product_specials,));
  });
  return prolist;
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
    this.itemSpecial,
  }) : super(key: key);

  final String itemImage;
  final String itemName;
  final double itemPrice;
  final double? itemSpecial;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: new Image.network(
              itemImage,
                     height:200,
                   width: 200,
                 ),
          ),
          Expanded(
            flex: 3,
            child: _ItemDescription(
              title: itemName,
              itemPrice: itemPrice,
             specialPrice:itemSpecial,
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}

class _ItemDescription extends StatelessWidget {
  const _ItemDescription({
    Key? key,
    required this.title,
    required this.itemPrice,
    this.specialPrice,
  }) : super(key: key);

  final String title;
  final double itemPrice;
  final double? specialPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          productPriceWidget(itemPrice,specialPrice),
        ],
      ),
    );
  }
}

Widget productPriceWidget(double price, double? special) {
  if (special != null && special > 0) {
    return new RichText(
      text: new TextSpan(
        text: 'Price: ',
        children: <TextSpan>[
          new TextSpan(
            text: price.toString(),
            style: new TextStyle(
              fontSize: 10.0,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          new TextSpan(
              text: special.toString(),
              style: new TextStyle(
                fontSize: 10.0,
              )),
        ],
      ),
    );
  } else {
    return Text(
      price.toString(),
      style: const TextStyle(fontSize: 10.0),
    );
  }
}
