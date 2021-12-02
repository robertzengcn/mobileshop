import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:amigatoy/UI/CartUIComponent/Delivery.dart';
// import 'package:amigatoy/UI/CartUIComponent/AddressList.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';
// import 'package:amigatoy/UI/widgets/customer_address_card.dart';
import 'package:amigatoy/UI/CartUIComponent/Checkout.dart';
import 'package:amigatoy/Arguments/CheckoutArguments.dart';
class Cartpage extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<Cartpage> {
  @override
  void initState() {
    super.initState();
  }

  /// Declare price and value for chart
  // int value = 1;
  // int pay = 950;
  String? _selectShipping = 'dhlzones';
  List<ShippingMethod?> _shippingMelist = [];
  // List<Countries> _countriesList = [];
  // List<CustomerAddress?> _customerAddlist = [];
  double _shippingCost = 0;
  CartTotal? _cartTotal;
  List<Cart?> _cartList = [];
  List<Payment?> _paymentList = [];
  // String? _selectPaymentcode;
  String _symbol = '\$';
  String? _orderComment;
  String _orderCurrency = 'USD';

  Widget _optionWidget(String? optionname, String? optionvalue) {
    if (optionname != null &&
        optionvalue != null &&
        optionname.length > 0 &&
        optionvalue.length > 0) {
      return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(optionname + ': ' + optionvalue));
    } else {
      return Container();
    }
  }

  Widget _buildList() {
    return _cartList.length > 0
        ? Expanded(
            child: SizedBox(
                child: Scrollbar(
            isAlwaysShown: true,
            child: new ListView.builder(
                itemCount: _cartList.length,
                itemBuilder: (context, position) {
                  ///
                  /// Widget for list view slide delete
                  ///
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
//                delegate: new SlidableDrawerDelegate(),
                    actionExtentRatio: 0.25,
//                    actions: <Widget>[
//                      new IconSlideAction(
//                        caption: 'Archive',
//                        color: Colors.blue,
//                        icon: Icons.archive,
//                        onTap: () {
//                          ///
//                          /// SnackBar show if cart Archive
//                          ///
//                        },
//                      ),
////                        ld.of(context)
////                            .showSnackBar(SnackBar(
////                          content: Text("Items Cart Archive"),
////                          duration: Duration(seconds: 2),
////                          backgroundColor: Colors.blue,));
////                      },
////                    ),
//                    ],
                    secondaryActions: <Widget>[
                      new IconSlideAction(
                        key: Key(_cartList[position]!.id.toString()),
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () {
                          setState(() {
                            BlocProvider.of<CartsBloc>(context).add(
                                deleteCartEvent(
                                    cartId: _cartList[position]!.id));
                            _cartList.removeAt(position);
                          });

                          ///
                          /// SnackBar show if cart delet
                          ///
                        },
                      ),
                    ],
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 1.0, left: 13.0, right: 13.0),

                      /// Background Constructor for card
                      child: Container(
                        height: 225.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.1),
                              blurRadius: 3.5,
                              spreadRadius: 0.4,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.all(10.0),

                                    /// Image item
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.1),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12
                                                      .withOpacity(0.1),
                                                  blurRadius: 0.5,
                                                  spreadRadius: 0.1)
                                            ]),
                                        child: new Image.network(
                                            '${_cartList[position]!.image}',
                                            height: 130.0,
                                            width: 120.0,
                                            fit: BoxFit.cover, errorBuilder:
                                                (BuildContext context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                          return Image.asset(
                                            "assets/img/error.png",
                                            height: 130.0,
                                            width: 120.0,
                                          );
                                        }))),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0, left: 10.0, right: 5.0),
                                    child: Column(
                                      /// Text Information Item
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
//                                        Text(
//                                          '${items[position].name}',
//                                          style: TextStyle(
//                                            fontWeight: FontWeight.w700,
//                                            fontFamily: "Sans",
//                                            color: Colors.black87,
//                                          ),
//                                          overflow: TextOverflow.ellipsis,
//                                        ),
//                                        Padding(
//                                            padding:
//                                                EdgeInsets.only(top: 10.0)),
                                        Text(
                                          '${_cartList[position]!.name}',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(top: 10.0)),
                                        Text('Total: ' +
                                            _symbol +
                                            _cartList[position]!
                                                .final_price
                                                .toString()),
                                        _optionWidget(
                                            _cartList[position]!.option_name,
                                            _cartList[position]!.option_value),
//                                        Padding(
//                                            padding:
//                                            EdgeInsets.only(top: 10.0)),
//                                        Text('${items[position].option_name}:${items[position].option_value}'),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 18.0, left: 0.0),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                width: 118.0,
                                                decoration: BoxDecoration(
                                                    color: Colors.white70,
                                                    border: Border.all(
                                                        color: Colors.black12
                                                            .withOpacity(0.1))),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    /// Decrease of value item
                                                    InkWell(
                                                      onTap: () {
                                                        if (_cartList[position]!
                                                                .quantity <
                                                            1) {
                                                          return;
                                                        }
                                                        setState(() {
                                                          _cartList[position]!
                                                                  .quantity =
                                                              _cartList[position]!
                                                                      .quantity -
                                                                  1;
                                                          _cartList[position]!
                                                                  .final_price =
                                                              _cartList[position]!
                                                                      .price *
                                                                  _cartList[
                                                                          position]!
                                                                      .quantity;
                                                          BlocProvider.of<
                                                                      CartsBloc>(
                                                                  context)
                                                              .add(updateCartquantityEvent(
                                                                  cartId: _cartList[
                                                                          position]!
                                                                      .id,
                                                                  quantity: _cartList[
                                                                          position]!
                                                                      .quantity));
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 30.0,
                                                        width: 30.0,
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                                right: BorderSide(
                                                                    color: Colors
                                                                        .black12
                                                                        .withOpacity(
                                                                            0.1)))),
                                                        child: Center(
                                                            child: Text("-")),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 18.0),
                                                      child: Text(
                                                          _cartList[position]!
                                                              .quantity
                                                              .toString()),
                                                    ),

                                                    /// Increasing value of item
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _cartList[position]!
                                                                  .quantity =
                                                              _cartList[position]!
                                                                      .quantity +
                                                                  1;
                                                          _cartList[position]!
                                                                  .final_price =
                                                              _cartList[position]!
                                                                      .price *
                                                                  _cartList[
                                                                          position]!
                                                                      .quantity;

                                                          BlocProvider.of<
                                                                      CartsBloc>(
                                                                  context)
                                                              .add(updateCartquantityEvent(
                                                                  cartId: _cartList[
                                                                          position]!
                                                                      .id,
                                                                  quantity: _cartList[
                                                                          position]!
                                                                      .quantity));
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 30.0,
                                                        width: 28.0,
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                                left: BorderSide(
                                                                    color: Colors
                                                                        .black12
                                                                        .withOpacity(
                                                                            0.1)))),
                                                        child: Center(
                                                            child: Text("+")),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {});
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 2.0),
                                                    child: IconButton(
                                                      icon: const Icon(
                                                          Icons.delete),
                                                      tooltip:
                                                          'Delete the item',
                                                      onPressed: () {
                                                        setState(() {
                                                          BlocProvider.of<
                                                                      CartsBloc>(
                                                                  context)
                                                              .add(deleteCartEvent(
                                                                  cartId: _cartList[
                                                                          position]!
                                                                      .id));
                                                        });
                                                      },
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 8.0)),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )))
        : Container();
  }

  ///add customer address btn widget
  // Widget _addCustomeraddressbtn() {
  //   return Container(
  //       child: OutlinedButton(
  //     onPressed: () {
  //       Navigator.of(context).push(
  //           PageRouteBuilder(pageBuilder: (_, __, ___) => new Delivery()));
  //     },
  //     child: const Text('Add Shipping address'),
  //   ));
  // }

  ///show customer address container
  // Widget _customerAddress() {
  //   List<Widget> custlistWidget = [];
  //   // List<Widget> shippingWidget = [];
  //   if (_customerAddlist.length > 0) {
  //     custlistWidget
  //         .add(getCusterAdd(_customerAddlist.first!, false, context, false));
  //
  //     return Column(children: [
  //       Container(
  //           height: 65,
  //           child: ListView(
  //             physics: const ScrollPhysics(),
  //             children: custlistWidget,
  //           )),
  //       // Column(
  //       //   children: shippingWidget,
  //       // ),
  //       Padding(padding: EdgeInsets.only(top: 10.0)),
  //       Container(
  //           child: OutlinedButton(
  //         onPressed: () {
  //           Navigator.of(context).push(PageRouteBuilder(
  //               pageBuilder: (_, __, ___) => new AddressList()));
  //         },
  //         child: const Text('Use other address'),
  //       )),
  //     ]);
  //   } else {
  //     return _addCustomeraddressbtn();
  //   }
  // }

  // Widget _shiplistWidget(){
  //   List<Widget> shippingWidget = [];
  //   if (_shippingMelist.isNotEmpty) {
  //     _shippingMelist.forEach(
  //             (element) => shippingWidget.add(_shippingWidget(element!)));
  //   }
  //   return Column(
  //       children:shippingWidget
  //   );
  // }


  /// BottomSheet for show make payment
