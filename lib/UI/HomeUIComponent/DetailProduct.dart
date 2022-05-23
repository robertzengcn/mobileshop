//import 'package:amigatoy/Blocs/Wishs/wishs_bloc.dart';
import 'package:amigatoy/Library/carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:amigatoy/UI/CartUIComponent/CartLayout.dart';

//import 'package:flutter_rating/flutter_rating.dart';

import 'package:amigatoy/Models/Product.dart';
import 'package:amigatoy/Models/Review.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Repository/repository.dart';
//import 'package:html/parser.dart' as htmlparser;
//import 'package:html/dom.dart' as dom;
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:amigatoy/Models/Product_options.dart';
import 'package:amigatoy/Models/Product_attributes.dart';
import 'package:amigatoy/UI/LoginOrSignup/Login.dart';
import 'package:amigatoy/Arguments/LoginArguments.dart';
// import 'package:amigatoy/UI/CartUIComponent/Payment.dart';

class detailProduk extends StatefulWidget {
  Product gridItem;

  detailProduk(this.gridItem);

  @override
  _detailProdukState createState() => _detailProdukState(gridItem);
}

/// Detail Product for Recomended Grid in home screen
class _detailProdukState extends State<detailProduk> {
  /// Declaration List item HomeGridItemRe....dart Class
  final Product gridItem;
  _detailProdukState(this.gridItem);

  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductsBloc>(create: (context) {
            return ProductsBloc(
              productRepository: ProductRepository(),
            )..add(ProductScreenLoadedEvent(productId: gridItem.products_id));
          }),
          BlocProvider<ReviewsBloc>(create: (context) {
            //加载产品的评论
            return ReviewsBloc(reviewRepository: ReviewRepository())
              ..add(FetchProReviewsEvent(pid: gridItem.products_id));
          }),
          BlocProvider<RelativeProductBloc>(create: (context) {
            //加载产品的评论
            return RelativeProductBloc(productRepository: ProductRepository())
              ..add(FetchRelativeProductEvent(productId: gridItem.products_id));
          }),
          BlocProvider<CartsBloc>(create: (context) {
            //加载产品的评论
            return CartsBloc(cartRepository: CartRepository());
          }),
          BlocProvider<WishsBloc>(create: (context) {
            //加载产品的评论
            return WishsBloc(wishRepository: WishRepository())
              ..add(CheckWishsEvent(product_id: gridItem.products_id));
          }),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<CartsBloc, CartsState>(listener: (context, state) {
              if (state is CartsAddsuccessState) {
                var snackbar = SnackBar(
                  content: Text("Item Added"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              } else if (state is CartsErrorState) {
                var snackbar = SnackBar(
                  content: Text("Item Added failure"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }else if(state is CartsAddfinishState){
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>
                    new Cartpage(),
                    transitionDuration:
                        Duration(milliseconds: 900),

                    /// Set animation Opacity in route to detailProduk layout
                    transitionsBuilder: (_,
                        Animation<double> animation,
                        __,
                        Widget child) {
                      return Opacity(
                        opacity: animation.value,
                        child: child,
                      );
                    })).then((_) => setState(() {}));
              }
            }),
            BlocListener<WishsBloc, WishsState>(listener: (context, state) {
              if (state is WishErrorState) {}
            }),
          ],
          child: ProductWrapper(),
        ));
  }
}

class ProductWrapper extends StatefulWidget {
  @override
  _ProductWrapperState createState() => _ProductWrapperState();
}

class _ProductWrapperState extends State<ProductWrapper> {
//  double rating = 3.5;
  int starCount = 5;
  //  @override
//  static late BuildContext ctx;
  int valueItemChart = 0;

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  List<int?> aoptionList = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<dynamic> prolist = [];
  void initState() {
//    for (var i = 0; i < 10; i++) {
//      aoptionList[i] = 0;
//    }
    super.initState();
  }

//  int? _character =0;
  Widget _productDesc(String productdesc) {
    Widget html = Html(
      data: productdesc,
    );
    return html;
  }

  /// BottomSheet for view more in specification
  void _bottomSheet(String productDesc) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Container(
                  height: 1500.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Center(
                          child: Text(
                        "Description",
                        style: _subHeaderCustomStyle,
                      )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
//                        child: Text(
//                            productDesc,
//                            style: _detailText),
                        child: _productDesc(productDesc),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 20.0),
                      //   child: Text(
                      //     "Spesifications :",
                      //     style: TextStyle(
                      //         fontFamily: "Gotik",
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 15.0,
                      //         color: Colors.black,
                      //         letterSpacing: 0.3,
                      //         wordSpacing: 0.5),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                      //   child: Text(
                      //     " - Lorem ipsum is simply dummy  ",
                      //     style: _detailText,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  /// Custom Text black
  static var _customTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: "Gotik",
    fontSize: 17.0,
    fontWeight: FontWeight.w800,
  );

  /// Custom Text black
  static var _normalpriceStyle = TextStyle(
    color: Colors.red,
    fontFamily: "Gotik",
    fontSize: 17.0,
    fontWeight: FontWeight.w800,
  );

  /// Custom Text black
  static var _nomalpricedisableStyle = TextStyle(
    color: Colors.grey,
    fontFamily: "Gotik",
    fontSize: 16.0,
    fontWeight: FontWeight.w800,
    decoration: TextDecoration.lineThrough,
  );

