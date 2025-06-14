//import 'package:amigatoy/Library/carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
// import 'package:amigatoy/ListItem/HomeGridItemRecomended.dart';
import 'package:amigatoy/UI/HomeUIComponent/AppbarGradient.dart';
// import 'package:amigatoy/Library/countdown/countdown.dart';
//import 'package:amigatoy/UI/HomeUIComponent/CategoryDetail.dart';

// import 'package:amigatoy/UI/HomeUIComponent/FlashSale.dart';
import 'package:amigatoy/ListItem/Product.dart';
import 'package:amigatoy/ListItem/ImageSlider.dart';
import 'package:amigatoy/ListItem/Category.dart';
import 'package:amigatoy/UI/widgets/home_image_slide.dart';
import 'package:amigatoy/UI/widgets/home_recommend.dart';
import 'package:amigatoy/provider/connectivity_provider.dart';
import 'package:provider/provider.dart';
import 'package:amigatoy/UI/widgets/home_rand_product.dart';


///Homepage

class Home extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

/// Component all widget in home
class _HomeState extends State<Home> with TickerProviderStateMixin {
  /// Declare class GridItem from HomeGridItemReoomended.dart in folder ListItem
  // late GridItem gridItem;

  bool isStarted = false;
  // var hourssub, minutesub, secondsub;

  /// CountDown for timer
  // late CountDown hours, minutes, seconds;
  // late int hourstime, minute, second = 0;

  late List<Product> products;
  late List<ImageSlider> imagesliders;
  late List<Category> categorys;
  late Map<int, Category> categorymap;



  /// Set for StartStopPress CountDown
  // onStartStopPress() {
  //   if (!mounted) return;
  //   if (this.secondsub == null) {
  //     secondsub = seconds.stream.listen(null);
  //     secondsub.onData((Duration d) {
  //       // print(d);
  //       setState(() {
  //         second = d.inSeconds;
  //       });
  //     });
  //   }
  //   if (this.minutesub == null) {
  //     minutesub = minutes.stream.listen(null);
  //     minutesub.onData((Duration d) {
  //       // print(d);
  //       setState(() {
  //         minute = d.inMinutes;
  //       });
  //     });
  //   }
  //   if (this.hourssub == null) {
  //     hourssub = hours.stream.listen(null);
  //     hourssub.onData((Duration d) {
  //       // print(d);
  //       setState(() {
  //         hourstime = d.inHours;
  //       });
  //     });
  //   }
  // }

  /// To set duration initState auto start if FlashSale Layout open
  @override
  void initState() {
    // hours = new CountDown(new Duration(hours: 24));
    // minutes = new CountDown(new Duration(hours: 1));
    // seconds = new CountDown(new Duration(minutes: 1));

    // onStartStopPress();
    // TODO: implement initState
    super.initState();

    //GridItem.getItem();
  }
  bool _isonline=true;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    _isonline=Provider.of<ConnectivityProvider>(context).isOnline;
    // print("app lost internel connect");

    // if(!isonline){
      Widget cancelButton = TextButton(
        child: Text("ok"),
        onPressed:  () {
          // Navigator.of(context).pop();
          //Navigator.pop(context);
          setState(() =>{});
        },
      );
      AlertDialog alertwidget =AlertDialog(
        title: Text("Connect error"),
        content: Text("Plese check your internet connect"),
        actions: [
          cancelButton,
        ],
      );  // show the dialog
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return alert;
      //   },
      // );
    // }
    //double size = mediaQueryData.size.height;
//    final contentProvider = Provider.of<CRUDModel>(context);
////    productProvider.fetchProductsAsStream();


//    var onClickMenuIcon = () {
//      Navigator.of(context).push(PageRouteBuilder(
//          pageBuilder: (_, __, ___) => new menuDetail(),
//          transitionDuration: Duration(milliseconds: 750),
//
//          /// Set animation with opacity
//          transitionsBuilder:
//              (_, Animation<double> animation, __, Widget child) {
//            return Opacity(
//              opacity: animation.value,
//              child: child,
//            );
//          }));
//    };