//   void _bottomSheet(BuildContext context) {
//     // final ordersbloc = BlocProvider.of<OrdersBloc>(context);
//     showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         builder: (BuildContext _) {
//           return FractionallySizedBox(
//             heightFactor: 0.85,
//             child: StatefulBuilder(
//                 builder: (BuildContext context, StateSetter setshipState) {
//               Widget _totalWidget() {
//                 /// Custom Text
//                 var _customStyle = TextStyle(
//                     // fontFamily: "Gotik",
//                     // fontWeight: FontWeight.w800,
//                     color: Colors.black,
//                     fontSize: 20.0);
//                 if (_cartTotal != null) {
//                   return Container(
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Column(
//                         /// Add this
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             "Cart Subtotal: " +
//                                 _symbol +
//                                 _cartTotal!.totalPrice.toString(),
//                             style: _customStyle,
//                             textAlign: TextAlign.right,
//                           ),
//                           _shippingMelist.isNotEmpty
//                               ? Text(
//                                   "Shiping Cost: " +
//                                       _symbol +
//                                       _shippingCost.toString(),
//                                   style: _customStyle,
//                                   textAlign: TextAlign.right,
//                                 )
//                               : Container(),
//                           Text(
//                             "Total: " +
//                                 _symbol +
//                                 (_cartTotal!.totalPrice + _shippingCost)
//                                     .toString(),
//                             style: _customStyle,
//                             textAlign: TextAlign.right,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Container();
//                 }
//               }
//
//               Widget _shippingWidget(ShippingMethod shippingMe) {
//                 return RadioListTile<String>(
//                   dense: true,
//                   title:
//                       Text(shippingMe.title + ' ' + shippingMe.cost.toString()),
//                   value: shippingMe.id,
//                   groupValue: _selectShipping,
//                   onChanged: (String? value) {
//                     setshipState(() => _selectShipping = value);
//                   },
//                 );
//               }
//
//               List<Widget> shippingWidget = [];
//               if (_shippingMelist.isNotEmpty) {
//                 _shippingMelist.forEach(
//                     (element) => shippingWidget.add(_shippingWidget(element!)));
//               }
//               Widget _paymentlistWidget() {
//                 if (_paymentList.isNotEmpty) {
//                   List<Widget> paymentList = [];
//                   _paymentList.forEach(
//                       (element) => paymentList.add(RadioListTile<String>(
//                             dense: true,
//                             title: Text(element?.name ?? ""),
//                             value: element?.code ?? "",
//                             groupValue: _selectPaymentcode,
//                             onChanged: (String? value) {
//                               setshipState(() => _selectPaymentcode = value);
//                             },
//                           )));
//                   return Column(
//                     children: paymentList,
//                   );
//                 } else {
//                   return Container();
//                 }
//               }
//
//               return  SingleChildScrollView(
//                         child: Container(
//                           color: Colors.black26,
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 2.0),
//                             child: Container(
//                               // height: 1600.0,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(20.0),
//                                       topRight: Radius.circular(20.0))),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Padding(padding: EdgeInsets.only(top: 10.0)),
//                                   ListTile(title: Text('Shipping Method')),
//                                   Padding(
//                                       padding: const EdgeInsets.only(
//                                           top: 5.0,
//                                           left: 10.0,
//                                           right: 10.0,
//                                           bottom: 5.0),
//                                       child: Column(
//                                         children: shippingWidget,
//                                       )),
//                                   // Padding(padding: EdgeInsets.only(top: 20.0)),
//                                   ListTile(title: Text('Payment Method')),
//                                   Padding(
//                                       padding: const EdgeInsets.only(
//                                           top: 1.0,
//                                           left: 10.0,
//                                           right: 10.0,
//                                           bottom: 5.0),
//                                       child: Column(
//                                         children: [
//                                           _paymentlistWidget(),
//                                         ],
//                                       )),
//                                   // Padding(padding: EdgeInsets.only(top: 10.0)),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 10.0,
//                                         left: 10.0,
//                                         right: 10.0,
//                                         bottom: 5.0),
//                                     child: TextField(
//                                         maxLength: 1000,
//                                         keyboardType: TextInputType.multiline,
//                                         maxLines: null,
//                                         decoration: InputDecoration(
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Order comment',
//                                         ),
//                                         onSubmitted: (String? value) {
//                                           setshipState(
//                                               () => _orderComment = value);
//                                         }),
//                                   ),
//                                   Padding(padding: EdgeInsets.only(top: 10.0)),
//                                   _totalWidget(),
//                                   Padding(padding: EdgeInsets.only(top: 10.0)),
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Container(
//                                       child: OutlinedButton(
//                                         onPressed: () {
//                                           // print('Received click');
//                                           if (_selectPaymentcode != null &&
//                                               _selectShipping != null) {
//
//                                             _createOrder(_selectPaymentcode!,_selectShipping!,_orderComment,_orderCurrency);
//                                           }
//                                         },
//                                         child: const Text(
//                                           'Make payment',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.white),
//                                         ),
//                                         style: OutlinedButton.styleFrom(
// //                      primary: Colors.deepOrange.withOpacity(0.9),
//                                           backgroundColor: Colors.deepOrange
//                                               .withOpacity(0.95),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//             }),
//           );
//           // );
//           // );
//         });
//   }

  Widget _scaffoldWidget() {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF6991C7)),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Shopping Cart",
          style: TextStyle(
              fontFamily: "Gotik",
              fontSize: 18.0,
              color: Colors.black54,
              fontWeight: FontWeight.w700),
        ),
        elevation: 0.0,
      ),
      body: Column(children: <Widget>[
        _buildList(),
        // Container(
        //   // height: 80.0,
        //   color: Colors.transparent,
        //   child: new Container(
        //     child: BlocBuilder<CustomerAddressBloc, CustomerAddressState>(
        //         builder: (BuildContext context, customeraddState) {
        //       if (customeraddState is QueryCustomerAddressSuccess) {
        //         _countriesList = customeraddState.countries;
        //         _customerAddlist = customeraddState.customerAddressList;
        //
        //         return _customerAddress();
        //       } else {
        //         return Container();
        //       }
        //     }),
        //   ),
        // ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Divider(
          height: 1.0,
          color: Colors.black26,
        ),
        _cartTotal != null
            ? Column(children: <Widget>[
                // BlocBuilder<OrdersBloc, OrdersState>(
                //   builder: (context, ordersState) {
                Container(
                  child: OutlinedButton(
                    onPressed: () {
                      // print('Received click');
                      // _bottomSheet(context);
                              Navigator.pushNamed(context, Checkout.routeName,
                                  arguments: CheckoutArguments(_cartTotal,_paymentList,_symbol,_shippingMelist)
                              );
                    },
                    child: const Text(
                      'Submit Order',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
//                      primary: Colors.deepOrange.withOpacity(0.9),
                      backgroundColor: Colors.deepOrange.withOpacity(0.95),
                    ),
                  ),
                )
                // },
              ])
            : Container(),
        // ])
        // : Container(),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CartsBloc>(create: (context) {
            //加载产品的评论
            return CartsBloc(cartRepository: CartRepository())
              ..add(queryCartcontentEvent());
          }),
          BlocProvider<CustomerAddressBloc>(create: (context) {
            //加载产品的评论
            return CustomerAddressBloc(
                customerAddressRepository: CustomerAddressRepository())
              ..add(QueryCustomerAddressEvent());
          }),
          BlocProvider<OrdersBloc>(create: (context) {
            return OrdersBloc(orderRepository: OrderRepository());
          }),
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<CartsBloc, CartsState>(listener: (context, state) {
                if (state is CartsErrorState) {
                  var snackbar = SnackBar(
                    content: Text("query cart failure"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              }),
              BlocListener<OrdersBloc, OrdersState>(listener: (context, state) {
                if (state is OrderErrorState) {
                  var snackbar = SnackBar(
                    content: Text("create order failure"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }else if(state is OrderCreatesuccessState){
                  // print(757);
                  var snackbar = SnackBar(
                    content: Text("create order success"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              }),
            ],
            child: BlocBuilder<CartsBloc, CartsState>(
                builder: (context, cartstate) {
              if (cartstate is CartlistsuccessState) {
                if ((cartstate.cartList.length > 0)) {
                  _shippingMelist = cartstate.shippingMelist;
                  // _shippingMelist.forEach((element) {
                  //   if (element != null && element.id == _selectShipping) {
                  //     _shippingCost = element.cost;
                  //   }
                  // });
                  _cartList = cartstate.cartList;
                  _cartTotal = cartstate.cartTotal;
                  _paymentList = cartstate.paymentList;
                  // if (cartstate.paymentList.length > 0) {
                  //   _selectPaymentcode = cartstate.paymentList.first!.code;
                  // }
                  _symbol = cartstate.symbol;
                  return _scaffoldWidget();
                } else {
                  return noItemCart();
                }
              } else if (cartstate is CartRefreshingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container();
              }
            })));
  }
}

///
///
/// If no item cart this class showing
///
class noItemCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: 500.0,
      color: Colors.white,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(top: mediaQueryData.padding.top + 50.0)),
            Image.asset(
              "assets/imgIllustration/IlustrasiCart.png",
              height: 300.0,
            ),
            Padding(padding: EdgeInsets.only(bottom: 10.0)),
            Text(
              "Not Have Item",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.5,
                  color: Colors.black26.withOpacity(0.2),
                  fontFamily: "Popins"),
            ),
          ],
        ),
      ),
    );
  }
}
