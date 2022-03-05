import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:amigatoy/UI/BottomNavigationBar.dart';
import 'package:amigatoy/UI/LoginOrSignup/Login.dart';
import 'package:amigatoy/UI/LoginOrSignup/LoginAnimation.dart';
//import 'package:amigatoy/UI/LoginOrSignup/Signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:email_validator/email_validator.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  //Animation Declaration
  late AnimationController sanimationController;
  late AnimationController animationControllerScreen;
  late Animation animationScreen;
  var tap = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  /// Set AnimationController to initState
  @override
  void initState() {
    sanimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..addStatusListener((statuss) {
            if (statuss == AnimationStatus.dismissed) {
              setState(() {
                tap = 0;
              });
            }
          });
    // TODO: implement initState
    super.initState();
  }

  /// Dispose animationController
  @override
  void dispose() {
    sanimationController.dispose();
    super.dispose();
  }

  /// Playanimation set forward reverse
  Future<Null> _PlayAnimation() async {
    try {
      await sanimationController.forward();
      await sanimationController.reverse();
    } on TickerCanceled {}
  }


  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.height;
    mediaQueryData.size.width;

    _onRegisterButtonPressed() {
      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Processing Data')));
      } else {
        print('Form is invalid');
        return;
      }
      BlocProvider.of<RegisterBloc>(context).add(
          RegisterBtnclick(email: _emailController.text,
              password: _passwordController.text,
              fullName: _nameController.text
          )
      );
    }
    return BlocListener<RegisterBloc, RegisterState>(listener: (context, state) {
      if (state is Registerfailure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text('${state.error}')),
          );
      }else if(state is RegisterCompleted){
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(
        //         builder: (BuildContext context) =>
        //             new loginScreen()));
        // setState(() {
        //   tap = 1;
        // });
        print(59);
        new LoginAnimation(
          animationController: sanimationController,
        );
        _PlayAnimation();
      }else if(state is RegisterLoadingState){
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text('Registering, please wait...')),
          );
      }
    },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              /// Set Background image in layout
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/img/backgroundgirl.png"),
                fit: BoxFit.cover,
              )),
              child: Container(
                /// Set gradient color in image
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.2),
                      Color.fromRGBO(0, 0, 0, 0.3)
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                  ),
                ),
                /// Set component layout
                child: ListView(
                  padding: EdgeInsets.all(0.0),
                  children: <Widget>[
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              alignment: AlignmentDirectional.topCenter,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    /// padding logo
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top:
                                                mediaQueryData.padding.top + 40.0)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage("assets/img/Logo.png"),
                                          height: 70.0,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0)),
                                        /// Animation text treva shop accept from login layout
                                        Hero(
                                          tag: "Treva",
                                          child: Text(
                                            "Amiga Toy",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                letterSpacing: 0.6,
                                                fontFamily: "Sans",
                                                color: Colors.white,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 70.0)),
                                    textFromField(
                                      icon: Icons.account_box_rounded,
                                      password: false,
                                      email: "Your Name",
                                      inputType: TextInputType.text,
                                      controllerValue: _nameController,
                                    ),
                                    Padding(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 5.0)),
                                    /// TextFromField Email
                                    textFromField(
                                      icon: Icons.email,
                                      password: false,
                                      email: "Email",
                                      inputType: TextInputType.emailAddress,
                                      controllerValue: _emailController,
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0)),

                                    /// TextFromField Password
                                    textFromField(
                                      icon: Icons.vpn_key,
                                      password: true,
                                      email: "Password",
                                      inputType: TextInputType.text,
                                      controllerValue: _passwordController,
                                    ),
                                    Padding(
                                        padding:
                                        EdgeInsets.only(top: 20.0)),
                                    /// Button Login
                                    TextButton(
                                        // padding: EdgeInsets.only(top: 20.0),
                                        onPressed: () {
                                          // _onRegisterButtonPressed();
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (BuildContext context) =>
                                                      new loginScreen()));
                                        },
                                        child: Text(
                                          " Have Acount? Sign In",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Sans"),
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: mediaQueryData.padding.top + 175.0,
                                          bottom: 0.0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        /// Set Animaion after user click buttonLogin
                        InkWell(
                                splashColor: Colors.yellow,
                                onTap: () {
                                  _onRegisterButtonPressed();
                                  // setState(() {
                                  //   tap = 1;
                                  // });
                                  // _PlayAnimation();
//                                return tap;
                                },
                                child: buttonBlackBottom(),
                              )

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// textfromfield custom class
class textFromField extends StatelessWidget {
  bool password;
  String email;
  IconData icon;
  TextInputType inputType;
  TextEditingController controllerValue;

  textFromField({required this.email, required this.icon, required this.inputType, required this.password,required this.controllerValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
            obscureText: password,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: email,
                icon: Icon(
                  icon,
                  color: Colors.black38,
                ),
                labelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Sans',
                    letterSpacing: 0.3,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600)),
            keyboardType: inputType,
            controller: controllerValue,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              } else if (email == 'Email') {
                bool emailValid = EmailValidator.validate(value);

                if (!emailValid) {
                  return 'email address error';
                }
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}

///ButtonBlack class
class buttonBlackBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Container(
        height: 55.0,
        width: 600.0,
        child: Text(
          "Sign Up",
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 0.2,
              fontFamily: "Sans",
              fontSize: 18.0,
              fontWeight: FontWeight.w800),
        ),
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])),
      ),
    );
  }
}