    /// Navigation to promoDetail.dart if user Click icon in Week Promotion
//    var onClickWeekPromotion = () {
//      Navigator.of(context).push(PageRouteBuilder(
//          pageBuilder: (_, __, ___) => new promoDetail(),
//          transitionDuration: Duration(milliseconds: 750),
//          transitionsBuilder:
//              (_, Animation<double> animation, __, Widget child) {
//            return Opacity(
//              opacity: animation.value,
//              child: child,
//            );
//          }));
//    };

    /// Navigation to categoryDetail.dart if user Click icon in Category
//    var onClickCategory = (id, title) {
//      //SchedulerBinding.instance.addPostFrameCallback((_){
//      Navigator.of(context).push(PageRouteBuilder(
//          pageBuilder: (_, __, ___) => new categoryDetail(id, title: title),
//          transitionDuration: Duration(milliseconds: 750),
//          transitionsBuilder:
//              (_, Animation<double> animation, __, Widget child) {
//            return Opacity(
//              opacity: animation.value,
//              child: child,
//            );
//          }));
//      //});
//    };

    /// Declare device Size
//    var deviceSize = MediaQuery.of(context).size;

    /// ImageSlider in header
//    var imageSliderview = Container(
//      height: 182.0,
//      child: new Carousel(
//          boxFit: BoxFit.cover,
//          dotColor: Color(0xFF6991C7).withOpacity(0.8),
//          dotSize: 5.5,
//          dotSpacing: 16.0,
//          dotBgColor: Colors.transparent,
//          showIndicator: true,
//          overlayShadow: true,
//          overlayShadowColors: Colors.white.withOpacity(0.9),
//          overlayShadowSize: 0.9,
////        images: [
////
////          AssetImage("assets/img/baner1.png"),
////          AssetImage("assets/img/baner12.png"),
////          AssetImage("assets/img/baner2.png"),
////          AssetImage("assets/img/baner3.png"),
////          AssetImage("assets/img/baner4.png"),
////
////        ],
//          images: imagesliders?.map((i) {
//                return NetworkImage(i.url);
//              })?.toList() ??
//              []),
//    );

//    var Fireimageslide = StreamBuilder(
//        stream: contentProvider.fetchTypeimageAsStream('home'),
//        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//          if (snapshot.hasData) {
//            imagesliders = snapshot.data.documents
//                .map((doc) => ImageSlider.fromMap(doc.data, doc.documentID))
//                .toList();
//
//            return imageSliderview;
//          } else {
//            //print("199");
//            return CircularProgressIndicator();
//          }
//        });

