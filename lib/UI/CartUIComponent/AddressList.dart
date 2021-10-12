//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/UI/widgets/customer_address_card.dart';
import 'package:amigatoy/UI/CartUIComponent/Delivery.dart';

class AddressList extends StatefulWidget {
  @override
  _addressListState createState() => _addressListState();
}

class _addressListState extends State<AddressList> {
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CustomerAddressBloc>(create: (context) {
            return CustomerAddressBloc(
                customerAddressRepository: CustomerAddressRepository())..add(QueryCustomerAddressEvent());
          }),
        ],
        child: MultiBlocListener(listeners: [
          BlocListener<CustomerAddressBloc, CustomerAddressState>(
              listener: (context, state) {

          }),
        ], child: AddressWrapper()));
  }
}

class AddressWrapper extends StatefulWidget {
  @override
  _AddressWrapperState createState() => _AddressWrapperState();
}

class _AddressWrapperState extends State<AddressWrapper> {
  void initState() {
    super.initState();
  }

  List<CustomerAddress?> _customerAddlist = [];

  Widget _customerAddress(){
    List<Widget> custlistWidget = [];
    if (_customerAddlist.length > 0) {
      for (var i = 0; i < _customerAddlist.length; i++) {
        custlistWidget.add(
            getCusterAdd(_customerAddlist[i]!,true)
        );
      }
    }
      return Column(
          children:[
            Container(
                height: 400,
                child:ListView(
                  children: custlistWidget,
                )),
            Padding(padding: EdgeInsets.only(top: 10.0)),
          ]);


  }

  ///delivery app page
  Widget _scaffoldDiv() {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop(false);
              },
              child: Icon(Icons.arrow_back)),
          elevation: 0.0,
          title: Text(
            "Add shipping address",
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

              child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: _customerAddress(),
              )),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Container(
                child:OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => new delivery()));
                  },
                  child: const Text('Add Shipping Address'),
                )
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerAddressBloc, CustomerAddressState>(
        builder: (context, customeraddstate) {
      if (customeraddstate is QueryCustomerAddressSuccess) {
        _customerAddlist = customeraddstate.customerAddressList;
      }
      return _scaffoldDiv();
    });
  }
}
