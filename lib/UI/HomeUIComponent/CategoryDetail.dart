import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:treva_shop_flutter/Library/carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/ListItem/CategoryItem.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/PromotionDetail.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Search.dart';
import 'package:treva_shop_flutter/Services/CRUDModel.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:treva_shop_flutter/ListItem/ImageSlider.dart';
import 'package:treva_shop_flutter/ListItem/Category.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/SubCategory.dart';
import 'package:treva_shop_flutter/ListItem/Product.dart';
import 'package:treva_shop_flutter/Services/catelogue_bloc_provider.dart';
import 'package:treva_shop_flutter/Services/catelogue_bloc.dart';

class categoryDetail extends StatefulWidget {
  final int id;
  final String title;
  categoryDetail(this.id,{this.title='Category'});
  @override
  _categoryDetailState createState() => _categoryDetailState();
}

/// if user click icon in category layout navigate to categoryDetail Layout
class _categoryDetailState extends State<categoryDetail> {
  CatelogueBloc _bloc;

  void initState() {
    super.initState();
  }
  ///
  /// Get image data dummy from firebase server
  ///
var imageNetwork = NetworkImage("https://img.alicdn.com/tfscom/i3/2996558363/TB2a.PkdcIrBKNjSZK9XXagoVXa_!!2996558363.jpg_360x360xzq90.jpg_.webp");
  List<Category> categorys;
Map<int, Category> categorymap;
List<Product> products;



  ///
  /// check the condition is right or wrong for image loaded or no
  ///
  bool loadImage = true;

  List<ImageSlider> imagesliders;
  /// custom text variable is make it easy a custom textStyle black font
  static var _customTextStyleBlack = TextStyle(
      fontFamily: "Gotik",
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 15.0);

  /// Custom text blue in variable
  static var _customTextStyleBlue = TextStyle(
      fontFamily: "Gotik",
      color: Color(0xFF6991C7),
      fontWeight: FontWeight.w700,
      fontSize: 15.0);

  ///
  /// SetState after imageNetwork loaded to change list card
  ///
  //@override
//  void initState() {
//
////    Firestore.instance.collection('image_slider').where('status', isEqualTo: 1).where('type','catelogue').then((data) async {
////      var list = data.documents;
////      documents = list;
////      print("init state document:" +
////          documents.length.toString()); // value is getting
////      super.initState();
////      setState(() {
////        isDocLoaded = true;
////        documents = list;
////      });
////    });
//
//    // TODO: implement initState
//    super.initState();
//  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = CatelogueBlocProvider.of(context);
  }

  @override
  void dispose() {

    super.dispose();
  }

  /// All Widget Component layout
  @override
  Widget build(BuildContext context) {

    widget.id;
    final contentProvider = Provider.of<CRUDModel>(context);
    /// imageSlider in header layout category detail
    var _imageSlider = Padding(
      padding: const EdgeInsets.only(
          top: 0.0, left: 10.0, right: 10.0, bottom: 35.0),
      child: Container(
        height: 180.0,
        child: new Carousel(
          boxFit: BoxFit.cover,
          dotColor: Colors.transparent,
          dotSize: 5.5,
          dotSpacing: 16.0,
          dotBgColor: Colors.transparent,
          showIndicator: false,
          overlayShadow: false,
          overlayShadowColors: Colors.white.withOpacity(0.9),
          overlayShadowSize: 0.9,
          images:imagesliders?.map((i){

              return NetworkImage(i.url);

            })?.toList()??[]
        ),
      ),
    );

    List<Widget> ListMyWidgets() {
      List<Widget> list = new List();
      if(categorys!=null){

        for(var i = 0; i < categorymap.length; i++){
          if(i==0){
            list.add(Padding(padding: EdgeInsets.only(left: 20.0)));
          }
          list.add(
              SubCategory(
                title: categorymap[i].title,
                id:categorymap[i].id,
              )
          );
          list.add(Padding(padding: EdgeInsets.only(left: 15.0)));

        }
      }
    return list;
    }

    /// Variable Category (Sub Category)
    var _subCategory = Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Sub Category",
                  style: _customTextStyleBlack,
                ),
//                InkWell(
//                  onTap: () {
//                    Navigator.of(context).push(PageRouteBuilder(
//                        pageBuilder: (_, __, ___) => new promoDetail()));
//                  },
//                  child: Text("See More",
//                      style:
//                      _customTextStyleBlue.copyWith(color: Colors.black26)),
//                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(right: 10.0, top: 5.0),
              height: 42.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ListMyWidgets()
              //  children:
//                  <Widget>[
//                  Padding(padding: EdgeInsets.only(left: 20.0)),
//                  KeywordItem(
//                    title: "Polo Shirt",
//                    title2: "Shirt",
//                  ),
//                  Padding(padding: EdgeInsets.only(left: 15.0)),
//                  KeywordItem(
//                    title: "Suit",
//                    title2: "Jacket",
//                  ),
//                  Padding(padding: EdgeInsets.only(left: 15.0)),
//                  KeywordItem(
//                    title: "Jeans",
//                    title2: "Bag",
//                  ),
//                  Padding(padding: EdgeInsets.only(left: 15.0)),
//                  KeywordItem(
//                    title: "Watch",
//                    title2: "Shoes",
//                  ),
//                  Padding(padding: EdgeInsets.only(right: 20.0)),
//                ],
              ),
            ),
          )
        ],
      ),
    );

    /// Variable item Discount with Card
//    var _itemDiscount = Container(
//      child: Column(
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 30.0),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Text(
//                  "Item",
//                  style: _customTextStyleBlack,
//                ),
//                InkWell(
//                  onTap: () {
//                    Navigator.of(context).push(PageRouteBuilder(
//                        pageBuilder: (_, __, ___) => new promoDetail()));
//                  },
//                  child: Text("See More", style: _customTextStyleBlue),
//                ),
//              ],
//            ),
//          ),
//          SingleChildScrollView(
//            child: Container(
//              margin: EdgeInsets.only(right: 10.0),
//              height: 300.0,
//              ///
//              ///
//              /// check the condition if image data from server firebase loaded or no
//              /// if image true (image still downloading from server)
//              /// Card to set card loading animation
//              ///
//              ///
//              child:
//              ListView.builder(
//                scrollDirection: Axis.vertical,
//                itemBuilder: (BuildContext context, int index)=>discountItem(products[index]),
//                itemCount: products == null ? 0 : products.length,
//              ),
//            ),
//          )
//        ],
//      ),
//    );

    /// Variable item Popular with Card
//    var _itemPopular = Padding(
//      padding: const EdgeInsets.only(top: 30.0),
//      child: Container(
//        child: Column(
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    "Item Popular",
//                    style: _customTextStyleBlack,
//                  ),
//                  InkWell(
//                    onTap: null,
//                    child: Text("See More", style: _customTextStyleBlue),
//                  ),
//                ],
//              ),
//            ),
//            SingleChildScrollView(
//              child: Container(
//                margin: EdgeInsets.only(right: 10.0),
//                height: 300.0,
//                ///
//                ///
//                /// check the condition if image data from server firebase loaded or no
//                /// if image true (image still downloading from server)
//                /// Card to set card loading animation
//                ///
//                ///
//                child: loadImage? _loadingImageAnimation(context):
//                ListView.builder(
//                  scrollDirection: Axis.horizontal,
//                  itemBuilder: (BuildContext context, int index)=>Item(itemPopularData[index]),
//                  itemCount: itemDiscount.length,
//                ),
//              ),
//            )
//          ],
//        ),
//      ),
//    );

    /// Variable New Items with Card
//    var _itemNew = Padding(
//      padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
//      child: Container(
//        child: Column(
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    "New Items",
//                    style: _customTextStyleBlack,
//                  ),
//                  InkWell(
//                    onTap: null,
//                    child: Text("See More", style: _customTextStyleBlue),
//                  ),
//                ],
//              ),
//            ),
//            SingleChildScrollView(
//              child: Container(
//                margin: EdgeInsets.only(right: 10.0, bottom: 15.0),
//                height: 300.0,
//                ///
//                ///
//                /// check the condition if image data from server firebase loaded or no
//                /// if image true (image still downloading from server)
//                /// Card to set card loading animation
//                ///
//                ///
//                child: loadImage? _loadingImageAnimation(context):
//                ListView.builder(
//                  scrollDirection: Axis.horizontal,
//                  itemBuilder: (BuildContext context, int index)=> Item(newItems[index]),
//                  itemCount: itemDiscount.length,
//                ),
//              ),
//            )
//          ],
//        ),
//      ),
//    );

    /// Grid Item a product
    var _grid = SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ///
            ///
            /// check the condition if image data from server firebase loaded or no
            /// if image true (image still downloading from server)
            /// Card to set card loading animation
            ///
            ///
            GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 10.0),
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.545,
              crossAxisCount: 2,
              primary: false,
              children:List.generate(
                /// Get data in flashSaleItem.dart (ListItem folder)
                products == null ? 0 : products.length,
                    (index) => discountItem(products[index]),
              ),
            )
          ],
        ),
      ),
    );

    var _Categoryimageslide= StreamBuilder(
        stream: contentProvider.fetchTypeimageAsStream('catelogue'),
      //stream:Firestore.instance.collection('image_slider').where('status', isEqualTo: 1).where('type',isEqualTo:'catelogue').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if (snapshot.hasData) {
            if (snapshot.data.documents.length == 0){//没有子类目
              return Container(
                  color: Colors.white // This is optional
              );
            }


            setState(() {
              imagesliders = snapshot.data.documents
                  .map((doc) => ImageSlider.fromMap(doc.data, doc.documentID))
                  .toList();
            });
            return _imageSlider;
            //return imageSliderview;
          } else {
            print("nodata377");
            return CircularProgressIndicator();
          }
        });

    var _Getsubcatelogue= StreamBuilder(//get category
        //stream: contentProvider.fetchlevelCategoryAsStream(1,widget.id),
        stream:contentProvider.fetchlevelCategoryAsStream(1,widget.id),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if (snapshot.hasData) {

            if (snapshot.data.documents.length == 0){//not have category
              return Container(
                  color: Colors.white // This is optional
              );
            }

            categorys = snapshot.data.documents
                .map((doc) => Category.fromMap(doc.data, doc.documentID))
                .toList();
            categorymap = categorys.asMap();


            return _subCategory;
            //return imageSliderview;
          } else {

            return CircularProgressIndicator();
          }
        });

    var  _GetItemlist= StreamBuilder(
        stream: contentProvider.fetchProductsAsStream(widget.id),

        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if (snapshot.hasData) {
            if (snapshot.data.documents.length == 0){//没有产品
              print("noitem414");
              return Container(
                  color: Colors.white // This is optional
              );
            }
            products = snapshot.data.documents
                .map((doc) => Product.fromMap(doc.data, doc.documentID))
                .toList();

            return _grid;
            //return imageSliderview;
          } else {
            print("notdata425");
            return CircularProgressIndicator();
          }
        });


    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed:(){
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new searchAppbar()));
            },
            icon: Icon(Icons.search, color: Color(0xFF6991C7)),
          ),
        ],
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
              color: Colors.black54,
              fontFamily: "Gotik"),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF6991C7),
        ),
        elevation: 0.0,
      ),
      /// For call a variable include to body
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              //_imageSlider,
              _Categoryimageslide,
              _Getsubcatelogue,
              _GetItemlist,
