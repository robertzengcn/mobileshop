import 'package:flutter/material.dart';
import 'package:amigatoy/Models/Product.dart';

class ProductCard extends StatelessWidget {
  final Product productDetails;

  ProductCard({required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
//      onTap: (){
//        Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails(product: productDetails)));
//      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.8,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.5,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: productDetails.products_id,
                  child: Image.network(
                    productDetails.products_image,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height *
                        0.35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        productDetails.products_name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 13.0,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        '${productDetails.products_price} \$',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                            color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}