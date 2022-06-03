import 'package:flutter/material.dart';
import 'package:amigatoy/UI/CartUIComponent/AddressList.dart';
import 'package:amigatoy/UI/AcountUIComponent/EditProfile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/UI/HomeUIComponent/Home.dart';

class settingAcount extends StatefulWidget {
  @override
  _settingAcountState createState() => _settingAcountState();
}

class _settingAcountState extends State<settingAcount> {
  // static var _txtCustomHead = TextStyle(
  //   color: Colors.black54,
  //   fontSize: 17.0,
  //   fontWeight: FontWeight.w600,
  //   fontFamily: "Gotik",
  // );

  // static var _txtCustomSub = TextStyle(
  //   color: Colors.black38,
  //   fontSize: 15.0,
  //   fontWeight: FontWeight.w500,
  //   fontFamily: "Gotik",
  // );
  void _updateProfile(){
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => new editProfile(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        },
      ),

    );
  }

  // _showAlertDialog(BuildContext contexts) {  // set up the buttons
  //   Widget cancelButton = TextButton(
  //     child: Text("Cancel"),
  //     onPressed:  () {},
  //   );
  //   Widget continueButton = TextButton(
  //     child: Text("Yes"),
  //     onPressed:  () {
  //       // BlocProvider.of<OrdersBloc>(context)
  //       //     .add(FeatchMoreEvent(start:_startPage,length: _pageLength));
  //     },
  //   );  // set up the AlertDialog
  //   AlertDialog alert =AlertDialog(
  //     title: Text("AlertDialog"),
  //     content: Text("Do you confirm to delete your account?"),
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );
  //   // show the dialog
  //
  //     showDialog(
  //       context: contexts,
  //       builder: (BuildContext context) {
  //         return alert;
  //       },
  //     );
  //
  //
  // }
  void _manageAdd(){
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => new AddressList(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        },
      ),

    ).then((_) => setState(() {}));

  }
  // void _manageNotify(){
  //
  // }


  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<UpdateUserBloc>(create: (context) {
        return UpdateUserBloc(userRepository: UserRepository());
      }),
      ],
  // create: (context) => UpdateUserBloc(userRepository: UserRepository()),
  child: MultiBlocListener(
    listeners:  [
      BlocListener<UpdateUserBloc, UpdateUserState>(
          listener: (context, state) {
              if(state is UpdateUserErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }else if(state is DeleteUsersuccessstate){
                BlocProvider.of<AuthenticationBloc>(context).add(
                    LoggedOut());
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new Home()));
              }
          }),
    ],
  child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting Acount",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
              color: Colors.black54,
              fontFamily: "Gotik"),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF6991C7)),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              setting(
                head: "Account",
                sub1: "Profile",
                f1: _updateProfile,
                sub2: "Manage Address",
                f2:_manageAdd,
              ),
              setting(
                head: "Setting",
                // sub1: "Notifications",
                // f1:_manageNotify,
                sub1: "Delete Account",

              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 5.0),
              //   child: Container(
              //     height: 50.0,
              //     width: 1000.0,
              //     color: Colors.white,
              //     child: Padding(
              //       padding: const EdgeInsets.only(
              //           top: 13.0, left: 20.0, bottom: 15.0),
              //       child: Text(
              //         "Logout",
              //         style: _txtCustomHead,
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    ),
),
);
  }
}

class setting extends StatelessWidget {
  static var _txtCustomHead = TextStyle(
    color: Colors.black54,
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
    fontFamily: "Gotik",
  );

  static var _txtCustomSub = TextStyle(
    color: Colors.black38,
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    fontFamily: "Gotik",
  );

  String head, sub1;
  String? sub2,sub3;
  // Function f1;
  void Function()? f1,f2,f3;
  setting(
      {required this.head, required this.sub1, this.f1,this.sub2,this.f2, this.sub3,this.f3});
  _showAlertDialog(BuildContext context) {  // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed:  () {
        BlocProvider.of<UpdateUserBloc>(context)
            .add(DeleteUserevent());

        // Navigator.of(context).pop();
        // BlocProvider.of<OrdersBloc>(context)
        //     .add(FeatchMoreEvent(start:_startPage,length: _pageLength));
      },
    );  // set up the AlertDialog
    AlertDialog alert =AlertDialog(
      title: Text("Confirm delete account"),
      content: Text("Do you confirm to delete your account?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );  // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        height: 235.0,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, top: 15.0),
                child: Text(
                  head,
                  style: _txtCustomHead,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
                  color: Colors.black12,
                  height: 0.5,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: InkWell(
                  // onTap: f1,
                  onTap: () {
                    if(f1!=null){
                      f1!();
                    }else{
                    _showAlertDialog(context);
                    }
                },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          sub1,
                          style: _txtCustomSub,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black38,
                        )
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
                  color: Colors.black12,
                  height: 0.5,
                ),
              ),
              sub2 != null?Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: InkWell(
                  onTap: f2,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          sub2!,
                          style: _txtCustomSub,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black38,
                        )
                      ]),
                ),
              ):Container(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
                  color: Colors.black12,
                  height: 0.5,
                ),
              ),
              sub3 != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              sub3!,
                              style: _txtCustomSub,
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black38,
                            )
                          ]),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
                  color: Colors.black12,
                  height: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