  /// Custom Text for Header title
  static var _subHeaderCustomStyle = TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.w700,
      fontFamily: "Gotik",
      fontSize: 16.0);

  /// Custom Text for Detail title
  // static var _detailText = TextStyle(
  //     fontFamily: "Gotik",
  //     color: Colors.black54,
  //     letterSpacing: 0.3,
  //     wordSpacing: 0.5);

//  static ButtonStyle _addtoCartStyle = ElevatedButton.styleFrom(
////    textStyle: const TextStyle(fontSize: 13),
////    primary: Colors.red, // background
////    onPrimary: Colors.white, // foreground
////  );

  /// Variable Component UI use in bottom layout "Top Rated Products"
//  var _suggestedItem = Padding(
//    padding:
//        const EdgeInsets.only(left: 15.0, right: 20.0, top: 30.0, bottom: 20.0),
//    child: Container(
//      height: 280.0,
//      child: Column(
//        children: <Widget>[
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                "Top Rated Products",
//                style: TextStyle(
//                    fontWeight: FontWeight.w600,
//                    fontFamily: "Gotik",
//                    fontSize: 15.0),
//              ),
//              InkWell(
//                onTap: () {},
//                child: Text(
//                  "See All",
//                  style: TextStyle(
//                      color: Colors.indigoAccent.withOpacity(0.8),
//                      fontFamily: "Gotik",
//                      fontWeight: FontWeight.w700),
//                ),
//              )
//            ],
//          ),
//          Expanded(
//            child: ListView(
//              padding: EdgeInsets.only(top: 20.0, bottom: 2.0),
//              scrollDirection: Axis.horizontal,
//              children: <Widget>[
//                FavoriteItem(
//                  image: "assets/imgItem/shoes1.jpg",
//                  title: "Firrona Skirt!",
//                  Salary: "\$ 10",
//                  Rating: "4.8",
//                  sale: "923 Sale",
//                ),
//                Padding(padding: EdgeInsets.only(left: 10.0)),
//                FavoriteItem(
//                  image: "assets/imgItem/acesoris1.jpg",
//                  title: "Arpenaz 4",
//                  Salary: "\$ 200",
//                  Rating: "4.2",
//                  sale: "892 Sale",
//                ),
//                Padding(padding: EdgeInsets.only(left: 10.0)),
//                FavoriteItem(
//                  image: "assets/imgItem/kids1.jpg",
//                  title: "Mon Cheri Pingun",
//                  Salary: "\$ 3",
//                  Rating: "4.8",
//                  sale: "110 Sale",
//                ),
//                Padding(padding: EdgeInsets.only(left: 10.0)),
//                FavoriteItem(
//                  image: "assets/imgItem/man1.jpg",
//                  title: "Polo T Shirt",
//                  Salary: "\$ 8",
//                  Rating: "4.4",
//                  sale: "210 Sale",
//                ),
//                Padding(padding: EdgeInsets.only(right: 10.0)),
//              ],
//            ),
//          ),
//        ],
//      ),
//    ),
//  );

  Widget _productSpecialdiv(
      double product_price, double? product_specials_price) {
    List<Widget> oList = [];
    oList.add(Text(
      '\$' + product_price.toString(),
      style: product_specials_price != null && product_specials_price > 0
          ? _nomalpricedisableStyle
          : _normalpriceStyle,
    ));

    if (product_specials_price != null && product_specials_price > 0) {
      oList.add(Padding(padding: EdgeInsets.only(top: 10.0)));
      oList.add(Text(
        '\$' + product_specials_price.toString(),
        style: _normalpriceStyle,
      ));
    }
    return Column(children: oList);
  }

  Widget _imageRadio(ProductAtttibutes item, int changeKey) {
    return Hero(
      tag: "hero-grid-${item.products_attributes_id}",
      child: Material(
        child: InkWell(
            onTap: () {
              aoptionList[changeKey] = item.products_options_values_id;
              Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) {
                    // double _screenwidth = MediaQuery. of(context). size. width;
                    return new Material(
                      color: Colors.black54,
                      child: Container(
                        padding: EdgeInsets.all(30.0),
                        child: InkWell(
                          child: Hero(
                            tag: "hero-grid-${item.products_attributes_id}",
                            child: CachedNetworkImage(
                              imageUrl: item.products_options_images_url!,
                              width: 300.0,
                              height: 300.0,
                              alignment: Alignment.center,
                              fit: BoxFit.contain,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            // Image.network(
                            //   item.products_options_images_url!,
                            //   width: 300.0,
                            //   height: 300.0,
                            //   alignment: Alignment.center,
                            //   fit: BoxFit.contain,
                            // )
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                  transitionDuration: Duration(milliseconds: 500)));
            },
            child: SizedBox(
              height: 50,
              width: 80,
              child:
//              GestureDetector(
//                onTap: () {
//                  setState(() => aoptionList[changeKey] = item.products_attributes_id);},
//                child:
                  Container(
                      height: 56,
                      width: 56,
                      color: Colors.transparent,
                      child:
                          // Image.network(item.products_options_images_url!),
                          CachedNetworkImage(
                        imageUrl: item.products_options_images_url!,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )),
//              )
            )),
      ),
    );
  }

  List<Widget> _attributeslist(
      List<ProductAtttibutes>? productatttibutes, int changeKey) {
    List<Widget> wList = [];
//    print(productatttibutes);
//    int? _pcharacter = productatttibutes?.first.products_attributes_id;
    if (aoptionList[changeKey] == 0) {
      aoptionList[changeKey] =
          productatttibutes?.first.products_options_values_id;
    }
//    print(_character);
    productatttibutes?.forEach((item) {
//      print(item.products_options_type);
      if (item.products_options_type == 2) {
        if (item.products_options_images_style &&
            (item.products_options_images_url?.isNotEmpty == true)) {
          //图片radio
          if (aoptionList[changeKey] == null) {
            aoptionList[changeKey] = 0;
          }
          wList.add(_imageRadio(item, changeKey)
//              SizedBox(
//              height: 50,
//              width: 100,
//              child:GestureDetector(
//            onTap: () {
//              setState(() => aoptionList[changeKey] = item.products_attributes_id);},
//            child: Container(
//              height: 56,
//              width: 56,
//              color: Colors.transparent,
//              child: Image.network(item.products_options_images_url!),
//            ),
//          ))
              );
        } else {
          wList.add(SizedBox(
              height: 50,
              //width: 100,
              child: RadioListTile<int>(
                title: Text(item.products_options_values_name),
                value: item.products_options_values_id,
                groupValue: aoptionList[changeKey],
                onChanged: (int? value) {
                  setState(() {
                    aoptionList[changeKey] = value;
                  });
                },
              )));
        }
//        ));
//        wList.add(Padding(padding: EdgeInsets.only(left: 15.0)));

      }
    });
    return wList;
  }

  ///产品属性列表
  Widget _getAttributes(ProductOptions products_option,
      List<ProductAtttibutes>? productatttibutes, int changeKey) {
    //loop product attributes
    List<Widget> oList = [];
//    oList.add(Text(products_option.products_options_name,
//        style: _subHeaderCustomStyle));
    oList.add(Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: Text(products_option.products_options_name + ":",
          style: _subHeaderCustomStyle),
    ));
//    oList.add(SizedBox(height: 30));
    List<Widget> attlist = _attributeslist(productatttibutes, changeKey);
    Widget rowColumn = Wrap(
        alignment: WrapAlignment.center,
        direction: Axis.horizontal,
        spacing: 2.0,
        runSpacing: 4.0,
//        mainAxisAlignment: MainAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: attlist);

    oList.add(rowColumn);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: oList);

//    return Row(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//
//          Text(products_option.products_options_name, style: _subHeaderCustomStyle),
//          Row(
//            children: <Widget>[
//              RadioButtonCustom(
//                txt: "S",
//              ),
//              Padding(
//                  padding:
//                  EdgeInsets.only(left: 15.0)),
//              RadioButtonCustom(
//                txt: "M",
//              ),
//              Padding(
//                  padding:
//                  EdgeInsets.only(left: 15.0)),
//              RadioButtonCustom(
//                txt: "L",
//              ),
//              Padding(
//                  padding:
//                  EdgeInsets.only(left: 15.0)),
//              RadioButtonCustom(
//                txt: "XL",
//              ),
//            ],
//          ),
//          Padding(
//              padding: EdgeInsets.only(top: 15.0)),
//          Divider(
//            color: Colors.black12,
//            height: 1.0,
//          ),
//          Padding(
//              padding: EdgeInsets.only(top: 10.0)),
//
//          Text(
//            "Color",
//            style: _subHeaderCustomStyle,
//          ),
//          Row(
//            children: <Widget>[
//              RadioButtonColor(Colors.black),
//              Padding(
//                  padding:
//                  EdgeInsets.only(left: 15.0)),
//              RadioButtonColor(Colors.white),
//              Padding(
//                  padding:
//                  EdgeInsets.only(left: 15.0)),
//              RadioButtonColor(Colors.blue),
//            ],
//          ),
//
//        ]);
  }

  Widget _productSalewidget(int? productSales) {
    if (productSales != null && productSales > 0) {
      return Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Text(
          productSales.toString() + " Orders",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 13.0,
              fontWeight: FontWeight.w500),
        ),
      );
    } else {
      return Container();
    }
  }

  ///返回wish list widget
  Widget _getProductwish(int? productwishnum) {
    if (productwishnum != null && productwishnum > 0) {
      return Container(
        height: 30.0,
        width: 75.0,
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
//                                                children: _getProductwish(
//                                                    state.product.product_wish),

          children: <Widget>[
            //product wish list
            Text(
              productwishnum.toString(),
              style: TextStyle(color: Colors.white),
            ),
            Padding(padding: EdgeInsets.only(left: 8.0)),
            Icon(
              Icons.star,
              color: Colors.white,
              size: 19.0,
            ),
          ],
        ),
      );
    } else {
      return Container(height: 30.0, width: 75.0);
    }
  }

  ///return wish add success icon
  Widget _addWishsuccessicon() {
    return Center(
      child: Image.asset("assets/icon/wishsuccess.png", height: 20.0),
    );
  }

  int? optionOne = 0;
  int? option1 = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
        bloc: BlocProvider.of<ProductsBloc>(context),
        builder: (BuildContext context, ProductsState state) {
          if (state is ProductsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductsloadedState) {
            final Product _pageProduct = state.product;
            prolist = [];
            state.product.products_image_list?.forEach((value) {
              prolist.add(value);
            });
//            prolist = state.product.products_image_list;
            prolist.insert(0, state.product.products_image);
//            print(prolist);
            List<Widget> productAtt = [];

//            var products_attributor_arr=state.product.products_attributor?.values.toList();
//            state.product.products_option?.map((i,v){
//              _getAttributes(v,products_attributor_arr[i]);
//            });
            //处理产品属性
            if (state.product.products_option != null) {
              int i = 1;
              for (var key
                  in state.product.products_option?.values.toList() ?? []) {
                Widget productAttri = _getAttributes(
                    key,
                    state.product.products_attributor?[key.products_option_id],
                    i);
//                print(state.product.products_attributor?.keys);
//                print(348);
//                print(key.products_option_id);
//                print(state.product.products_attributor?[key.products_option_id]);
                productAtt.add(productAttri);
                productAtt.add(Padding(padding: EdgeInsets.only(top: 15.0)));
                productAtt.add(Divider(
                  color: Colors.black12,
                  height: 1.0,
                ));
                productAtt.add(Padding(padding: EdgeInsets.only(top: 10.0)));
                i++;
              }
//              print(productAtt);
            }
            return Scaffold(
              key: _key,
              appBar: AppBar(
                leading:  IconButton(
                  color:Colors.black54,
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                actions: <Widget>[
                  InkWell(
                    onTap: () {
                      // Navigator.of(context).push(PageRouteBuilder(
                      //     pageBuilder: (_, __, ___) => new Cartpage()));
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => new Cartpage(),
                          transitionDuration: Duration(milliseconds: 900),

                          /// Set animation Opacity in route to detailProduk layout
                          transitionsBuilder: (_, Animation<double> animation,
                              __, Widget child) {
                            return Opacity(
                              opacity: animation.value,
                              child: child,
                            );
                          })).then((_) => setState(() {}));
                    },
                    child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, authcatState) {
                        if (authcatState is AuthenticationAuthenticated) {
                          BlocProvider.of<CartsBloc>(context)
                              .add(queryCartquantityEvent());

                          return BlocBuilder<CartsBloc, CartsState>(
                            builder: (context, cartState) {
                              if (cartState is CartsQuantitygetsuccessState ||
                                  cartState is CartsAddsuccessState) {
                                valueItemChart = cartState.cartQuantity;
                              }
                              return Stack(
                                alignment: AlignmentDirectional(-1.0, -0.8),
                                children: <Widget>[
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.black26,
                                      )),
                                  CircleAvatar(
                                    radius: 10.0,
                                    backgroundColor: Colors.red,
                                    child: Text(
                                      valueItemChart.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13.0),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
                elevation: 0.5,
                centerTitle: true,
                backgroundColor: Colors.white,
                title: Text(
                  "Produk Detail",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    fontSize: 17.0,
                    fontFamily: "Gotik",
                  ),
                ),
              ),
              body: Column(
                children: <Widget>[
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          /// Header image slider
                          Container(
                            height: 300.0,
                            child: Hero(
                              tag: "hero-grid-${state.product.products_id}",
                              child: Material(
                                child: new Carousel(
                                    dotColor: Colors.black26,
                                    dotIncreaseSize: 1.7,
                                    dotBgColor: Colors.transparent,
                                    autoplay: false,
                                    radius: Radius.circular(8.0),
                                    boxFit: BoxFit.cover,
                                    overlayShadowColors:
                                        (Colors.grey[800] != null)
                                            ? Colors.grey[800]
                                            : Colors.grey[800],
                                    images: prolist
                                        .map((s) =>
                                            // NetworkImage(s)
                                            CachedNetworkImage(
                                              imageUrl: s,
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ) as dynamic)
                                        .toList()),
                              ),
                            ),
                          ),

                          /// Background white title,price and ratting
                          Container(
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Color(0xFF656565).withOpacity(0.15),
                                blurRadius: 1.0,
                                spreadRadius: 0.2,
                              )
                            ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    state.product.products_name,
                                    style: _customTextStyle,
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 15.0)),
//                                  Text(
//                                    '\$'+state.product.products_price.toString(),
//                                    style: _normalpriceStyle,
//                                  ),
                                  _productSpecialdiv(
                                      state.product.products_price,
                                      state.product.product_specials),
                                  Padding(padding: EdgeInsets.only(top: 10.0)),
                                  Divider(
                                    color: Colors.black12,
                                    height: 1.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            _getProductwish(
                                                state.product.product_wish),
//                                            Container(
//                                              height: 30.0,
//                                              width: 75.0,
//                                              decoration: BoxDecoration(
//                                                color: Colors.lightGreen,
//                                                borderRadius: BorderRadius.all(
//                                                    Radius.circular(20.0)),
//                                              ),
//                                              child: Row(
//                                                crossAxisAlignment:
//                                                    CrossAxisAlignment.center,
//                                                mainAxisAlignment:
//                                                    MainAxisAlignment.center,
////                                                children: _getProductwish(
////                                                    state.product.product_wish),
//
//                                                children: <Widget>[//product wish list
//                                                  Text(
//                                                    state.product
//                                                        .products_quantity
//                                                        .toString(),
//                                                    style: TextStyle(
//                                                        color: Colors.white),
//                                                  ),
//                                                  Padding(
//                                                      padding: EdgeInsets.only(
//                                                          left: 8.0)),
//                                                  Icon(
//                                                    Icons.star,
//                                                    color: Colors.white,
//                                                    size: 19.0,
//                                                  ),
//                                                ],
//                                              ),
//                                            ),
                                          ],
                                        ),
                                        _productSalewidget(
                                            state.product.product_sales),
//                                        ElevatedButton(
//                                          style: _addtoCartStyle,
//                                          onPressed: () {},
//                                          child: const Text('Add to Cart'),
//                                        ),
//                                        Padding(
//                                          padding: const EdgeInsets.only(
//                                              right: 15.0),
//                                          child: Text(
//                                            state.product.products_quantity
//                                                .toString(),
//                                            style: TextStyle(
//                                                color: Colors.black54,
//                                                fontSize: 13.0,
//                                                fontWeight: FontWeight.w500),
//                                          ),
//                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          /// Background white for chose Size and Color
                          (productAtt.isNotEmpty)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
//                              height: 120.0,
                                    width: 600.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFF656565)
                                                .withOpacity(0.15),
                                            blurRadius: 1.0,
                                            spreadRadius: 0.2,
                                          )
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0, left: 20.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: productAtt
//                                  <Widget>[
//                                    ///attributes start
//                                    Text("Size", style: _subHeaderCustomStyle),
//                                    Row(
//                                      children: <Widget>[
//                                        RadioButtonCustom(
//                                          txt: "S",
//                                        ),
//                                        Padding(
//                                            padding:
//                                                EdgeInsets.only(left: 15.0)),
//                                        RadioButtonCustom(
//                                          txt: "M",
//                                        ),
//                                        Padding(
//                                            padding:
//                                                EdgeInsets.only(left: 15.0)),
//                                        RadioButtonCustom(
//                                          txt: "L",
//                                        ),
//                                        Padding(
//                                            padding:
//                                                EdgeInsets.only(left: 15.0)),
//                                        RadioButtonCustom(
//                                          txt: "XL",
//                                        ),
//                                      ],
//                                    ),
//                                    Padding(
//                                        padding: EdgeInsets.only(top: 15.0)),
//                                    Divider(
//                                      color: Colors.black12,
//                                      height: 1.0,
//                                    ),
//                                    Padding(
//                                        padding: EdgeInsets.only(top: 10.0)),
//                                    Text(
//                                      "Color",
//                                      style: _subHeaderCustomStyle,
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        RadioButtonColor(Colors.black),
//                                        Padding(
//                                            padding:
//                                                EdgeInsets.only(left: 15.0)),
//                                        RadioButtonColor(Colors.white),
//                                        Padding(
//                                            padding:
//                                                EdgeInsets.only(left: 15.0)),
//                                        RadioButtonColor(Colors.blue),
//                                      ],
//                                    ),
//                                    ///attributes end
//                                  ],
                                          ),
                                    ),
                                  ),
                                )
                              : Container(),

                          /// Background white for description
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              height: 205.0,
                              width: 600.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Color(0xFF656565).withOpacity(0.15),
                                      blurRadius: 1.0,
                                      spreadRadius: 0.2,
                                    )
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        "Description",
                                        style: _subHeaderCustomStyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0,
                                          right: 20.0,
                                          bottom: 10.0,
                                          left: 20.0),
