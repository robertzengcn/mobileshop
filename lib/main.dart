import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/UI/HomeUIComponent/Home.dart';
import 'package:amigatoy/Repository/repository.dart';
// import 'package:amigatoy/database/database.dart';
import 'package:amigatoy/UI/LoginOrSignup/Login.dart';
import 'package:amigatoy/UI/CartUIComponent/Delivery.dart';
import 'package:amigatoy/UI/Payment/PaypalPayment.dart';
// import 'package:amigatoy/Arguments/PaypalArguments.dart';
import 'package:amigatoy/UI/CartUIComponent/Checkout.dart';
import 'package:amigatoy/UI/Payment/PaymentSuccess.dart';
// import 'package:amigatoy/Arguments/PaySuccessArguments.dart';
import 'package:amigatoy/UI/Order/OrderList.dart';


class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

/// Run first apps open
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
//  DatabaseProvider databaseprovider=DatabaseProvider();
//
//  databaseprovider.createDatabase();
//  BlocSupervisor.delegate = SimpleBlocDelegate();
//  await Parse().initialize(keyParseApplicationId, keyParseServerUrl,
//      clientKey:keyParseclientKey,
//      debug: true,
//      coreStore: await CoreStoreSharedPrefsImp.getInstance());
//  final CarouselRepository carouselRepository = CarouselRepository(
//    carouselApiClient: CarouselsApiClient(
//      httpClient: http.Client(),
//    ),
//  );
//  developer.log('start app', name: 'my.app.category');
  runApp(myApp());
}

/// Set orienttation
class myApp extends StatelessWidget {
  final userRepository = UserRepository();
//  final productRepository=ProductRepository();
  @override
  Widget build(BuildContext context) {
    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider<CarouselsBloc>(
          create: (context) {
            return CarouselsBloc(
              carouselsRepository: CarouselRepository(
                  carouselApiClient: CarouselsApiClient()),
            )..add(FetchCarousels(type: 'home'));
          },
        ),
        BlocProvider<MenusBloc>(
          create: (context) {
            return MenusBloc(
              menuRepository: MenuRepository(
                  menuApiClient: MenuApiClient()),
            )..add(FetchMenutype(type: 'home'));
          },
        ),

        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
                userRepository: userRepository
            )..add(AppStarted());
          },
        ),
        BlocProvider<LoginBloc>(
          create: (context) {
            return LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository,
            );
          },
        ),
        // BlocProvider<OrdersBloc>(create: (context) {
        //   //加载产品的评论
        //   return OrdersBloc(orderRepository: OrderRepository());
        // }),
        BlocProvider<PaypalBloc>(create: (context) {
          //加载产品的评论
          return PaypalBloc();
        }),
        BlocProvider<RegisterBloc>(
          create: (context) {
            return RegisterBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository,
            );
          },
        ),
      ],
      // child: MultiBlocListener(
        // listeners: [
        //   BlocListener<OrdersBloc, OrdersState>(listener: (context, state) {
        //     if (state is OrderErrorState) {
        //       var snackbar = SnackBar(
        //         content: Text("create order failure"),
        //       );
        //       ScaffoldMessenger.of(context).showSnackBar(snackbar);
        //     }else if(state is OrderCreatesuccessState){
        //       // print("133");
        //       switch(state.payment){
        //         case 'paypal':
        //         default:
        //         Navigator.pushNamed(context, PaypalPayment.routeName,
        //             arguments: PaypalArguments(state.invoice)
        //         );
        //         // BlocProvider.of<PaypalBloc>(context)
        //         //     .add(createPayment(invoice:state.invoice));
        //
        //         break;
        //       }
        //     }
        //   }),
        // ],
        child:MaterialApp(
          title: "Amiga Toy",
          theme: ThemeData(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              primaryColorLight: Colors.white,
              primaryColorBrightness: Brightness.light,
              primaryColor: Colors.white),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),

          /// Move splash screen to ChoseLogin Layout
          /// Routes
          routes: <String, WidgetBuilder>{
            //"login": (BuildContext context) => new Menu()
            Home.routeName: (BuildContext context) => new Home(),
            loginScreen.routeName:(BuildContext context) =>new loginScreen(),
            Delivery.routeName:(BuildContext context) =>new Delivery(),
            PaypalPayment.routeName:(BuildContext context) =>new PaypalPayment(),
            Checkout.routeName:(BuildContext context) =>new Checkout(),
            PaymentSuccess.routeName:(BuildContext context) =>new PaymentSuccess(),
            OrderList.routeName:(BuildContext context) =>new OrderList(),
          }),
      // )
    );
  }
}

/// Component UI
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// Component UI
class _SplashScreenState extends State<SplashScreen> {
  @override

  /// Setting duration in splash screen
  startTime() async {
    return new Timer(Duration(milliseconds: 4500), NavigatorPage);
  }

  /// To navigate layout change
  void NavigatorPage() {
     Navigator.of(context).pushReplacementNamed(Home.routeName);
    // Navigator.pushNamed(context, PaymentSuccess.routeName,
    //     arguments: PaySucessArguments("_payerID", "_orderId")
    // );
  }

  /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();
    startTime();
  }

  /// Code Create UI Splash Screen
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        /// Set Background image in splash screen layout (Click to open code)
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/man.png'), fit: BoxFit.cover)),
        child: Container(
          /// Set gradient black in image splash screen (Click to open code)
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color.fromRGBO(0, 0, 0, 0.3),
                Color.fromRGBO(0, 0, 0, 0.4)
              ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),

                    /// Text header "Welcome To" (Click to open code)
                    Text(
                      "Welcome to",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontFamily: "Sans",
                        fontSize: 19.0,
                      ),
                    ),

                    /// Animation text Treva Shop to choose Login with Hero Animation (Click to open code)
                    Hero(
                      tag: "Treva",
                      child: Text(
                        "Amiga Toy",
                        style: TextStyle(
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.w900,
                          fontSize: 35.0,
                          letterSpacing: 0.4,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
