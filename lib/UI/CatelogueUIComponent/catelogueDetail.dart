import 'package:flutter/material.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/UI/widgets/item_grid.dart';
import 'package:cached_network_image/cached_network_image.dart';

class catelogueDetail extends StatefulWidget {
  @override


  /// Declare class
  final Categories categories;
  catelogueDetail(this.categories);
  _catelogueDetailState createState() => _catelogueDetailState(categories);
}

class _catelogueDetailState extends State<catelogueDetail> {
  /// set key for bottom sheet
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();


  /// Declare class
  final Categories categories;
  _catelogueDetailState(this.categories);
  // String notif = "Notifications";

  /// https://firebasestorage.googleapis.com/v0/b/beauty-look.appspot.com/o/Artboard%203.png?alt=media&token=dc7f4bf5-8f80-4f38-bb63-87aed9d59b95

  /// Custom text header for bottomSheet
  // final _fontCostumSheetBotomHeader = TextStyle(
  //     fontFamily: "Berlin",
  //     color: Colors.black54,
  //     fontWeight: FontWeight.w600,
  //     fontSize: 16.0);

  /// Custom text for bottomSheet
  // final _fontCostumSheetBotom = TextStyle(
  //     fontFamily: "Sans",
  //     color: Colors.black45,
  //     fontWeight: FontWeight.w400,
  //     fontSize: 16.0);

  /// Create Modal BottomSheet (SortBy)
  // void _modalBottomSheetSort() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder) {
  //         return SingleChildScrollView(
  //           child: new Container(
  //             height: 320.0,
  //             color: Colors.white,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //                 Padding(padding: EdgeInsets.only(top: 20.0)),
  //                 Text("SORT BY", style: _fontCostumSheetBotomHeader),
  //                 Padding(padding: EdgeInsets.only(top: 20.0)),
  //                 Container(
  //                   width: 500.0,
  //                   color: Colors.black26,
  //                   height: 0.5,
  //                 ),
  //                 Padding(padding: EdgeInsets.only(top: 25.0)),
  //                 InkWell(
  //                     onTap: () {
  //                       Navigator.of(context).push(MaterialPageRoute(
  //                           builder: (BuildContext context) => new Home()));
  //                     },
  //                     child: Text(
  //                       "Popularity",
  //                       style: _fontCostumSheetBotom,
  //                     )),
  //                 Padding(padding: EdgeInsets.only(top: 25.0)),
  //                 Text(
  //                   "New",
  //                   style: _fontCostumSheetBotom,
  //                 ),
  //                 Padding(padding: EdgeInsets.only(top: 25.0)),
  //                 Text(
  //                   "Discount",
  //                   style: _fontCostumSheetBotom,
  //                 ),
  //                 Padding(padding: EdgeInsets.only(top: 25.0)),
  //                 Text(
  //                   "Price: High-Low",
  //                   style: _fontCostumSheetBotom,
  //                 ),
  //                 Padding(padding: EdgeInsets.only(top: 25.0)),
  //                 Text(
  //                   "Price: Log-High",
  //                   style: _fontCostumSheetBotom,
  //                 ),
  //                 Padding(padding: EdgeInsets.only(top: 25.0)),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  /// Create Modal BottomSheet (RefineBy)
  // void _modalBottomSheetRefine() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder) {
  //         return SingleChildScrollView(
  //           child: new Container(
  //             height: 320.0,
  //             color: Colors.white,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //                 Padding(padding: EdgeInsets.only(top: 20.0)),
  //                 Text("REFINE BY", style: _fontCostumSheetBotomHeader),
  //                 Padding(padding: EdgeInsets.only(top: 20.0)),
  //                 Container(
  //                   width: 500.0,
  //                   color: Colors.black26,
  //                   height: 0.5,
  //                 ),
  //                 Padding(padding: EdgeInsets.only(top: 25.0)),
  //                 InkWell(
  //                     onTap: () {
  //                       Navigator.of(context).push(MaterialPageRoute(
  //                           builder: (BuildContext context) => new Home()));
  //                     },
  //                     child: Text(
  //                       "Popularity",
  //                       style: _fontCostumSheetBotom,
  //                     )),
  //                 Padding(padding: EdgeInsets.only(top: 25.0)),
  //                 Text(
  //                   "New",
  //                   style: _fontCostumSheetBotom,
  //                 ),
  //                 Padding(padding: EdgeInsets.only(top: 25.0)),
  //                 Text(
  //                   "Discount",
  //                   style: _fontCostumSheetBotom,
  //                 ),
  //                 Padding(padding: EdgeInsets.only(top: 25.0)),
  //                 Text(
  //                   "Price: High-Low",
  //                   style: _fontCostumSheetBotom,
  //                 ),
  //                 Padding(padding: EdgeInsets.only(top: 25.0)),
  //                 Text(
  //                   "Price: Log-High",
  //                   style: _fontCostumSheetBotom,
  //                 ),
  //                 Padding(padding: EdgeInsets.only(top: 25.0)),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    // MediaQueryData mediaQueryData = MediaQuery.of(context);
    List<Product> _productlist = [];