//                                      child: Text(state.product.products_shortdesc??state.product.products_name,
//                                          style: _detailText),
                                      child: _productDesc(
                                          state.product.products_shortdesc ??
                                              state.product.products_name),
                                    ),
                                    Center(
                                      child: InkWell(
                                        onTap: () {
                                          _bottomSheet(state.product
                                                  .products_description ??
                                              state.product.products_name);
                                        },
                                        child: Text(
                                          "View More",
                                          style: TextStyle(
                                            color: Colors.indigoAccent,
                                            fontSize: 15.0,
                                            fontFamily: "Gotik",
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                          ///review 出现位置
                          ReviewInfoContiner(),
                          RelativeProductContiner(),
//                          _suggestedItem
                        ],
                      ),
                    ),
                  ),

                  /// If user click icon chart SnackBar show
                  /// this code to show a SnackBar
                  /// and Increase a valueItemChart + 1
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        if (state is AuthenticationAuthenticated) {
                          Map<int, int?> args = {};
                          //获取属性
                          int oi = 1;
                          for (var okey in _pageProduct.products_option?.values
                                  .toList() ??
                              []) {
                            if (aoptionList[oi] != null &&
                                aoptionList[oi]! > 0) {
                              args[okey.products_option_id] = aoptionList[oi];
                            }
                            oi++;
                          }
//
                          BlocProvider.of<CartsBloc>(context).add(
                              AddToCartEvent(
                                  productId: _pageProduct.products_id,
                                  quantity: 1,
                                  args: args,
                                gotocart: false
                              ));
                        } else {
//                          Navigator.of(context).push(PageRouteBuilder(
//                              pageBuilder: (_, __, ___) => new loginScreen()));
                          Navigator.pushNamed(context, loginScreen.routeName,
                              arguments: LoginArguments(_pageProduct));
                        }