    //CategoryIcon Component
//    var categoryIcon = Container(
//      color: Colors.white,
//      padding: EdgeInsets.only(top: 20.0),
//      alignment: AlignmentDirectional.centerStart,
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Padding(
//            padding: EdgeInsets.only(left: 20.0, top: 0.0),
//            child: Text(
//              "Menu",
//              style: TextStyle(
//                  fontSize: 13.5,
//                  fontFamily: "Sans",
//                  fontWeight: FontWeight.w700),
//            ),
//          ),
//          Padding(padding: EdgeInsets.only(top: 20.0)),
//
//          /// Get class CategoryIconValue
//          CategoryIconValue(
//            tap1: onClickMenuIcon,
//            icon1: "assets/icon/camera.png",
//            title1: "Camera",
//            tap2: onClickMenuIcon,
//            icon2: "assets/icon/food.png",
//            title2: "Food",
//            tap3: onClickMenuIcon,
//            icon3: "assets/icon/handphone.png",
//            title3: "Handphone",
//            tap4: onClickMenuIcon,
//            icon4: "assets/icon/game.png",
//            title4: "Gamming",
//          ),
//          Padding(padding: EdgeInsets.only(top: 23.0)),
//          CategoryIconValue(
//            icon1: "assets/icon/fashion.png",
//            tap1: onClickMenuIcon,
//            title1: "Fashion",
//            icon2: "assets/icon/health.png",
//            tap2: onClickMenuIcon,
//            title2: "Health Care",
//            icon3: "assets/icon/pc.png",
//            tap3: onClickMenuIcon,
//            title3: "Computer",
//            icon4: "assets/icon/mesin.png",
//            tap4: onClickMenuIcon,
//            title4: "Equipment",
//          ),
//          Padding(padding: EdgeInsets.only(top: 23.0)),
//          CategoryIconValue(
//            icon1: "assets/icon/otomotif.png",
//            tap1: onClickMenuIcon,
//            title1: "Otomotif",
//            icon2: "assets/icon/sport.png",
//            tap2: onClickMenuIcon,
//            title2: "Sport",
//            icon3: "assets/icon/ticket.png",
//            tap3: onClickMenuIcon,
//            title3: "Ticket Cinema",
//            icon4: "assets/icon/book.png",
//            tap4: onClickMenuIcon,
//            title4: "Books",
//          ),
//          Padding(padding: EdgeInsets.only(bottom: 30.0))
//        ],
//      ),
//    );

    /// ListView a WeekPromotion Component
//    var PromoHorizontalList = Container(
//      color: Colors.white,
//      height: 230.0,
//      padding: EdgeInsets.only(bottom: 40.0),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Padding(
//              padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 3.0),
//              child: Text(
//                "Week Promotion",
//                style: TextStyle(
//                    fontSize: 15.0,
//                    fontFamily: "Sans",
//                    fontWeight: FontWeight.w700),
//              )),
//          Expanded(
//            child: ListView(
//              shrinkWrap: true,
//              padding: EdgeInsets.only(top: 10.0),
//              scrollDirection: Axis.horizontal,
//              children: <Widget>[
//                Padding(padding: EdgeInsets.only(left: 20.0)),
//                InkWell(
//                    onTap: onClickWeekPromotion,
//                    child: Image.asset("assets/imgPromo/Discount1.png")),
//                Padding(padding: EdgeInsets.only(left: 10.0)),
//                InkWell(
//                    onTap: onClickWeekPromotion,
//                    child: Image.asset("assets/imgPromo/Discount3.png")),
//                Padding(padding: EdgeInsets.only(left: 10.0)),
//                InkWell(
//                    onTap: onClickWeekPromotion,
//                    child: Image.asset("assets/imgPromo/Discount2.png")),
//                Padding(padding: EdgeInsets.only(left: 10.0)),
//                InkWell(
//                    onTap: onClickWeekPromotion,
//                    child: Image.asset("assets/imgPromo/Discount4.png")),
//                Padding(padding: EdgeInsets.only(left: 10.0)),
//                InkWell(
//                    onTap: onClickWeekPromotion,
//                    child: Image.asset("assets/imgPromo/Discount5.png")),
//                Padding(padding: EdgeInsets.only(left: 10.0)),
//                InkWell(
//                    onTap: onClickWeekPromotion,
//                    child: Image.asset("assets/imgPromo/Discount6.png")),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//
    /// FlashSale component
//    var FlashSell = Container(
//      height: 390.0,
//      decoration: BoxDecoration(
//        /// To set Gradient in flashSale background
//        gradient: LinearGradient(colors: [
//          Color(0xFF7F7FD5).withOpacity(0.8),
//          Color(0xFF86A8E7),
//          Color(0xFF91EAE4)
//        ]),
//      ),
//
//      /// To set FlashSale Scrolling horizontal
//      child: ListView(
//        scrollDirection: Axis.horizontal,
//        children: <Widget>[
//          Row(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              Padding(
//                padding:
//                EdgeInsets.only(left: mediaQueryData.padding.left + 20),
//              ),
//              Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Image.asset(
//                    "assets/img/flashsaleicon.png",
//                    height: deviceSize.height * 0.087,
//                  ),
//                  Text(
//                    "Flash",
//                    style: TextStyle(
//                      fontFamily: "Popins",
//                      fontSize: 30.0,
//                      fontWeight: FontWeight.w600,
//                      color: Colors.white,
//                    ),
//                  ),
//                  Text(
//                    "Sale",
//                    style: TextStyle(
//                      fontFamily: "Sans",
//                      fontSize: 28.0,
//                      fontWeight: FontWeight.w400,
//                      color: Colors.white,
//                    ),
//                  ),
//                  Padding(
//                    padding:
//                    EdgeInsets.only(top: mediaQueryData.padding.top + 30),
//                  ),
//                  Text(
//                    "End sale in :",
//                    style: TextStyle(
//                      fontFamily: "Sans",
//                      fontSize: 15.0,
//                      fontWeight: FontWeight.w600,
//                      color: Colors.white,
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.only(top: 2.0),
//                  ),
//                  /// Get a countDown variable
//                  Text(
//                    hourstime.toString() +
//                        " : " +
//                        minute.toString() +
//                        " : " +
//                        second.toString(),
//                    style: TextStyle(
//                      fontFamily: "Sans",
//                      fontSize: 19.0,
//                      letterSpacing: 2.0,
//                      fontWeight: FontWeight.w600,
//                      color: Colors.white,
//                    ),
//                  ),
//                ],
//              )
//            ],
//          ),
//          Padding(padding: EdgeInsets.only(left: 40.0)),
//
//          /// Get a component flashSaleItem class
//          flashSaleItem(
//            image: "assets/imgItem/mackbook.jpg",
//            title: "Apple Macbook Pro 13 with Touch Bar",
//            normalprice: "\$ 2,020",
//            discountprice: "\$ 1,300",
//            ratingvalue: "(56)",
//            place: "United Kingdom",
//            stock: "9 Available",
//            colorLine: 0xFFFFA500,
//            widthLine: 50.0,
//          ),
//          Padding(padding: EdgeInsets.only(left: 10.0)),
//          flashSaleItem(
//            image: "assets/imgItem/flashsale2.jpg",
//            title: "7 Level Karina Dress Sweet Pesta",
//            normalprice: "\$ 14",
//            discountprice: "\$ 10",
//            ratingvalue: "(16)",
//            place: "United Kingdom",
//            stock: "24 Available",
//            colorLine: 0xFF52B640,
//            widthLine: 100.0,
//          ),
//          Padding(padding: EdgeInsets.only(left: 10.0)),
//          flashSaleItem(
//            image: "assets/imgItem/flashsale3.jpg",
//            title: "Samsung Galaxy Note 9 8GB - 512GB",
//            normalprice: "\$ 1,000",
//            discountprice: "\$ 950",
//            ratingvalue: "(20)",
//            place: "United Kingdom",
//            stock: "14 Available",
//            colorLine: 0xFF52B640,
//            widthLine: 90.0,
//          ),
//          Padding(padding: EdgeInsets.only(left: 10.0)),
//          flashSaleItem(
//            image: "assets/imgItem/flashsale4.jpg",
//            title: "Harry Potter Spesial Edition ",
//            normalprice: "\$ 25",
//            discountprice: "\$ 20",
//            ratingvalue: "(22)",
//            place: "United Kingdom",
//            stock: "5 Available",
//            colorLine: 0xFFFFA500,
//            widthLine: 30.0,
//          ),
//          Padding(padding: EdgeInsets.only(left: 10.0)),
//          flashSaleItem(
//            image: "assets/imgItem/flashsale5.jpg",
//            title: "Pro Evolution Soccer 2019 Steam Original PC Games",
//            normalprice: "\$ 50",
//            discountprice: "\$ 30",
//            ratingvalue: "(10)",
//            place: "United Kingdom",
//            stock: "30 Available",
//            colorLine: 0xFF52B640,
//            widthLine: 100.0,
//          ),
//          Padding(padding: EdgeInsets.only(left: 10.0)),
//        ],
//      ),
//    );

    /// Category Component in bottom of flash sale
//    var categoryImageBottom =

//    var Categoryslide = StreamBuilder(
//        //目录的资源获取
//        stream: contentProvider.fetchlevelCategoryAsStream(0), //取顶级目录
//        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//          if (snapshot.hasData) {
//            categorys = snapshot.data.documents
//                .map((doc) => Category.fromMap(doc.data, doc.documentID))
//                .toList();
//            if (categorys.length > 0) {
//              categorymap = categorys.asMap();
//            }
//            //return categoryImageBottom;
//            return Container(
//              height: 310.0,
//              color: Colors.white,
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.only(
//                        left: 20.0, top: 20.0, right: 20.0),
//                    child: Text(
//                      "category",
//                      style: TextStyle(
//                          fontSize: 17.0,
//                          fontWeight: FontWeight.w700,
//                          fontFamily: "Sans"),
//                    ),
//                  ),
//                  Expanded(
//                    child: Padding(
//                      padding: const EdgeInsets.only(right: 20.0),
//                      child: ListView(
//                        scrollDirection: Axis.horizontal,
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.only(
//                              left: 20.0,
//                            ),
//                            child: Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Padding(padding: EdgeInsets.only(top: 15.0)),
//                                CategoryItemValue(
//                                  image: categorymap[0].image,
//                                  title: categorymap[0].title,
//                                  tap: () => onClickCategory(
//                                      categorymap[0].id, categorymap[0].title),
//                                ),
//                                Padding(
//                                  padding: EdgeInsets.only(top: 10.0),
//                                ),
//                                CategoryItemValue(
//                                  image: categorymap[1].image,
//                                  title: categorymap[1].title,
//                                  tap: () => onClickCategory(
//                                      categorymap[1].id, categorymap[1].title),
//                                ),
//                              ],
//                            ),
//                          ),
//                          Padding(padding: EdgeInsets.only(left: 10.0)),
//                          Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Padding(padding: EdgeInsets.only(top: 15.0)),
//                              CategoryItemValue(
//                                image: categorymap[2].image,
//                                title: categorymap[2].title,
//                                tap: () => onClickCategory(
//                                    categorymap[2].id, categorymap[2].title),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.only(top: 10.0),
//                              ),
//                              CategoryItemValue(
//                                image: categorymap[3].image,
//                                title: categorymap[3].title,
//                                tap: () => onClickCategory(
//                                    categorymap[3].id, categorymap[3].title),
//                              ),
//                            ],
//                          ),
//                          // Padding(padding: EdgeInsets.only(left: 10.0)),
////                          Column(
////                            crossAxisAlignment: CrossAxisAlignment.start,
////                            children: <Widget>[
////                              Padding(padding: EdgeInsets.only(top: 15.0)),
////                              CategoryItemValue(
////                                image: categorymap[4].image,
////                                title: categorymap[4].title,
////                                tap: () => onClickCategory(categorymap[4].id,categorymap[4].title),
////                              ),
////                              Padding(
////                                padding: EdgeInsets.only(top: 10.0),
////                              ),
////                              CategoryItemValue(
////                                image: categorymap[5].image,
////                                title: categorymap[5].title,
////                                tap: () => onClickCategory(categorymap[5].id,categorymap[5].title),
////                              ),
////                            ],
////                          ),
//                          // Padding(padding: EdgeInsets.only(left: 10.0)),
////                          Column(
////                            crossAxisAlignment: CrossAxisAlignment.start,
////                            children: <Widget>[
////                              Padding(padding: EdgeInsets.only(top: 15.0)),
////                              CategoryItemValue(
////                                image: categorymap[6].image,
////                                title: categorymap[6].title,
////                                tap: () => onClickCategory(categorymap[6].id,categorymap[6].title),
////                              ),
////                              Padding(
////                                padding: EdgeInsets.only(top: 10.0),
////                              ),
////                              CategoryItemValue(
////                                image: categorymap[7].image,
////                                title: categorymap[7].title,
////                                tap: () => onClickCategory(categorymap[7].id,categorymap[7].title),
////                              ),
////                            ],
////                          ),
//                        ],
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            );
//          } else {
//            return CircularProgressIndicator();
//          }
//        });

    ///  Grid item in bottom of Category
//    var Grid = SingleChildScrollView(
//      child: Container(
//        color: Colors.white,
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
//              child: Text(
//                "Recomended",
//                style: TextStyle(
//                  fontWeight: FontWeight.w700,
//                  fontSize: 17.0,
//                ),
//              ),
//            ),
//            /// To set GridView item
//            GridView.count(
//                shrinkWrap: true,
//                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//                crossAxisSpacing: 10.0,
//                mainAxisSpacing: 17.0,
//                childAspectRatio: 0.545,
//                crossAxisCount: 2,
//                primary: false,
//                children: List.generate(//change list here
//                  products==null?0:products.length,
//                      (index) => ItemGrid(products[index]),
//                )
//            )
//          ],
//        ),
//      ),
//    );

//    var Recomendlist = StreamBuilder(
//        stream: contentProvider.fetchProductsAsStream(),
//        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//          if (snapshot.hasData) {
//            products = snapshot.data.documents
//                .map((doc) => Product.fromMap(doc.data, doc.documentID))
//                .toList();
////                return ListView.builder(
////                  itemCount: products.length,
////                  itemBuilder: (buildContext, index) =>
////                      ProductCard(productDetails: products[index]),
////                );
//            return SingleChildScrollView(
//              child: Container(
//                color: Colors.white,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
//                      child: Text(
//                        "Recomended",
//                        style: TextStyle(
//                          fontWeight: FontWeight.w700,
//                          fontSize: 17.0,
//                        ),
//                      ),
//                    ),
//
//                    /// To set GridView item
//                    GridView.count(
//                        shrinkWrap: true,
//                        padding: EdgeInsets.symmetric(
//                            horizontal: 10.0, vertical: 20.0),
//                        crossAxisSpacing: 10.0,
//                        mainAxisSpacing: 17.0,
//                        childAspectRatio: 0.545,
//                        crossAxisCount: 2,
//                        primary: false,
//                        children: List.generate(
//                          //change list here
//                          products == null ? 0 : products.length,
//                          (index) => ItemGrid(products[index]),
//                        ))
//                  ],
//                ),
//              ),
//            );
//          } else {
//            return CircularProgressIndicator();
//          }
//        });

    return Scaffold(
      /// Use Stack to costume a appbar
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        top: mediaQueryData.padding.top + 58.5)),

                /// Call var imageSlider
                //imageSlider,
                //Fireimageslide,
//                HomeMenu(),

                /// Call var categoryIcon
//                categoryIcon,
//                Padding(
//                  padding: EdgeInsets.only(top: 10.0),
//                ),

                /// Call var PromoHorizontalList
                // PromoHorizontalList,

                /// Call var a FlashSell, i am sorry Typo :v
//                FlashSell,
//                Padding(
//                  padding: EdgeInsets.only(top: 10.0),
//                ),
                //Categoryslide,
//                Padding(
//                  padding: EdgeInsets.only(bottom: 2),
//                ),
   HomeImageSlide(),
                // (!_isonline)?alertwidget:Container(),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 1.0),
                // ),
   HomeRandproduct(),
                /// Call a Grid variable, this is item list in Recomended item
                //Grid,
                //recommend product list
                HomeRecommend(),
                //Recomendlist,
              ],
            ),
        ),

          /// Get a class AppbarGradient
          /// This is a Appbar in home activity
          AppbarGradient(),
        ],
      ),
    );
  }
}



