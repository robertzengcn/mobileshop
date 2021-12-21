import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:amigatoy/Repository/PaypalServices.dart';
import 'package:amigatoy/Arguments/PaypalArguments.dart';
import 'package:amigatoy/Blocs/blocs.dart';
// import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/constants/application_constants.dart';
import 'package:amigatoy/Arguments/PaySuccessArguments.dart';
import 'package:amigatoy/UI/Payment/PaymentSuccess.dart';

class PaypalPayment extends StatefulWidget {
  final Function? onFinish;
  static const routeName = '/paypalpayment';
  PaypalPayment({this.onFinish});

  @override
  State<StatefulWidget> createState() {
    return PaypalPaymentState();
  }
}

class PaypalPaymentState extends State<PaypalPayment> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _checkoutUrl;
  // String? _executeUrl;
  // String? _accessToken;
  // String _cancelURL="";
  String _returnURL="";
  String _cancelUrl="";
  String _orderId="";
  // late WebViewController _controller;
  // PaypalServices services = PaypalServices();

  // you can change default currency according to your need
  // Map<dynamic,dynamic> defaultCurrency = {"symbol": "USD ", "decimalDigits": 2, "symbolBeforeTheNumber": true, "currency": "USD"};

  // bool isEnableShipping = false;
  // bool isEnableAddress = false;

  Widget _checkoutScaffold(){
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).backgroundColor,
      //   leading: GestureDetector(
      //     child: Icon(Icons.arrow_back_ios),
      //     onTap: () => Navigator.pop(context),
      //   ),
      // ),
      body: WebView(
        initialUrl: _checkoutUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onProgress: (int progress) {
          print("paypal payment page is loading (progress : $progress%)");
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.contains(_returnURL)) {
            final uri = Uri.parse(request.url);
            print(uri);
            final payerID = uri.queryParameters['PayerID'];
            if (payerID != null) {
              Navigator.pushNamed(context, PaymentSuccess.routeName,
                  arguments: PaySucessArguments(payerID,_orderId)
              );

              // BlocProvider.of<PaypalBloc>(context)
              //     .add(executePayment(url:_executeUrl!,
              //     payerId:payerID,
              //   accessToken:_accessToken!
              // ));

              // services
              //     .executePayment(executeUrl, payerID, accessToken)
              //     .then((id) {
              //   // widget.onFinish(id);
              //   Navigator.of(context).pop();
              // });

            } else {
              Navigator.of(context).pop();
            }
            Navigator.of(context).pop();
          }else if (request.url.contains(_cancelUrl)) {
            Navigator.of(context).pop();
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
  Widget _loaddingPagescaff(){
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        backgroundColor: Colors.black12,
        elevation: 0.0,
      ),
      body: Center(child: Container(child: CircularProgressIndicator())),
    );
  }
  @override
  Widget build(BuildContext context) {
    // print(checkoutUrl);
    var args;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as PaypalArguments;
      _checkoutUrl=args.checkoutUrl;
      _returnURL=args.returnUrl;
      _cancelUrl=args.cancelUrl;
      _orderId=args.orderId;
      // print(args);
      // _accessToken=payPalstate.accessToken;
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
          child: BlocBuilder<PaypalBloc, PaypalState>(
            builder: (context, payPalstate) {
              if(payPalstate is PaypalCreateState){
                return _checkoutScaffold();
              }else if(payPalstate is PaypalcreatesuccessState){
                return _loaddingPagescaff();
              }
              return Container();
            }
          )
        ));

  }
}