//              _key.currentState?.showSnackBar(snackbar);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 40.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                    color: Colors.white12.withOpacity(0.1),
                                    border: Border.all(color: Colors.black12)),
                                child: Center(
                                  child: Image.asset(
                                    "assets/icon/shopping-cart.png",
                                    height: 23.0,
                                  ),
                                ),
                              ),

                              /// Chat Icon
                              InkWell(
                                onTap: () {
                                  if (state is AuthenticationAuthenticated) {
                                    BlocProvider.of<WishsBloc>(context).add(
                                        AddWishsEvent(
                                            product_id:
                                                _pageProduct.products_id));
                                  } else {
                                    Navigator.pushNamed(
                                        context, loginScreen.routeName,
                                        arguments:
                                            LoginArguments(_pageProduct));
                                  }
//                                  Navigator.of(context).push(PageRouteBuilder(
//                                      pageBuilder: (_, ___, ____) =>
//                                          new chatItem()));
                                },
                                child: Container(
                                  height: 40.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white12.withOpacity(0.1),
                                      border:
                                          Border.all(color: Colors.black12)),
                                  child: BlocBuilder<WishsBloc, WishsState>(
                                    builder: (context, Wishstate) {
                                      if (Wishstate is WishChecksuccessState) {
                                        if (Wishstate.inWishlist) {
//                                          return Center(
//                                            child: Image.asset(
//                                                "assets/icon/wishsuccess.png",
//                                                height: 20.0),
//                                          );
                                          return _addWishsuccessicon();
                                        } else {
                                          return Center(
                                            child: Image.asset(
                                                "assets/icon/addwish.png",
                                                height: 20.0),
                                          );
                                        }
                                      } else if (Wishstate
                                          is WishAddsuccessState) {
                                        return _addWishsuccessicon();
                                      } else {
                                        return Center(
                                          child: Image.asset(
                                              "assets/icon/addwish.png",
                                              height: 20.0),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),

                              /// Button Pay
                              InkWell(
                                onTap: () {
                                  // Navigator.of(context).push(PageRouteBuilder(
                                  //     pageBuilder: (_, __, ___) =>
                                  //         new payment()));
                                  if (state is AuthenticationAuthenticated) {
                                    Map<int, int?> args = {};
                                    //get product attributes
                                    int oi = 1;
                                    for (var okey in _pageProduct
                                            .products_option?.values
                                            .toList() ??
                                        []) {
                                      if (aoptionList[oi] != null &&
                                          aoptionList[oi]! > 0) {
                                        args[okey.products_option_id] =
                                            aoptionList[oi];
                                      }
                                      oi++;
                                    }
//
                                    BlocProvider.of<CartsBloc>(context).add(
                                        AddToCartEvent(
                                            productId: _pageProduct.products_id,
                                            quantity: 1,
                                            args: args,gotocart: true));

                                  } else {
                                    Navigator.pushNamed(
                                        context, loginScreen.routeName,
                                        arguments:
                                            LoginArguments(_pageProduct));
                                  }
                                },
                                child: Container(
                                  height: 45.0,
                                  width: 200.0,
                                  decoration: BoxDecoration(
                                    color: Colors.indigoAccent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Checkout",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            );
          }
          return Container();
        });
  }
}

class ReviewInfoContiner extends StatefulWidget {
  @override
  _ReviewInfoContinerState createState() => _ReviewInfoContinerState();
}

class _ReviewInfoContinerState extends State<ReviewInfoContiner> {
  double rating = 3.5;

  /// Custom Text for Detail title
  static var _detailText = TextStyle(
      fontFamily: "Gotik",
      color: Colors.black54,
      letterSpacing: 0.3,
      wordSpacing: 0.5);

  /// Custom Text for Header title
  static var _subHeaderCustomStyle = TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.w700,
      fontFamily: "Gotik",
      fontSize: 16.0);
  Widget _buildRating(
      String date, String details, Function changeRating, String image) {
    return Expanded(
        child: ListTile(
      leading: Container(
        height: 45.0,
        width: 45.0,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
      ),
      title: Row(
        children: <Widget>[
//          StarRating(
//              size: 20.0,
//              rating: 3.5,
//              starCount: 5,
//              color: Colors.yellow,
//              onRatingChanged: changeRating),
          SizedBox(width: 8.0),
          Text(
            date,
            style: TextStyle(fontSize: 12.0),
          )
        ],
      ),
      subtitle: Text(
        details,
        style: _detailText,
      ),
    ));
  }

  Widget _buildReviwlist(Review review) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd H:m');
    final String reviewdate = formatter.format(review.review_time);
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
//      Expanded(
//        child: Padding(
//          padding:
//              EdgeInsets.only(left: 0.0, right: 2.0, top: 5.0, bottom: 7.0),
//          child: _line(),
//        ),
//      ),
          _buildRating(reviewdate, review.description, (rating) {
            setState(() {
              this.rating = rating;
            });
          }, "assets/img/userphoto.png"),

//    ),
//    )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
        bloc: BlocProvider.of<ReviewsBloc>(context),
        builder: (BuildContext context, ReviewsState state) {
          if (state is ReviewloadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ReviewloadedState) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                // height: 415.0,
                width: 600.0,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Color(0xFF656565).withOpacity(0.15),
                    blurRadius: 1.0,
                    spreadRadius: 0.2,
                  )
                ]),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Reviews',
                            style: _subHeaderCustomStyle,
                          ),
