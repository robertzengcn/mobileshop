// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:amigatoy/Arguments/PaySuccessArguments.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/UI/widgets/product_list.dart';
import 'package:amigatoy/UI/Order/OrderList.dart';

class PaymentSuccess extends StatefulWidget {
  static const routeName = '/paymentsuccess';

  @override
  _paymentsuccessState createState() => _paymentsuccessState();
}

class _paymentsuccessState extends State<PaymentSuccess> {

  String _orderId="";
  String _paymentId="";


  Widget _paysuccessScaffold(){
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      /// Appbar
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              // Navigator.of(context).pop(false);
              Navigator.of(context).pushReplacementNamed(OrderList.routeName);
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
      body:
    // Container(
        // child: SingleChildScrollView(
        //   child:
          Container(
            height:_screenHeight,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: Column(

                children: <Widget>[
                  Text(
                    "Thank you for your Order, your Order id is: "+_orderId+", your payment id is: "+_paymentId,
                    style: TextStyle(
                        letterSpacing: 0.1,
                        fontWeight: FontWeight.w600,
                        fontSize: 25.0,
                        color: Colors.black54,
                        fontFamily: "Gotik"),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  /// For RadioButton if selected or not selected

                  Divider(
                    height: 1.0,
                    color: Colors.black26,
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  BlocBuilder<SpecialsBloc, SpecialsState>(
                      builder: (context, specialstate) {
                        if(specialstate is SpecialsLoading){
                          return Center(child: CircularProgressIndicator());
                        }else if(specialstate is Specialsloaded){
                          if(specialstate.lstSpecials.length>0){
                          return Container(
                              height:_screenHeight*0.55,
                              child: Column(
                                children: [

                                  Container(
                                      height:40,
                                      alignment: Alignment.center,
                                      child: Text('Special item sale', style: TextStyle(height: 3.0, fontSize: 15.2, fontWeight: FontWeight.bold,))),

                                  Expanded(

                                    child: SizedBox(
                                      child: productListWidget(specialstate.lstSpecials)),
                                  ),

                              ]),
                            );
                          }
                        }
                          return Container();
                      }
                  ),
                ],
              ),
            ),
          ),
        // ),
      // ),
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
            return PaypalBloc(orderRepository: OrderRepository())..add(createPayment());
          }),
          BlocProvider<SpecialsBloc>(create: (context) {
            return SpecialsBloc(productRepository: ProductRepository())..add(FetchSpecials(start:0,length: 10));
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

