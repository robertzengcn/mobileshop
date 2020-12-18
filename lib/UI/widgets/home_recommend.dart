import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Library/carousel_pro/carousel_pro.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Models/models.dart';

class HomeRecommend extends StatefulWidget {
  @override
  HomeRecommendstate createState() => HomeRecommendstate();
}
class HomeRecommendstate extends State<HomeRecommend>{

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if(state is MenusEmpty){// is loading
            return Center(child: CircularProgressIndicator());
          }
          if(state is Menusloaded){
            final menusliders = state.lstMenu;
            return Container(
//                  color: Color(0xFF6991C7),
                height: 20.0,
                margin: EdgeInsets.symmetric(vertical: 1.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: menusliders.map((value) {
                    return _buildMenuitem(value);
                  }).toList(),
                )
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}