//                          Padding(
//                            padding: const EdgeInsets.only(
//                                left: 20.0, top: 15.0, bottom: 15.0),
//                            child: Row(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              children: <Widget>[
//                                InkWell(
//                                  child: Padding(
//                                      padding:
//                                          EdgeInsets.only(top: 2.0, right: 3.0),
//                                      child: Text(
//                                        'View All',
//                                        style: _subHeaderCustomStyle.copyWith(
//                                            color: Colors.indigoAccent,
//                                            fontSize: 14.0),
//                                      )),
//                                  onTap: () {
//                                    Navigator.of(context).push(PageRouteBuilder(
//                                        pageBuilder: (_, __, ___) =>
//                                            ReviewsAll()));
//                                  },
//                                ),
//                                Padding(
//                                  padding: const EdgeInsets.only(
//                                      right: 15.0, top: 2.0),
//                                  child: Icon(
//                                    Icons.arrow_forward_ios,
//                                    size: 18.0,
//                                    color: Colors.black54,
//                                  ),
//                                )
//                              ],
//                            ),
//                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
//                                      StarRating(
//                                        size: 25.0,
//                                        starCount: 5,
//                                        rating: 4.0,
//                                        color: Colors.yellow,
//                                      ),
                                SizedBox(width: 5.0),
                                Text(state.reviewlist.length.toString() +
                                    ' Reviews')
                              ]),
                        ],
                      ),
