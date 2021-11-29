import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/UI/widgets/customer_address_card.dart';
import 'package:amigatoy/UI/CartUIComponent/AddressList.dart';
import 'package:amigatoy/UI/CartUIComponent/Delivery.dart';
import 'package:amigatoy/Arguments/CheckoutArguments.dart';
class Checkout extends StatefulWidget {
  static const routeName = '/checkout';

  @override
  _checkoutState createState() => _checkoutState();
}
class _checkoutState extends State<Checkout> {
  @override
  void initState() {
    super.initState();
  }
  String? _selectShipping = 'dhlzones';
  List<ShippingMethod?> _shippingMelist = [];
  List<Countries> _countriesList = [];
  List<CustomerAddress?> _customerAddlist = [];
  double _shippingCost = 0;
  CartTotal? _cartTotal;
  List<Payment?> _paymentList = [];
  String? _selectPaymentcode;
  String _symbol = '\$';
  String? _orderComment;
  String _orderCurrency = 'USD';

  ///add customer address btn widget
  Widget _addCustomeraddressbtn() {
    return Container(
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
                PageRouteBuilder(pageBuilder: (_, __, ___) => new Delivery()));
          },
          child: const Text('Add Shipping address'),
        ));
  }

  ///show customer address container
  Widget _customerAddress() {
    List<Widget> custlistWidget = [];
    // List<Widget> shippingWidget = [];
    if (_customerAddlist.length > 0) {
      custlistWidget
          .add(getCusterAdd(_customerAddlist.first!, false, context, false));

      return Column(children: [
        Container(
            height: 65,
            child: ListView(
              physics: const ScrollPhysics(),
              children: custlistWidget,
            )),
        Padding(padding: EdgeInsets.only(top: 10.0)),
        Container(
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new AddressList()));
              },
              child: const Text('Use other address'),
            )),
      ]);
    } else {
      return _addCustomeraddressbtn();
    }
  }
  Widget _shippingWidget(ShippingMethod shippingMe) {
    return RadioListTile<String>(
      dense: true,
      title:
      Text(shippingMe.title + ' ' + shippingMe.cost.toString()),
      value: shippingMe.id,
      groupValue: _selectShipping,
      onChanged: (String? value) {
         setState(() => _selectShipping = value);
      },
    );
  }
  ///get payment list widget
  Widget _paymentlistWidget() {
    if (_paymentList.isNotEmpty) {
      List<Widget> paymentList = [];
      _paymentList.forEach(
              (element) => paymentList.add(RadioListTile<String>(
            dense: true,
            title: Text(element?.name ?? ""),
            value: element?.code ?? "",
            groupValue: _selectPaymentcode,
            onChanged: (String? value) {
              setState(() => _selectPaymentcode = value);
            },
          )));
      return Column(
        children: paymentList,
      );
    } else {
      return Container();
    }
  }
  ///show total widget
  Widget _totalWidget() {
    /// Custom Text
    var _customStyle = TextStyle(
      // fontFamily: "Gotik",
      // fontWeight: FontWeight.w800,
        color: Colors.black,
        fontSize: 20.0);
    if (_cartTotal != null) {
      return Container(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            /// Add this
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Cart Subtotal: " +
                    _symbol +
                    _cartTotal!.totalPrice.toString(),
                style: _customStyle,
                textAlign: TextAlign.right,
              ),
              _shippingMelist.isNotEmpty
                  ? Text(
                "Shiping Cost: " +
                    _symbol +
                    _shippingCost.toString(),
                style: _customStyle,
                textAlign: TextAlign.right,
              )
                  : Container(),
              Text(
                "Total: " +
                    _symbol +
                    (_cartTotal!.totalPrice + _shippingCost)
                        .toString(),
                style: _customStyle,
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
/// get scaffold for checkout page
  Widget _scaffoldWidget() {
    List<Widget> shippingWidget = [];
    if (_shippingMelist.isNotEmpty) {
      _shippingMelist.forEach(
              (element) => shippingWidget.add(_shippingWidget(element!)));
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF6991C7)),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Check out",
          style: TextStyle(
              fontFamily: "Gotik",
              fontSize: 18.0,
              color: Colors.black54,
              fontWeight: FontWeight.w700),
        ),
        elevation: 0.0,
      ),
      body: Column(children: <Widget>[
        Container(
          // height: 80.0,
          color: Colors.transparent,
          child:BlocBuilder<CustomerAddressBloc, CustomerAddressState>(
              builder: (BuildContext context, customeraddState) {
                if (customeraddState is QueryCustomerAddressSuccess) {
                  _countriesList = customeraddState.countries;
                  _customerAddlist = customeraddState.customerAddressList;

                  return _customerAddress();
                } else {
                  return Container();
                }
              }),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
        Divider(
          height: 1.0,
          color: Colors.black26,
        ),
        Padding(padding: EdgeInsets.only(top: 10.0)),
        ListTile(title: Text('Shipping Method')),
        Padding(
            padding: const EdgeInsets.only(
                top: 5.0,
                left: 10.0,
                right: 10.0,
                bottom: 5.0),
            child: Column(
              children: shippingWidget,
            )),
        ListTile(title: Text('Payment Method')),
        Padding(
            padding: const EdgeInsets.only(
                top: 1.0,
                left: 10.0,
                right: 10.0,
                bottom: 5.0),
            child: Column(
              children: [
                _paymentlistWidget(),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
              right: 10.0,
              bottom: 5.0),
          child: TextField(
              maxLength: 1000,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Order comment',
              ),
              onSubmitted: (String? value) {
                setState(
                        () => _orderComment = value);
              }),
        ),
        Padding(padding: EdgeInsets.only(top: 10.0)),
        _totalWidget(),
        Padding(padding: EdgeInsets.only(top: 10.0)),
        // ])
        // : Container(),
      ]),
    );
  }


  @override
  Widget build(BuildContext context) {
    var args;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as CheckoutArguments;
    }
     if(args!=null&&args?.paymentList!=null){
       _paymentList=args.paymentList;
       _cartTotal=args.cartTotal;
     }
    return MultiBlocProvider(
        providers: [
          BlocProvider<CustomerAddressBloc>(create: (context) {
            //加载产品的评论
            return CustomerAddressBloc(
                customerAddressRepository: CustomerAddressRepository())
              ..add(QueryCustomerAddressEvent());
          }),
          BlocProvider<OrdersBloc>(create: (context) {
            //加载产品的评论
            return OrdersBloc(orderRepository: OrderRepository());
          }),
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<PaypalBloc, PaypalState>(
                  listener: (context, state) {

                  }),
        BlocListener<OrdersBloc, OrdersState>(
            listener: (context, state) {

        }),
            ],
            child: _scaffoldWidget()
        ));
  }
}