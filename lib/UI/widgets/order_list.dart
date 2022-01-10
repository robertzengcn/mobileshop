import 'package:flutter/material.dart';
import 'package:amigatoy/Models/models.dart';

Widget orderListWidget(List<Order?> orderList) {
  return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      // controller:controller,
      // itemExtent: 116.0,
      children: orderMaininfo(orderList)
  );
}

///
// List<CustomListItem> ItemList(List<Product> productList) {
//   List<CustomListItem> prolist = [];
//   productList.forEach((value) {
//     prolist.add(CustomListItem(
//       itemImage: value.products_image,
//       itemName: value.products_name,
//       itemPrice: value.products_price,
//       itemSpecial: value.product_specials,
//     ));
//   });
//   return prolist;
// }
///return list of order
List<CustomOrderItem> orderMaininfo(List<Order?> lorders) {
  List<CustomOrderItem> orderList = [];
  lorders.forEach((value) {
    if(value!=null){
    orderList.add(CustomOrderItem(
        orderId: value.ordersId,
        ordersStatusName: value.ordersStatusName,
        lproduct: value.lproduct,
        orderTotal:value.orderTotal
    ));
    }
  });
  return orderList;
}
/// an item widget include single custom order item
class CustomOrderItem extends StatelessWidget {

  const CustomOrderItem({
    Key? key,
    required this.orderId,
    required this.ordersStatusName,
  required this.lproduct,
    required this.orderTotal,
  }) : super(key: key);

  final int orderId;
  final String ordersStatusName;
  final List<OrderProduct> lproduct;
  final String orderTotal;

  Widget build(BuildContext context) {
    List<CustomListItem> litems=[];
    lproduct.forEach((value){
      litems.add(
          CustomListItem(itemPrice: value.finalPrice,itemName: value.productsName,itemImage: value.productsImage,itemQuantity: value.productsQuantity,));
    });
    return Column(
        children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(
                    "Order Number:"+orderId.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Status:"+ordersStatusName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ]
          )
      ),
    Column(
        children:litems
    ),
          // Padding(padding: EdgeInsets.only(top: 5.0)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Total:"+orderTotal,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 5.0)),
          Divider(
            height: 1.0,
            color: Colors.black26,
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),

    ]);
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity
  }) : super(key: key);

  final String itemImage;
  final String itemName;
  final double itemPrice;
  final int itemQuantity;

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
              height: 80,
              width: 80,
                errorBuilder:
                    (BuildContext context,
                    Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    "assets/img/error.png",
                    height: 80.0,
                    width: 80.0,
                  );
                }
            ),
          ),
          Expanded(
            flex: 3,
            child: _ItemDescription(
              title: itemName,
              itemPrice: itemPrice,
              itemQuantity: itemQuantity,
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
    required this.itemQuantity,
  }) : super(key: key);

  final String title;
  final double itemPrice;
  final int itemQuantity;

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
          Text(
            itemQuantity.toString()+'*'+itemPrice.toString(),
            style: const TextStyle(fontSize: 10.0),
          )
        ],
      ),
    );
  }
}

