import 'dart:async';

import 'package:flutter/material.dart';

import 'package:amigatoy/Arguments/PaySuccessArguments.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';

class PaymentSuccess extends StatefulWidget {
  static const routeName = '/paymentsuccess';
  @override
  _paymentsuccessState createState() => _paymentsuccessState();
}

class _paymentsuccessState extends State<PaymentSuccess> {

  String _orderId="";
  String _paymentId="";

  Widget _paysuccessScaffold(){
    return Scaffold(
      /// Appbar
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: Icon(Icons.arrow_back)),
        elevation: 0.0,
        title: Text(
          "Checkout Success",
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Thank you for your Order, your Order id is"+_orderId+", your payment id is"+_paymentId,
                  style: TextStyle(
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.w600,
                      fontSize: 25.0,
                      color: Colors.black54,
                      fontFamily: "Gotik"),
                ),
                Padding(padding: EdgeInsets.only(top: 60.0)),
                /// For RadioButton if selected or not selected

                Divider(
                  height: 1.0,
                  color: Colors.black26,
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),



                /// Button pay

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    var args;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as PaySucessArguments;
      _orderId=args.orderId;
      _paymentId=args.payId;
    }
    return MultiBlocProvider(
        providers: [
          BlocProvider<PaypalBloc>(create: (context) {
            //create paypal checkout
            // if(args!=null){
            //   return PaypalBloc()..add(createPayment(paypalrequest:args.invoice));
            // }else{
            return PaypalBloc()..add(createPayment());
            // }

          }),
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<PaypalBloc, PaypalState>(
                  listener: (context, state) {

                  }),
            ],
            child: _paysuccessScaffold(),
        ));
  }
}

