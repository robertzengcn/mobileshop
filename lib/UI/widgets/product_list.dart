import 'package:flutter/material.dart';
import 'package:amigatoy/Models/models.dart';


Widget productListWidget(List<Product> productList){
return ListView.builder(
    itemCount: productList.length,
    itemBuilder: (context, index) {
      return Card(
          child: ListTile(
              title: Text(productList[index].products_name),
              subtitle: productPriceWidget(productList[index].products_price,productList[index].product_specials),
              leading: Container(
                 child: new Image.network(
                     productList[index].products_image,
                     height:150,
                   width: 150,
                 )),
              trailing: Icon(Icons.add_shopping_cart)));
    });
}

Widget productPriceWidget(double price, double? special){
  if(special!=null&&special>0){
    return new RichText(
      text: new TextSpan(
        text: 'Price: ',
        children: <TextSpan>[
          new TextSpan(
            text: price.toString(),
            style: new TextStyle(
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          new TextSpan(
            text: special.toString(),
          ),
        ],
      ),
    );
  }else{
    return Text(price.toString());
  }
}