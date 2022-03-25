import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Library/carousel_pro/carousel_pro.dart';
//import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeImageSlide extends StatefulWidget {
  @override
  HomeImageSlidestate createState() => HomeImageSlidestate();
}
class HomeImageSlidestate extends State<HomeImageSlide>{
//  HomeImageSlide({Key key}) : super(key: key);
//  List<Carousel> lst;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselsBloc, CarouselsState>(
        builder: (context, state) {
            if(state is CarouselsEmpty){// is loading
              return Center(child: CircularProgressIndicator());
            }
            if(state is Carouselsloaded){
              final imagesliders = state.lstCarousel;
              return Container(
                height: 175.0,
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
                    radius:Radius.circular(8.0),
                    images: imagesliders.map((i) {
                      return CachedNetworkImageProvider(i.url);
                    }).toList()),
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
