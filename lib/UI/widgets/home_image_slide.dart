import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/blocs/blocs.dart';
import 'package:amigatoy/Library/carousel_pro/carousel_pro.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Blocs/blocs.dart';

class HomeImageSlide extends StatelessWidget {
  HomeImageSlide({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselsBloc, CarouselsState>(
        builder: (context, state) {
            if(state is CarouselsEmpty){// is loading
              return Center(child: CircularProgressIndicator());
            }else if(state is Carouselsloaded){

//              final imagesliders = state;
//              return Container(
//                height: 182.0,
//                child: new Carousel(
//                    boxFit: BoxFit.cover,
//                    dotColor: Color(0xFF6991C7).withOpacity(0.8),
//                    dotSize: 5.5,
//                    dotSpacing: 16.0,
//                    dotBgColor: Colors.transparent,
//                    showIndicator: true,
//                    overlayShadow: true,
//                    overlayShadowColors: Colors.white.withOpacity(0.9),
//                    overlayShadowSize: 0.9,
//                    images: imagesliders?.map((i) {
//                      return NetworkImage(i.url);
//                    })?.toList() ??
//                        []),
//              );
            }
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
