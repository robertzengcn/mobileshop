import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treva_shop_flutter/blocs/blocs.dart';

class HomeImageSlide extends StatelessWidget {
  HomeImageSlide({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageslidersBloc, ImageslidersState>(
        builder: (context, state) {
            if(state is HomeImagesliderLoading){// is loading
              return Center(child: CircularProgressIndicator());
            }else if(state is HomeImagesliderloaded){

            }
        });
  }
}
