import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:amigatoy/Library/carousel_pro/carousel_pro.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/UI/HomeUIComponent/productCard.dart';
import 'dart:developer' as developer;
import 'package:amigatoy/UI/widgets/item_grid.dart';

class HomeRecommend extends StatefulWidget {
  @override
  HomeRecommendstate createState() => HomeRecommendstate();
}

class HomeRecommendstate extends State<HomeRecommend> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedsBloc, FeaturedState>(builder: (context, state) {
      if (state is FeaturedEmpty) {
        // is loading
        return Center(child: CircularProgressIndicator());
      }
      if (state is Featuredloaded) {
        final featurelist = state.lstFeatureds;
//        developer.log('feature list all load',
//            name: 'my.app.category', error: featurelist);

        return Container(

//                  color: Color(0xFF6991C7),
//            height: 600.0,
        height:MediaQuery
            .of(context)
            .size
            .height * 0.5,
            margin: EdgeInsets.symmetric(vertical: 1.0),
            child: Row(children: getWidgets(featurelist)));
      }
      return Center(child: CircularProgressIndicator());
    });
  }

  List<Widget> getWidgets(List<Product> lstFeatureds) {
    List<Widget> widgetlist = List();
    int plength = lstFeatureds.length; //总数量
    if (plength == 0) {
      return widgetlist;
    }

//    developer.log('feature list render',
//        name: 'my.app.category', error: plength);
    int rownumbe = (plength / 2).round();
    for (int i = 0; i < rownumbe; i++) {
//      developer.log('feature item render', name: 'my.app.category', error: i);
      widgetlist.add(
       Row(children: [
        Column(
          children: <Widget>[
            Expanded(
//              flex: 5,
              child: ItemGrid(lstFeatureds[i]),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Expanded(
//              flex: 5,
              child: ItemGrid(lstFeatureds[i+1]),
            ),
          ],
        ),
      ]));
    }

    return widgetlist;
  }
}
