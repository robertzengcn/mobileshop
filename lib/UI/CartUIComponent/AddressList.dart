//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/UI/widgets/customer_address_card.dart';
import 'package:amigatoy/UI/CartUIComponent/Delivery.dart';
import 'package:amigatoy/UI/CartUIComponent/CartLayout.dart';

class AddressList extends StatefulWidget {
  static const routeName = '/addresslist';
  @override
  _addressListState createState() => _addressListState();
}

class _addressListState extends State<AddressList> {
  List<CustomerAddress?> _customerAddlist = [];

  Widget _customerAddress() {
    List<Widget> custlistWidget = [];
    if (_customerAddlist.length > 0) {
      for (var i = 0; i < _customerAddlist.length; i++) {
        bool asDefault = true;
        if (i == 0) {
          asDefault = false;
        }
        custlistWidget
            .add(getCusterAdd(_customerAddlist[i]!, true, context, asDefault));
      }
    }
    return Column(children: [
      Container(
          height: 460,
          child: ListView(
            children: custlistWidget,
          )),
      Padding(padding: EdgeInsets.only(top: 10.0)),
    ]);
  }

  Widget _scaffoldDiv(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop(false);
              },
              child: Icon(Icons.arrow_back)),
          elevation: 0.0,
          title: Text(
            "Manage shipping address",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.black54,
                fontFamily: "Gotik"),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF6991C7)),
        ),
        body: Column(
          children: [
            Container(
              height: 450,
              child: SingleChildScrollView(
                  child: Container(
                color: Colors.white,
                child: _customerAddress(),
              )),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Container(
                child: OutlinedButton(
              onPressed: () {
                //print("112");
                // Navigator.of(context).push(PageRouteBuilder(
                //     pageBuilder: (_, __, ___) => new Delivery()));
                Navigator.of(context)
                    .push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => new Delivery(),
                        transitionDuration: Duration(milliseconds: 900),

                        /// Set animation Opacity in route to detailProduk layout
                        transitionsBuilder:
                            (_, Animation<double> animation, __, Widget child) {
                          return Opacity(
                            opacity: animation.value,
                            child: child,
                          );
                        }))
                    .then((value) => setState(() {
                  BlocProvider.of<CustomerAddressBloc>(context).add(QueryCustomerAddressEvent());
                }));
              },
              child: const Text('Add Shipping Address'),
            )),
          ],
        ));
  }

  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CustomerAddressBloc>(create: (context) {
            return CustomerAddressBloc(
                customerAddressRepository: CustomerAddressRepository())
              ..add(QueryCustomerAddressEvent());
          }),
        ],
        child: MultiBlocListener(listeners: [
          BlocListener<CustomerAddressBloc, CustomerAddressState>(
              listener: (context, state) {
            if (state is SetCustomersuccessState) {
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new Cartpage()));
            } else if (state is QueryCustomerAddressSuccess) {
              setState(() {
                _customerAddlist = state.customerAddressList;
              });
            }
          }),
        ],
        child: BlocBuilder<CustomerAddressBloc, CustomerAddressState>(
    builder: (context, state) {
      return _scaffoldDiv(context);

    }
      )
        )
    );
    }
  }



