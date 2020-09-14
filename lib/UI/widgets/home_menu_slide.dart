import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Library/carousel_pro/carousel_pro.dart';
import 'package:amigatoy/Blocs/blocs.dart';

class HomeMenuSlide extends StatefulWidget {
  @override
  HomeMenuSlidestate createState() => HomeMenuSlidestate();
}
class HomeMenuSlidestate extends State<HomeMenuSlide>{
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
                height: 182.0,
                child: new Carousel(
                    boxFit: BoxFit.cover,
                    dotColor: Color(0xFF6991C7).withOpacity(0.8),
                    dotSize: 5.5,
                    dotSpacing: 16.0,
                    dotBgColor: Colors.transparent,
                    showIndicator: true,
                    overlayShadow: true,
                    overlayShadowColors: Colors.white.withOpacity(0.9),
                    overlayShadowSize: 0.9,
                    images: menusliders?.map((i) {
                      return NetworkImage(i.url);
                    })?.toList() ??
                        []),
              );
            }
            return Center(child: CircularProgressIndicator());
        });
  }
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
