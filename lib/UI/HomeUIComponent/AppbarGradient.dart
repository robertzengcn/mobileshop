import 'package:flutter/material.dart';
//import 'package:amigatoy/UI/AcountUIComponent/Notification.dart';
import 'package:amigatoy/UI/HomeUIComponent/Search.dart';
//import 'package:amigatoy/UI/AcountUIComponent/Message.dart';
//import 'package:amigatoy/UI/widgets/SideMenu.dart';
//import 'package:amigatoy/UI/LoginOrSignup/LoginAnimation.dart';
import 'package:amigatoy/UI/LoginOrSignup/Login.dart';
import 'package:amigatoy/UI/AcountUIComponent/Profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
//import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/UI/CatelogueUIComponent/BrandLayout.dart';
import 'package:amigatoy/UI/BottomNavigationBar.dart';

class AppbarGradient extends StatefulWidget {
  @override
  _AppbarGradientState createState() => _AppbarGradientState();
}

class _AppbarGradientState extends State<AppbarGradient> {
  String CountNotice = "0";
//  static const IconData menuicon = IconData(0xe867, fontFamily: 'MaterialIcons');
  /// Build Appbar in layout home
  @override
  Widget build(BuildContext context) {
    /// Create responsive height and padding
    final MediaQueryData media = MediaQuery.of(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        /// Create component in appbar
        return Container(
          padding: EdgeInsets.only(top: statusBarHeight),
          height: 58.0 + statusBarHeight,
          decoration: BoxDecoration(

              /// gradient in appbar
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFFA3BDED),
                    const Color(0xFF6991C7),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              /// if user click shape white in appbar navigate to search layout
              InkWell(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (_, __, ___) => searchAppbar(),

                      /// transtation duration in animation
                      transitionDuration: Duration(milliseconds: 750),

                      /// animation route to search layout
                      transitionsBuilder:
                          (_, Animation<double> animation, __, Widget child) {
                        return Opacity(
                          opacity: animation.value,
                          child: child,
                        );
                      }));
                },

                /// Create shape background white in appbar (background treva shop text)
                child: Container(
                  margin: EdgeInsets.only(left: media.padding.left + 15),
                  height: 37.0,
                  width: 222.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      shape: BoxShape.rectangle),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 17.0)),
                      Image.asset(
                        "assets/img/search2.png",
                        height: 22.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                        left: 17.0,
                      )),
                      Padding(
                        padding: EdgeInsets.only(top: 3.0),
                        child: Text(
                          "Amiga Toy",
                          style: TextStyle(
                              fontFamily: "Popins",
                              color: Colors.black12,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.0,
                              fontSize: 16.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Icon chat (if user click navigate to chat layout)
              InkWell(
                  onTap: () {
                    if(state is AuthenticationUnauthenticated){
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => new loginScreen()));
                    }else if(state is AuthenticationAuthenticated){
                      // Navigator.of(context).push(PageRouteBuilder(
                      //     pageBuilder: (_, __, ___) => new profil()));
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => new bottomNavigationBar(pageIndex: 3)));

                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (BuildContext context) => new bottomNavigationBar(pageIndex: 0,)));
                    }else{
                     Center(child: CircularProgressIndicator());
                    }
                  },
//              child: Image.asset(
//                "assets/img/chat.png",
//                height: media.devicePixelRatio + 20.0,
//              )
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 26.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  )),

              /// Icon notification (if user click navigate to notification layout)
              InkWell(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (_, __, ___) => new brand()));
                },
                child: Stack(
                  alignment: AlignmentDirectional(-3.0, -3.0),
                  children: <Widget>[
//                Image.asset(
//                  "assets/img/notifications-button.png",
//                  height: 24.0,
//                ),
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 26.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    CircleAvatar(
                      radius: 8.6,
                      backgroundColor: Colors.redAccent,
                      child: Text(
                        CountNotice,
                        style: TextStyle(fontSize: 13.0, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