    /// Hero animation for image
    final hero = Hero(
      tag: 'hero-tag-${categories.categoriesId}',
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            image:
            CachedNetworkImageProvider(categories.categoriesImageUrl)
            // new NetworkImage(categories.categoriesImageUrl),
          ),
          shape: BoxShape.rectangle,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 130.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[
                  new Color(0x00FFFFFF),
                  new Color(0xFFFFFFFF),
                ],
                stops: [
                  0.0,
                  1.0
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.0, 1.0)),
          ),
        ),
      ),
    );
    int _startPage = 0;
    int _pageLength = 500;
    // Widget _pagescaffold=

    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductsBloc>(create: (context) {
            return ProductsBloc(productRepository: ProductRepository())
              ..add(FetchProductcatEvent(
                  cateId: categories.categoriesId,
                  length: _pageLength,
                  start: _startPage));
          }),
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<ProductsBloc, ProductsState>(
                  listener: (context, state) {
                if (state is ProductlistloadedState) {
                  // if(state.orderlst.length>0){

                }
              }),
            ],
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductlistloadedState) {
                  // setState(() {
                  _productlist.addAll(state.lproduct);
                  // print(_productlist);
                  // });
                  return Scaffold(
                    key: _key,
                    body: CustomScrollView(
                      scrollDirection: Axis.vertical,
                      slivers: <Widget>[
                        /// Appbar Custom using a SliverAppBar
                        SliverAppBar(
                          centerTitle: true,
                          backgroundColor: Colors.white,
                          iconTheme: IconThemeData(color: Colors.black),
                          expandedHeight: 280.0,
                          elevation: 0.1,
                          pinned: true,
                          flexibleSpace: FlexibleSpaceBar(
                              centerTitle: true,
                              title: Text(
                                categories.categoriesName,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 17.0,
                                    fontFamily: "Popins",
                                    fontWeight: FontWeight.w700),
                              ),
                              background: Material(
                                child: hero,
                              )),
                          //         bottom:   PreferredSize(
                          //   preferredSize: const Size.fromHeight(0.0),
                          //   child: Transform.translate(
                          //     offset: const Offset(0, 25),
                          //     child: ElevatedButton(
                          //       // shape: StadiumBorder(),
                          //       child: Text("Click Here"),
                          //       onPressed: () {},
                          //     ),
                          //   ),
                          // ),
                        ),

                        /// Container for description to Sort and Refine
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        bottom: 0.0),
                                    child: Container(
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.0)),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                left: 20.0,
                                                right: 20.0),
                                            child: Text(
                                              categories.categoriesDesc,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: "Popins",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15.0,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 10.0)),
                                          // buttonCustom(
                                          //   color: Colors.blue,
                                          //   txt: "Message",
                                          //   ontap: () {
                                          //     // Navigator.of(context).push(PageRouteBuilder(
                                          //     //     pageBuilder: (_, __, ___) =>
                                          //     //         new privatemessage(brand)));
                                          //   },
                                          // ),
                                          // Padding(padding: EdgeInsets.only(top: 10.0)),
                                          // buttonCustom(
                                          //   color: Colors.indigoAccent,
                                          //   txt: notif,
                                          //   ontap: () {
                                          //     var snackBar = SnackBar(
                                          //       content: Text(categories.categoriesName + " Notificated"),
                                          //       action: SnackBarAction(
                                          //           label: "Undo",
                                          //           onPressed: () {
                                          //             setState(() {
                                          //               if (notif == "Notifications") {
                                          //                 notif = "Notificated";
                                          //               } else {
                                          //                 (notif = "Notifications");
                                          //               }});
                                          //           }),
                                          //     );
                                          //     setState(() {
                                          //       if (notif == "Notifications") {
                                          //         notif = "Notificated";
                                          //       } else {
                                          //         (notif = "Notifications");
                                          //       }});
                                          //     _key.currentState?.showSnackBar(snackBar);
                                          //   },
                                          // )
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Padding(padding: EdgeInsets.only(top: 15.0)),
                                  // Container(
                                  //   height: 50.9,
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     boxShadow: [
                                  //       BoxShadow(
                                  //           color: Colors.black12.withOpacity(0.1),
                                  //           blurRadius: 1.0,
                                  //           spreadRadius: 1.0),
                                  //     ],
                                  //   ),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //     children: <Widget>[
                                  //       InkWell(
                                  //         onTap: _modalBottomSheetSort,
                                  //         child: Row(
                                  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //           children: <Widget>[
                                  //             Icon(Icons.arrow_drop_down),
                                  //             Padding(padding: EdgeInsets.only(right: 10.0)),
                                  //             Text(
                                  //               "Sort",
                                  //               style: _fontCostumSheetBotomHeader,
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       Row(
                                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //         children: <Widget>[
                                  //           Container(
                                  //             height: 45.9,
                                  //             width: 1.0,
                                  //             decoration:
                                  //             BoxDecoration(color: Colors.black12),
                                  //           )
                                  //         ],
                                  //       ),
                                  //       InkWell(
                                  //         onTap: _modalBottomSheetRefine,
                                  //         child: Row(
                                  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //           children: <Widget>[
                                  //             Icon(Icons.arrow_drop_down),
                                  //             Padding(padding: EdgeInsets.only(right: 0.0)),
                                  //             Text(
                                  //               "Refine",
                                  //               style: _fontCostumSheetBotomHeader,
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        if (state is ProductlistloadedState)
                          // Container(
                          //   height: (_productlist.length/2).ceil()*300,
                          //   child: RefreshIndicator(
                          //     onRefresh:() async {
                          //       _startPage=_startPage+_pageLength;
                          //       BlocProvider.of<ProductsBloc>(context)
                          //           .add(FetchMoreProductcatEvent(cateId:categories.categoriesId,start:_startPage,length: _pageLength));
                          //     },
                          //     child: GridView.builder(
                          //       itemCount: _productlist.length,
                          //       physics: ScrollPhysics(),
                          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //           crossAxisCount: 2,
                          //           crossAxisSpacing: 4.0,
                          //           mainAxisSpacing: 4.0,
                          //           mainAxisExtent: 285
                          //       ),
                          //       itemBuilder: (BuildContext context, int index){
                          //         if(_productlist[index]!=null){
                          //           return ItemGrid(_productlist[index]!);
                          //         }else{
                          //           return Container();
                          //         }
                          //       },
                          //     ),
                          //   ),
                          // ),
                          // RefreshIndicator(
                          //   onRefresh:() async {
                          //     _startPage=_startPage+_pageLength;
                          //     // BlocProvider.of<ProductsBloc>(context)
                          //     //     .add(FetchMoreProductcatEvent(cateId:categories.categoriesId,start:_startPage,length: _pageLength));
                          //   },
                          //   child:
                          SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 3,
                              crossAxisSpacing: 10,
                              childAspectRatio: 2.0,
                              mainAxisExtent: 268,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return ItemGrid(_productlist[index]);
                              },
                              childCount: _productlist.length,
                            ),
                          ),
                        // ),
                        // SliverToBoxAdapter(
                        //   child: (state is ProductlistloadedState)?ElevatedButton(
                        //     onPressed: () {},
                        //     child: const Text('Enabled'),
                        //   ):Container(),
                        // ),

                        /// Create Grid Item
                        // _productlist.length>0?SliverGrid(
                        //         delegate: SliverChildBuilderDelegate(
                        //           (BuildContext context, int index) {
                        //             return Container(
                        //               decoration: BoxDecoration(
                        //                   color: Colors.white,
                        //                   borderRadius:
                        //                       BorderRadius.all(Radius.circular(10.0)),
                        //                   boxShadow: [
                        //                     BoxShadow(
                        //                       color:
                        //                           Color(0xFF656565).withOpacity(0.15),
                        //                       blurRadius: 4.0,
                        //                       spreadRadius: 1.0,
                        //                     )
                        //                   ]),
                        //               child: Wrap(
                        //                 children: <Widget>[
                        //                   Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.spaceAround,
                        //                     mainAxisSize: MainAxisSize.min,
                        //                     children: <Widget>[
                        //                       Container(
                        //                         height:
                        //                             mediaQueryData.size.height / 3.5,
                        //                         width: 200.0,
                        //                         decoration: BoxDecoration(
                        //                             borderRadius: BorderRadius.only(
                        //                                 topLeft: Radius.circular(7.0),
                        //                                 topRight:
                        //                                     Radius.circular(7.0)),
                        //                             image: DecorationImage(
                        //                                 image: NetworkImage(
                        //                                     _productlist[index]
                        //                                         .products_image),
                        //                                 fit: BoxFit.cover)),
                        //                       ),
                        //                       Padding(
                        //                           padding: EdgeInsets.only(top: 7.0)),
                        //                       Padding(
                        //                         padding: const EdgeInsets.only(
                        //                             left: 15.0, right: 15.0),
                        //                         child: Text(
                        //                           _productlist[index].products_name,
                        //                           style: TextStyle(
                        //                               letterSpacing: 0.5,
                        //                               color: Colors.black54,
                        //                               fontFamily: "Sans",
                        //                               fontWeight: FontWeight.w500,
                        //                               fontSize: 13.0),
                        //                           overflow: TextOverflow.ellipsis,
                        //                         ),
                        //                       ),
                        //                       Padding(
                        //                           padding: EdgeInsets.only(top: 1.0)),
                        //                       Padding(
                        //                         padding: const EdgeInsets.only(
                        //                             left: 15.0, right: 15.0),
                        //                         child: Text(
                        //                           _productlist[index]
                        //                               .products_price
                        //                               .toString(),
                        //                           style: TextStyle(
                        //                               fontFamily: "Sans",
                        //                               fontWeight: FontWeight.w500,
                        //                               fontSize: 14.0),
                        //                         ),
                        //                       ),
                        //                       Padding(
                        //                         padding: const EdgeInsets.only(
                        //                             left: 15.0,
                        //                             right: 15.0,
                        //                             top: 5.0),
                        //                         child: Row(
                        //                           crossAxisAlignment:
                        //                               CrossAxisAlignment.start,
                        //                           mainAxisAlignment:
                        //                               MainAxisAlignment.spaceBetween,
                        //                           children: <Widget>[
                        //                             Row(
                        //                               children: <Widget>[
                        //                                 Text(
                        //                                   _productlist[index]
                        //                                       .product_wish
                        //                                       .toString(),
                        //                                   style: TextStyle(
                        //                                       fontFamily: "Sans",
                        //                                       color: Colors.black26,
                        //                                       fontWeight:
                        //                                           FontWeight.w500,
                        //                                       fontSize: 12.0),
                        //                                 ),
                        //                                 Icon(
                        //                                   Icons.star,
                        //                                   color: Colors.yellow,
                        //                                   size: 14.0,
                        //                                 )
                        //                               ],
                        //                             ),
                        //                             Text(
                        //                               _productlist[index]
                        //                                   .product_sales
                        //                                   .toString(),
                        //                               style: TextStyle(
                        //                                   fontFamily: "Sans",
                        //                                   color: Colors.black26,
                        //                                   fontWeight: FontWeight.w500,
                        //                                   fontSize: 12.0),
                        //                             )
                        //                           ],
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ],
                        //               ),
                        //             );
                        //           },
                        //           childCount: _productlist.length,
                        //         ),
                        //
                        //         /// Setting Size for Grid Item
                        //         gridDelegate:
                        //             SliverGridDelegateWithMaxCrossAxisExtent(
                        //           maxCrossAxisExtent: 250.0,
                        //           mainAxisSpacing: 7.0,
                        //           crossAxisSpacing: 7.0,
                        //           childAspectRatio: 0.605,
                        //         ),
                        //       ):Container(),
                      ],
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )));
  }
}

/// Class For Botton Custom
class buttonCustom extends StatelessWidget {
  String txt;
  Color color;
  GestureTapCallback ontap;

  buttonCustom({required this.txt, required this.color, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 45.0,
        width: 300.0,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Center(
            child: Text(
          txt,
          style: TextStyle(color: Colors.white, fontFamily: "Sans"),
        )),
      ),
    );
  }
}
