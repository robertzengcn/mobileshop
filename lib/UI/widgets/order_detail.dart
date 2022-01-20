import 'package:flutter/material.dart';
import 'package:amigatoy/Models/models.dart';

/// an item widget include single custom order detail
class CustomOrderDetail extends StatelessWidget {

  final int orderId;
  final String ordersStatusName;
  final List<OrderProduct> lproduct;
  final String orderTotal;
  final String subTotaltext;
  final String shippingText;

  const CustomOrderDetail({
    Key? key,
    required this.orderId,
    required this.ordersStatusName,
    required this.lproduct,
    required this.orderTotal,
    required this.subTotaltext,
    required this.shippingText,
  }) : super(key: key);

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
                "Sub total:"+subTotaltext,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Shipping fee:"+shippingText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),

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
    required this.itemQuantity,
    this.productAtt
  }) : super(key: key);

  final String itemImage;
  final String itemName;
  final double itemPrice;
  final int itemQuantity;
  final List<OrderProductAttributes>? productAtt;

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
              height: 100,
              width: 100,
                errorBuilder:
                    (BuildContext context,
                    Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    "assets/img/error.png",
                    height: 100.0,
                    width: 100.0,
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

class _Attwidget extends StatelessWidget {
  final String optionName;
  final String optionValue;
  const _Attwidget({
    Key? key,
    required this.optionName,
    required this.optionValue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.2, 2.0, 0.0, 0.0),
        child: Text(optionName+" "+optionValue),
    );
  }
}

class _ItemDescription extends StatelessWidget {
  const _ItemDescription({
    Key? key,
    required this.title,
    required this.itemPrice,
    required this.itemQuantity,
    this.productAttributes
  }) : super(key: key);

  final String title;
  final double itemPrice;
  final int itemQuantity;
  final List<OrderProductAttributes>? productAttributes;


  @override
  Widget build(BuildContext context) {
    List<Widget> attrWidlist=[];
    productAttributes?.forEach((value){
      attrWidlist.add(_Attwidget(optionName:value.option,optionValue: value.value,));
    });
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
          ),
          ...?attrWidlist
        ],
      ),
    );
  }
}

