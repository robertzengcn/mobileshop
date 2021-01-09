import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Library/carousel_pro/carousel_pro.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/UI/HomeUIComponent/productCard.dart';

class HomeRecommend extends StatefulWidget {
  @override
  HomeRecommendstate createState() => HomeRecommendstate();
}
class HomeRecommendstate extends State<HomeRecommend>{

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedsBloc, FeaturedState>(
        builder: (context, state) {
          if(state is FeaturedEmpty){// is loading
            return Center(child: CircularProgressIndicator());
          }
          if(state is Featuredloaded){
            final featurelist = state.lstFeatureds;
            return Container(
//                  color: Color(0xFF6991C7),
                height: 20.0,
                margin: EdgeInsets.symmetric(vertical: 1.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: featurelist.map((value) {
                    return ProductCard(productDetails:value);
                  }).toList(),
                )
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}