//                        state.reviewlist.map()
                      for (var i in state.reviewlist) _buildReviwlist(i),

//                        Padding(
//                          padding: EdgeInsets.only(
//                              left: 0.0,
//                              right: 20.0,
//                              top: 15.0,
//                              bottom: 7.0),
//                          child: _line(),
//                        ),

//                        _buildRating('18 Nov 2018',
//                            'Item delivered in good condition. I will recommend to other buyer.',
//                                (rating) {
//                              setState(() {
//                                this.rating = rating;
//                              });
//                            }, "assets/avatars/avatar-4.jpg"),
//                        Padding(
//                          padding: EdgeInsets.only(
//                              left: 0.0,
//                              right: 20.0,
//                              top: 15.0,
//                              bottom: 7.0),
//                          child: _line(),
//                        ),
//                        _buildRating('18 Nov 2018',
//                            'Item delivered in good condition. I will recommend to other buyer.',
//                                (rating) {
//                              setState(() {
//                                this.rating = rating;
//                              });
//                            }, "assets/avatars/avatar-2.jpg"),
                      Padding(padding: EdgeInsets.only(bottom: 20.0)),
                    ],
                  ),
                ),
              ),
            );
//            );
          }
          return Container();
        });
  }
}

class RelativeProductContiner extends StatefulWidget {
  @override
  _RelativeProductContinerState createState() =>
      _RelativeProductContinerState();
}

