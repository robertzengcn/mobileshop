import 'package:flutter/material.dart';
import 'package:amigatoy/Models/Product.dart';
import 'package:amigatoy/UI/HomeUIComponent/DetailProduct.dart';

/// ItemGrid in bottom item "Recomended" item
class ItemGrid extends StatelessWidget {
  /// Get data from HomeGridItem.....dart class
  final Product products;
  //GridItem gridItem;
  ItemGrid(this.products);
  final double _listImageheigh = 200;
  final double _listImagewidth = 200;
  @override
  Widget build(BuildContext context) {
    // MediaQueryData mediaQueryData = MediaQuery.of(context);

    // double _containHeight=mediaQueryData.size.height / 3.3;

    // var imgVariable = NetworkImage(products.products_image);
    // return Expanded(
    //   child:
    return Container(
        // width: 200,
        // height: 500,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (_, __, ___) => new detailProduk(products),
                transitionDuration: Duration(milliseconds: 900),

                /// Set animation Opacity in route to detailProduk layout
                transitionsBuilder:
                    (_, Animation<double> animation, __, Widget child) {
                  return Opacity(
                    opacity: animation.value,
                    child: child,
                  );
                }));
          },
          child: Container(

            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF656565).withOpacity(0.15),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
                  )
                ]),
            // child: Column(
            //   children: <Widget>[
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                /// Set Animation image to detailProduk layout
                // Hero(
                //   tag: "hero-grid-${products.products_id}",
                //   child: Material(
                //     child: InkWell(
                //       onTap: () {
                //         Navigator.of(context).push(PageRouteBuilder(
                //             opaque: false,
                //             pageBuilder: (BuildContext context, _, __) {
                //               return new Material(
                //                 color: Colors.black54,
                //                 child: Container(
                //                   padding: EdgeInsets.all(30.0),
                //                   child: InkWell(
                //                     child: Hero(
                //                         tag: "hero-grid-${products.products_id}",
                //                         child: Image.network(
                //                           products.products_image,
                //                           width: 400.0,
                //                           height: 400.0,
                //                           alignment: Alignment.center,
                //                           fit: BoxFit.contain,
                //                             errorBuilder:
                //                                 (BuildContext context,
                //                                 Object exception,
                //                                 StackTrace?
                //                                 stackTrace) {
                //                               return Image.asset(
                //                                 "assets/img/error.png",
                //                                 height: 400.0,
                //                                 width: 400,
                //                               );
                //                             }
                //                         )
                //                     ),
                //                     onTap: () {
                //                       Navigator.pop(context);
                //                     },
                //                   ),
                //                 ),
                //               );
                //             },
                //             transitionDuration: Duration(milliseconds: 500)));
                //       },
                //       child: Container(
                //         // height: 300,
                //         // width: 300,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(7.0),
                //                 topRight: Radius.circular(7.0)),
                //             // image:
                //             // DecorationImage(
                //             //     image: imgVariable,
                //             //   onError: (Object exception,stackTrace){
                //             //
                //             //   },
                //             //   fit: BoxFit.cover,
                //             //
                //             // )
                //         ),
                //         child: Image.network(
                //             products.products_image,
                //             alignment: Alignment.center,
                //              fit: BoxFit.contain,
                //             width: _listImagewidth,
                //             height: _listImageheigh,
                //             errorBuilder:
                //                 (BuildContext context,
                //                 Object exception,
                //                 StackTrace?
                //                 stackTrace) {
                //               return Image.asset(
                //                 "assets/img/error.png",
                //                 fit: BoxFit.contain,
                //                 width: _listImagewidth,
                //                 height: _listImageheigh,
                //               );
                //             }
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Container(
                    child: Image.network(products.products_image,
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                       width: _listImagewidth,
                        height: _listImageheigh,
                        errorBuilder:
                            (BuildContext context, Object exception,
                                StackTrace? stackTrace) {
                      return Image.asset(
                        "assets/img/error.png",
                        fit: BoxFit.contain,
                        width: _listImagewidth,
                        height: _listImageheigh,
                      );
                    }),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 3.0)),
                Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      // width:_containWidth,
                      // height: 40,
                      child: Text(
                        products.products_name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
//                    overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 0.5,
                            color: Colors.black54,
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0),
                      ),
                    )),
                Padding(padding: EdgeInsets.only(top: 1.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    products.products_price.toString(),
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            products.products_price.toString(),
                            style: TextStyle(
                                fontFamily: "Sans",
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14.0,
                          )
                        ],
                      ),
                      Text(
                        products.products_quantity.toString(),
                        style: TextStyle(
                            fontFamily: "Sans",
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // ],
          ),
        ),
      );
    // );
    // );
  }
}