//              _itemPopular,
//              _itemNew
            ],
          ),
        ),
      ),
    );
  }
}

/// Class Component a Item Discount Card
class discountItem extends StatelessWidget {

  Product item;

  discountItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, left: 10.0, bottom: 10.0, right: 0.0),
      child: InkWell(
        onTap: (){

        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF656565).withOpacity(0.15),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
                )
              ]),
          child: Wrap(
            children: <Widget>[
              Container(
                width: 160.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 185.0,
                          width: 160.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7.0),
                                  topRight: Radius.circular(7.0)),
                              image: DecorationImage(
                                  image: new NetworkImage(item.img), fit: BoxFit.cover)),
                        ),
                        Container(
                          height: 25.5,
                          width: 55.0,
                          decoration: BoxDecoration(
                              color: Color(0xFFD7124A),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(5.0))),
                          child: Center(
                              child: Text(
                                "10%",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 7.0)),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        item.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            letterSpacing: 0.5,
                            color: Colors.black54,
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 1.0)),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        item.price.toString(),
                        style: TextStyle(
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                item.rattingValue.toString(),
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
                            item.itemSale.toString(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Class Component Card in Category Detail
//class Item extends StatelessWidget {
//  //categoryItem item;
//  Product item;
//
//  Item(this.item);
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.only(
//          top: 20.0, left: 10.0, bottom: 10.0, right: 0.0),
//      child: InkWell(
//        onTap: (){
//
//        },
//        child: Container(
//          decoration: BoxDecoration(
//              color: Colors.white,
//              borderRadius: BorderRadius.all(Radius.circular(5.0)),
//              boxShadow: [
//                BoxShadow(
//                  color: Color(0xFF656565).withOpacity(0.15),
//                  blurRadius: 2.0,
//                  spreadRadius: 1.0,
////           offset: Offset(4.0, 10.0)
//                )
//              ]),
//          child: Wrap(
//            children: <Widget>[
//              Container(
//                width: 160.0,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    Container(
//                      height: 185.0,
//                      width: 160.0,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.only(
//                              topLeft: Radius.circular(7.0),
//                              topRight: Radius.circular(7.0)),
//                          image: DecorationImage(
//                              image: AssetImage(item.img), fit: BoxFit.cover)),
//                    ),
//                    Padding(padding: EdgeInsets.only(top: 7.0)),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
//                      child: Text(
//                        item.title,
//                        overflow: TextOverflow.ellipsis,
//                        style: TextStyle(
//                            letterSpacing: 0.5,
//                            color: Colors.black54,
//                            fontFamily: "Sans",
//                            fontWeight: FontWeight.w500,
//                            fontSize: 13.0),
//                      ),
//                    ),
//                    Padding(padding: EdgeInsets.only(top: 1.0)),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
//                      child: Text(
//                        item.price.toString(),
//                        style: TextStyle(
//                            fontFamily: "Sans",
//                            fontWeight: FontWeight.w500,
//                            fontSize: 14.0),
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(
//                          left: 15.0, right: 15.0, top: 5.0),
//                      child: Row(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Row(
//                            children: <Widget>[
//                              Text(
//                                item.rattingValue.toString(),
//                                style: TextStyle(
//                                    fontFamily: "Sans",
//                                    color: Colors.black26,
//                                    fontWeight: FontWeight.w500,
//                                    fontSize: 12.0),
//                              ),
//                              Icon(
//                                Icons.star,
//                                color: Colors.yellow,
//                                size: 14.0,
//                              )
//                            ],
//                          ),
//                          Text(
//                            item.itemSale.toString(),
//                            style: TextStyle(
//                                fontFamily: "Sans",
//                                color: Colors.black26,
//                                fontWeight: FontWeight.w500,
//                                fontSize: 12.0),
//                          )
//                        ],
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

///
///
///
/// Loading Item Card Animation Constructor
///
///
///
class loadingMenuItemDiscountCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, left: 10.0, bottom: 10.0, right: 0.0),
      child: InkWell(
        onTap: (){

        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF656565).withOpacity(0.15),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
                )
              ]),
          child: Wrap(
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: Colors.black38,
                highlightColor: Colors.white,
                child: Container(
                  width: 160.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 185.0,
                            width: 160.0,
                            color: Colors.black12,
                          ),
                          Container(
                            height: 25.5,
                            width: 65.0,
                            decoration: BoxDecoration(
                                color: Color(0xFFD7124A),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(5.0))),
                          )
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 5.0,top: 12.0),
                          child: Container(
                            height: 9.5,
                            width: 130.0,
                            color: Colors.black12,
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 5.0,top: 10.0),
                          child: Container(
                            height: 9.5,
                            width: 80.0,
                            color: Colors.black12,
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "",
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
                            Container(
                              height: 8.0,
                              width: 30.0,
                              color: Colors.black12,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///
///
///
/// Loading Item Card Animation Constructor
///
///
///
class loadingMenuItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, left: 10.0, bottom: 10.0, right: 0.0),
      child: InkWell(
        onTap: (){

        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF656565).withOpacity(0.15),
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
                )
              ]),
          child: Wrap(
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: Colors.black38,
                highlightColor: Colors.white,
                child: Container(
                  width: 160.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                          Container(
                            height: 185.0,
                            width: 160.0,
                            color: Colors.black12,
                          ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 5.0,top: 12.0),
                          child: Container(
                            height: 9.5,
                            width: 130.0,
                            color: Colors.black12,
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 5.0,top: 10.0),
                          child: Container(
                            height: 9.5,
                            width: 80.0,
                            color: Colors.black12,
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "",
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
                            Container(
                              height: 8.0,
                              width: 30.0,
                              color: Colors.black12,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
///
///
/// Calling imageLoading animation for set a grid layout
///
///
Widget _loadingImageAnimation(BuildContext context){
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index)=>loadingMenuItemCard(),
    itemCount: itemDiscount.length,
  );
}



///
///
/// Calling imageLoading animation for set a grid layout
///
///
Widget _loadingImageAnimationDiscount(BuildContext context){
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index)=>loadingMenuItemDiscountCard(),
    itemCount: itemDiscount.length,
  );
}