class _RelativeProductContinerState extends State<RelativeProductContiner> {
  List<Widget> _getRelativepro(List<Product>? productlist) {
    List<Widget> relativelist = [];
    productlist?.forEach((value) {
      relativelist.add(FavoriteItem(
        image: value.products_image,
        title: value.products_name,
        Salary: value.product_specials != null && value.product_specials! > 0
            ? value.product_specials.toString()
            : value.products_price.toString(),
        Rating: value.product_wish != null && value.product_wish! > 0
            ? value.product_wish
            : 0,
        sale: value.product_sales != null && value.product_sales! > 0
            ? value.product_sales
            : 0,
        product: value,
      ));
      relativelist.add(Padding(padding: EdgeInsets.only(left: 5.0)));
    });
    return relativelist;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelativeProductBloc, RelativeProductState>(
        bloc: BlocProvider.of<RelativeProductBloc>(context),
        builder: (BuildContext context, RelativeProductState state) {
          if (state is RelativeProductloading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RelativeProductloadedState) {
            return state.lstRelative.isNotEmpty?Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 20.0, top: 30.0, bottom: 20.0),
              child: Container(
                height: 280.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Top Rated Products",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: "Gotik",
                              fontSize: 15.0),
                        ),
//                        InkWell(
//                          onTap: () {},
//                          child: Text(
//                            "See All",
//                            style: TextStyle(
//                                color: Colors.indigoAccent.withOpacity(0.8),
//                                fontFamily: "Gotik",
//                                fontWeight: FontWeight.w700),
//                          ),
//                        )
                      ],
                    ),
                    Expanded(
                      child: ListView(
                          padding: EdgeInsets.only(top: 20.0, bottom: 2.0),
                          scrollDirection: Axis.horizontal,
                          children: _getRelativepro(state.lstRelative)
//                        <Widget>[
//                        FavoriteItem(
//                          image: "assets/imgItem/shoes1.jpg",
//                          title: "Firrona Skirt!",
//                          Salary: "\$ 10",
//                          Rating: "4.8",
//                          sale: "923 Sale",
//                        ),
//                        Padding(padding: EdgeInsets.only(left: 10.0)),
//                        FavoriteItem(
//                          image: "assets/imgItem/acesoris1.jpg",
//                          title: "Arpenaz 4",
//                          Salary: "\$ 200",
//                          Rating: "4.2",
//                          sale: "892 Sale",
//                        ),
//                        Padding(padding: EdgeInsets.only(left: 10.0)),
//                        FavoriteItem(
//                          image: "assets/imgItem/kids1.jpg",
//                          title: "Mon Cheri Pingun",
//                          Salary: "\$ 3",
//                          Rating: "4.8",
//                          sale: "110 Sale",
//                        ),
//                        Padding(padding: EdgeInsets.only(left: 10.0)),
//                        FavoriteItem(
//                          image: "assets/imgItem/man1.jpg",
//                          title: "Polo T Shirt",
//                          Salary: "\$ 8",
//                          Rating: "4.4",
//                          sale: "210 Sale",
//                        ),
//                        Padding(padding: EdgeInsets.only(right: 10.0)),
//                      ],
                          ),
                    ),
                  ],
                ),
              ),
            ):Container();
          } else {
            return Container();
          }
        });
  }
}

