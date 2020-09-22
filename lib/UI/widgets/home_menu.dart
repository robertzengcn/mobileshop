import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Library/carousel_pro/carousel_pro.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Models/models.dart';

class HomeMenu extends StatefulWidget {
  @override
  HomeMenustate createState() => HomeMenustate();
}
class HomeMenustate extends State<HomeMenu>{
//  HomeImageSlide({Key key}) : super(key: key);
//  List<Carousel> lst;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenusBloc, MenusState>(
        builder: (context, state) {
            if(state is MenusEmpty){// is loading
              return Center(child: CircularProgressIndicator());
            }
            if(state is Menusloaded){
              final menusliders = state.lstMenu;
              return Container(
                height: 30.0,
                margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                      children: menusliders.map((value) {
                      return _buildChatPage(value);
                      }).toList(),
                  )
              );
            }
            return Center(child: CircularProgressIndicator());
        });
  }
}

var menuItem=Container(

);

Widget _buildChatPage(Menu menu) {

  return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent)
      ),
      child:new Text(
        menu.title
      )
  );
}
/// ImageSlider in header
//    var imageSliderview = Container(
//      height: 182.0,
//      child: new Carousel(
//          boxFit: BoxFit.cover,
//          dotColor: Color(0xFF6991C7).withOpacity(0.8),
//          dotSize: 5.5,
//          dotSpacing: 16.0,
//          dotBgColor: Colors.transparent,
//          showIndicator: true,
//          overlayShadow: true,
//          overlayShadowColors: Colors.white.withOpacity(0.9),
//          overlayShadowSize: 0.9,
//          images: imagesliders?.map((i) {
//                return NetworkImage(i.url);
//              })?.toList() ??
//              []),
//    );
