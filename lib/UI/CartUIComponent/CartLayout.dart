import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:amigatoy/UI/CartUIComponent/Delivery.dart';
import 'package:amigatoy/UI/CartUIComponent/AddressList.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/UI/widgets/customer_address_card.dart';

class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {

  @override
  void initState() {
    super.initState();
  }

  /// Declare price and value for chart
  int value = 1;
  int pay = 950;

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

  Widget _buildList(List<Cart?> items) {
    return items.length > 0
        ? Expanded(
            child: SizedBox(
                height: 300.0,
                child: new ListView.builder(
                    itemCount: items.length,
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
                            key: Key(items[position]!.id.toString()),
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () {
                              setState(() {
                                items.removeAt(position);
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
                            height: 265.0,
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
                                                color: Colors.white
                                                    .withOpacity(0.1),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black12
                                                          .withOpacity(0.1),
                                                      blurRadius: 0.5,
                                                      spreadRadius: 0.1)
                                                ]),
                                            child: new Image.network(
                                                '${items[position]!.image}',
                                                height: 130.0,
                                                width: 120.0,
                                                fit: BoxFit.cover, errorBuilder:
                                                    (BuildContext context,
                                                        Object exception,
                                                        StackTrace?
                                                            stackTrace) {
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
                                              '${items[position]!.name}',
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10.0)),
                                            Text('Total: \$' +
                                                items[position]!
                                                    .final_price
                                                    .toString()),
                                            _optionWidget(
                                                items[position]!.option_name,
                                                items[position]!.option_value),
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
                                                            color: Colors
                                                                .black12
                                                                .withOpacity(
                                                                    0.1))),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: <Widget>[
                                                        /// Decrease of value item
                                                        InkWell(
                                                          onTap: () {
                                                            if (items[position]!
                                                                    .quantity <
                                                                1) {
                                                              return;
                                                            }
                                                            setState(() {
                                                              items[position]!
                                                                      .quantity =
                                                                  items[position]!
                                                                          .quantity -
                                                                      1;
                                                              items[position]!
                                                                  .final_price = items[
                                                                          position]!
                                                                      .price *
                                                                  items[position]!
                                                                      .quantity;
                                                              BlocProvider.of<
                                                                          CartsBloc>(
                                                                      context)
                                                                  .add(updateCartquantityEvent(
                                                                      cartId:
                                                                          items[position]!
                                                                              .id,
                                                                      quantity:
                                                                          items[position]!
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
                                                                            .withOpacity(0.1)))),
                                                            child: Center(
                                                                child:
                                                                    Text("-")),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      18.0),
                                                          child: Text(
                                                              items[position]!
                                                                  .quantity
                                                                  .toString()),
                                                        ),

                                                        /// Increasing value of item
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              items[position]!
                                                                      .quantity =
                                                                  items[position]!
                                                                          .quantity +
                                                                      1;
                                                              items[position]!
                                                                  .final_price = items[
                                                                          position]!
                                                                      .price *
                                                                  items[position]!
                                                                      .quantity;

                                                              BlocProvider.of<
                                                                          CartsBloc>(
                                                                      context)
                                                                  .add(updateCartquantityEvent(
                                                                      cartId:
                                                                          items[position]!
                                                                              .id,
                                                                      quantity:
                                                                          items[position]!
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
                                                                            .withOpacity(0.1)))),
                                                            child: Center(
                                                                child:
                                                                    Text("+")),
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
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    2.0),
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
                                                                      cartId: items[
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
                    })))
        : Container();
  }


  ///add customer address btn widget
  Widget _addCustomeraddressbtn(List<Countries> counties) {
    return Container(
        child: OutlinedButton(
      onPressed: () {
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (_, __, ___) => new delivery()));
      },
      child: const Text('Add Shipping address'),
    ));
  }

  ///show customer address container
  Widget _customerAddress(
      List<CustomerAddress?> customerAddlist, List<Countries> countriesList) {
    List<Widget> custlistWidget = [];
    if (customerAddlist.length > 0) {

        custlistWidget.add(
            getCusterAdd(customerAddlist.first!,true)
//          Card(
//            child: ListTile(
//              title: Text('shipping to: '+customerAddlist.first!.firstName+customerAddlist.first!.lastName),
//              subtitle: Text(customerAddlist.first!.streetAddress+' '+customerAddlist.first!.city+' '+customerAddlist.first!.state+' '+customerAddlist.first!.telephone,overflow: TextOverflow.ellipsis),
//            ),
//          ),
        );


      return Column(
          children:[
            Container(
        height: 75,
          child:ListView(
        children: custlistWidget,
      )),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Container(
                child:OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => new AddressList()));
                  },
                  child: const Text('Use other address'),
                )
            ),


         ]);
    } else {
      return _addCustomeraddressbtn(countriesList);
    }
  }

  Widget _scaffoldWidget(List<Cart?> items, CartTotal? cartTotal) {
    /// Custom Text
    var _customStyle = TextStyle(
        fontFamily: "Gotik",
        fontWeight: FontWeight.w800,
        color: Colors.black,
        fontSize: 20.0);
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
          new Container(
            // height: 80.0,
            color: Colors.transparent,
            child: new Container(
//                    decoration: new BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: new BorderRadius.only(
//                          topLeft: const Radius.circular(40.0),
//                          topRight: const Radius.circular(40.0),
//                        )
//                    ),
              child: BlocBuilder<CustomerAddressBloc, CustomerAddressState>(
                  builder: (BuildContext context, customeraddState) {
                if (customeraddState is QueryCustomerAddressSuccess) {
                  return _customerAddress(customeraddState.customerAddressList,
                      customeraddState.countries);
                } else {
                  return Container();
                }
              }),
            ),
          ),
          _buildList(items),
          Padding(padding: EdgeInsets.only(top: 15.0)),
          Divider(
            height: 1.0,
            color: Colors.black26,
          ),
          cartTotal != null
              ? Column(

                  /// Add this
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Text(
                        "Cart Subtotal:" + cartTotal.totalPrice.toString(),
                        style: _customStyle,
                        textAlign: TextAlign.right,
                      )
                    ])
              : Container(),
        ]),

        ///
        ///
        /// Checking item value of cart
        ///
        ///
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
            ],
            child: BlocBuilder<CartsBloc, CartsState>(
                builder: (context, cartstate) {
              if (cartstate is CartlistsuccessState) {
                if ((cartstate.cartList.length > 0)) {
                  print(cartstate.cartList);
                  // BlocBuilder<CustomerAddressBloc, CustomerAddressState>(
                  //     builder: (context, customerAddstate) {
                  //   List<CustomerAddress?> customerList = [];
                  //
                  //   if (customerAddstate is QueryCustomerAddressSuccess) {
                  //     customerList = customerAddstate.customerAddressList;
                  //
                  //   }
                  return _scaffoldWidget(
                      cartstate.cartList, cartstate.cartTotal);
                  // });

                  // return Container();
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
