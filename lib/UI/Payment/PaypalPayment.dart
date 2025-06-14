import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:amigatoy/Arguments/PaypalArguments.dart';
import 'package:amigatoy/Blocs/blocs.dart';
// import 'package:amigatoy/Models/models.dart';
//import 'package:amigatoy/constants/application_constants.dart';
import 'package:amigatoy/Arguments/PaySuccessArguments.dart';
import 'package:amigatoy/UI/Payment/PaymentSuccess.dart';
import 'package:amigatoy/UI/Order/OrderList.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/scheduler.dart';
import 'package:amigatoy/Repository/repository.dart';


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
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _checkoutUrl;
  // String? _executeUrl;
  // String? _accessToken;
  // String _cancelURL="";
  String _returnURL = "";
  String _cancelUrl = "";
  String _orderId = "";
  String _payerID = "";
  String _paymentStatus = "waiting";
  bool isLoading=true;
  //does the customer finish the payment

  // late WebViewController _controller;
  // PaypalServices services = PaypalServices();

  // you can change default currency according to your need
  // Map<dynamic,dynamic> defaultCurrency = {"symbol": "USD ", "decimalDigits": 2, "symbolBeforeTheNumber": true, "currency": "USD"};

  // bool isEnableShipping = false;
  // bool isEnableAddress = false;

  Widget _checkoutScaffold() {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).backgroundColor,
      //   leading: GestureDetector(
      //     child: Icon(Icons.arrow_back_ios),
      //     onTap: () => Navigator.pop(context),
      //   ),
      // ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: _checkoutUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (int progress) {
              print("paypal payment page is loading (progress : $progress%)");
            },
            navigationDelegate: getNavigationDelegate,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            }),
          isLoading ? Center( child: CircularProgressIndicator(),)
              : Stack(),
        ],
      ),
    );
  }

  /// navigation
  Future<NavigationDecision> getNavigationDelegate(
      NavigationRequest request) async {
    if (request.url.contains(_returnURL)) {
      final uri = Uri.parse(request.url);
      print(uri);
      final payerID = uri.queryParameters['PayerID'];
      print(payerID);
      if (payerID != null) {
        _payerID = payerID;
        BlocProvider.of<PaypalBloc>(context)
            .add(successPayment(orderId: _orderId, paymentId: _payerID));
        setState(() {
          _paymentStatus = "finish";
        });
        return NavigationDecision.prevent;
      } else {
        setState(() {
          _paymentStatus = "finish";
        });
        return NavigationDecision.prevent;
      }
    } else if (request.url.contains(_cancelUrl)) {
      setState(() {
        _paymentStatus = "cancel";
      });
      return NavigationDecision.prevent;
    }

    return NavigationDecision.navigate;
  }

  Widget _loaddingPagescaff() {
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
      _checkoutUrl = args.checkoutUrl;
      _returnURL = args.returnUrl;
      _cancelUrl = args.cancelUrl;
      _orderId = args.orderId;
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
            return PaypalBloc(orderRepository: OrderRepository())..add(createPayment());
            // }
          }),
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<PaypalBloc, PaypalState>(
                  listener: (context, state) {}),
            ],
            child: BlocBuilder<PaypalBloc, PaypalState>(
                builder: (context, payPalstate) {
              switch (_paymentStatus) {
                case 'finish':
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, PaymentSuccess.routeName,
                        arguments: PaySucessArguments(_payerID, _orderId));
                  });
                  break;
                case 'cancel':
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context)
                        .pushReplacementNamed(OrderList.routeName);
                  });
                  break;
              }
              if (payPalstate is PaypalCreateState) {
                return _checkoutScaffold();
              } else if (payPalstate is PaypalpenddingState) {
                return _loaddingPagescaff();
              }
              return Container();
            })));
  }
}