///// RadioButton for item choose in size
//class RadioButtonCustom extends StatefulWidget {
//  final String txt;
//
//  RadioButtonCustom({required this.txt});
//
//  @override
//  _RadioButtonCustomState createState() => _RadioButtonCustomState(this.txt);
//}
//
//class _RadioButtonCustomState extends State<RadioButtonCustom> {
//  _RadioButtonCustomState(this.txt);
//
//  String txt;
//  bool itemSelected = true;
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.only(top: 15.0),
//      child: InkWell(
//        onTap: () {
//          setState(() {
//            if (itemSelected == false) {
//              setState(() {
//                itemSelected = true;
//              });
//            } else if (itemSelected == true) {
//              setState(() {
//                itemSelected = false;
//              });
//            }
//          });
//        },
//        child: Container(
//          height: 37.0,
//          width: 37.0,
//          decoration: BoxDecoration(
//              color: Colors.white,
//              border: Border.all(
//                  color: itemSelected ? Colors.black54 : Colors.indigoAccent),
//              shape: BoxShape.circle),
//          child: Center(
//            child: Text(
//              txt,
//              style: TextStyle(
//                  color: itemSelected ? Colors.black54 : Colors.indigoAccent),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}

/// RadioButton for item choose in color
//class RadioButtonColor extends StatefulWidget {
//  final Color clr;
//
//  RadioButtonColor(this.clr);
//
//  @override
//  _RadioButtonColorState createState() => _RadioButtonColorState(this.clr);
//}
//
//class _RadioButtonColorState extends State<RadioButtonColor> {
//  bool itemSelected = true;
//  Color clr;
//
//  _RadioButtonColorState(this.clr);
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.only(top: 10.0),
//      child: InkWell(
//        onTap: () {
//          if (itemSelected == false) {
//            setState(() {
//              itemSelected = true;
//            });
//          } else if (itemSelected == true) {
//            setState(() {
//              itemSelected = false;
//            });
//          }
//        },
//        child: Container(
//          height: 37.0,
//          width: 37.0,
//          decoration: BoxDecoration(
//              color: clr,
//              border: Border.all(
//                  color: itemSelected ? Colors.black26 : Colors.indigoAccent,
//                  width: 2.0),
//              shape: BoxShape.circle),
//        ),
//      ),
//    );
//  }
//}

/// Class for card product in "Top Rated Products"
class FavoriteItem extends StatelessWidget {
  String image, Salary, title;
  int? Rating;
  int? sale;
  Product product;

  FavoriteItem(
      {required this.image,
      required this.Rating,
      required this.Salary,
      required this.title,
      required this.sale,
      required this.product});

  @override
  Widget build(BuildContext context) {
//    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
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
        child: Wrap(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new detailProduk(product),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7.0),
                            topRight: Radius.circular(7.0)),
                        // image:

                        // DecorationImage(
                        //     image:
                        //     // AssetImage(image),
                        //     CachedNetworkImageProvider(image),
                        //     alignment: Alignment.center,
                        //     fit: BoxFit.cover)
                      ),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                        width: 150.0,
                        child: Text(
                          title,
                          style: TextStyle(
                              letterSpacing: 0.5,
                              color: Colors.black54,
                              fontFamily: "Sans",
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0),
                        )),
                  ),
                  Padding(padding: EdgeInsets.only(top: 1.0)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      Salary,
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
                            Rating != null && Rating! > 0
                                ? Text(
                                    Rating.toString(),
                                    style: TextStyle(
                                        fontFamily: "Sans",
                                        color: Colors.black26,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.0),
                                  )
                                : Container(),
                            Rating != null && Rating! > 0
                                ? Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 14.0,
                                  )
                                : Container(),
                          ],
                        ),
                        sale != null && sale! > 0
                            ? Text(
                                sale.toString(),
                                style: TextStyle(
                                    fontFamily: "Sans",
                                    color: Colors.black26,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Widget _line() {
//  return Container(
//    height: 0.9,
//    width: double.infinity,
//    color: Colors.black12,
//  );
//}