/// Component FlashSaleItem
// class flashSaleItem extends StatelessWidget {
//   final String image;
//   final String title;
//   final String normalprice;
//   final String discountprice;
//   final String ratingvalue;
//   final String place;
//   final String stock;
//   final int colorLine;
//   final double widthLine;
//
//   flashSaleItem(
//       {required this.image,
//         required this.title,
//         required this.normalprice,
//         required this.discountprice,
//         required this.ratingvalue,
//         required this.place,
//         required this.stock,
//         required this.colorLine,
//         required this.widthLine});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             InkWell(
//               onTap: () {
//                 Navigator.of(context).push(PageRouteBuilder(
//                     pageBuilder: (_, __, ___) => new flashSale(),
//                     transitionsBuilder:
//                         (_, Animation<double> animation, __, Widget child) {
//                       return Opacity(
//                         opacity: animation.value,
//                         child: child,
//                       );
//                     },
//                     transitionDuration: Duration(milliseconds: 850)));
//               },
//               child: Container(
//                 height: 305.0,
//                 width: 145.0,
//                 color: Colors.white,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     SizedBox(
//                       height: 140.0,
//                       width: 145.0,
//                       child: Image.asset(
//                         image,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(left: 8.0, right: 3.0, top: 15.0),
//                       child: Text(title,
//                           style: TextStyle(
//                               fontSize: 10.5,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: "Sans")),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0, top: 5.0),
//                       child: Text(normalprice,
//                           style: TextStyle(
//                               fontSize: 10.5,
//                               decoration: TextDecoration.lineThrough,
//                               color: Colors.black54,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: "Sans")),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0, top: 5.0),
//                       child: Text(discountprice,
//                           style: TextStyle(
//                               fontSize: 12.0,
//                               color: Color(0xFF7F7FD5),
//                               fontWeight: FontWeight.w800,
//                               fontFamily: "Sans")),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5.0),
//                       child: Row(
//                         children: <Widget>[
//                           Icon(
//                             Icons.star,
//                             size: 11.0,
//                             color: Colors.yellow,
//                           ),
//                           Icon(
//                             Icons.star,
//                             size: 11.0,
//                             color: Colors.yellow,
//                           ),
//                           Icon(
//                             Icons.star,
//                             size: 11.0,
//                             color: Colors.yellow,
//                           ),
//                           Icon(
//                             Icons.star,
//                             size: 11.0,
//                             color: Colors.yellow,
//                           ),
//                           Icon(
//                             Icons.star_half,
//                             size: 11.0,
//                             color: Colors.yellow,
//                           ),
//                           Text(
//                             ratingvalue,
//                             style: TextStyle(
//                                 fontSize: 10.0,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: "Sans",
//                                 color: Colors.black38),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5.0),
//                       child: Row(
//                         children: <Widget>[
//                           Icon(
//                             Icons.location_on,
//                             size: 11.0,
//                             color: Colors.black38,
//                           ),
//                           Text(
//                             place,
//                             style: TextStyle(
//                                 fontSize: 10.0,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: "Sans",
//                                 color: Colors.black38),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10.0, left: 10.0),
//                       child: Text(
//                         stock,
//                         style: TextStyle(
//                             fontSize: 10.0,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: "Sans",
//                             color: Colors.black),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 4.0, left: 10.0),
//                       child: Container(
//                         height: 5.0,
//                         width: widthLine,
//                         decoration: BoxDecoration(
//                             color: Color(colorLine),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(4.0)),
//                             shape: BoxShape.rectangle),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }

/// Component category item bellow FlashSale
class CategoryItemValue extends StatelessWidget {
  String image, title;
  GestureTapCallback tap;

  CategoryItemValue({
    required this.image,
    required this.title,
    required this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        height: 105.0,
        width: 160.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
            color: Colors.black.withOpacity(0.25),
          ),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Berlin",
              fontSize: 18.5,
              letterSpacing: 0.7,
              fontWeight: FontWeight.w800,
            ),
          )),
        ),
      ),
    );
  }
}

/// Component item Menu icon bellow a ImageSlider
class CategoryIconValue extends StatelessWidget {
  String icon1, icon2, icon3, icon4, title1, title2, title3, title4;
  GestureTapCallback tap1, tap2, tap3, tap4;

  CategoryIconValue(
      {required this.icon1,
        required this.tap1,
        required this.icon2,
        required this.tap2,
        required this.icon3,
        required this.tap3,
        required this.icon4,
        required this.tap4,
        required this.title1,
        required this.title2,
        required this.title3,
        required this.title4});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: tap1,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon1,
                height: 19.2,
              ),
              Padding(padding: EdgeInsets.only(top: 7.0)),
              Text(
                title1,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap2,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon2,
                height: 26.2,
              ),
              Padding(padding: EdgeInsets.only(top: 0.0)),
              Text(
                title2,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap3,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon3,
                height: 22.2,
              ),
              Padding(padding: EdgeInsets.only(top: 4.0)),
              Text(
                title3,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: tap4,
          child: Column(
            children: <Widget>[
              Image.asset(
                icon4,
                height: 19.2,
              ),
              Padding(padding: EdgeInsets.only(top: 7.0)),
              Text(
                title4,
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
