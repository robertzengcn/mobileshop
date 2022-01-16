import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:amigatoy/Library/carousel_pro/carousel_pro.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Models/models.dart';
//import 'package:amigatoy/UI/HomeUIComponent/productCard.dart';
//import 'dart:developer' as developer;
import 'package:amigatoy/UI/widgets/item_grid.dart';
import 'package:amigatoy/Repository/repository.dart';

class HomeRecommend extends StatefulWidget {
  @override
  HomeRecommendstate createState() => HomeRecommendstate();
}

class HomeRecommendstate extends State<HomeRecommend> {
  List<Product?> _lproduct=[];
  bool isLoading =true;
  late double _containHeight;
  double itemHeight =0;
  double itemWidth =0;

  ///get feature product list
  List<ItemGrid> _listFeaturegrid(){
    List<ItemGrid> resGrid=[];
    _lproduct.forEach((value) {
      if(value!=null){
      resGrid.add(ItemGrid(value));
      }
    });
    return resGrid;
  }

  void _loadMore async(){
    BlocProvider.of<FeaturedsBloc>(context)
        .add(FeaturedloadMore(start:_startPage,length: _pageLength));
  }

  //feature list widget
  Widget _listFeatureProduct(){
    return BlocBuilder<FeaturedsBloc, FeaturedState>(builder: (context, state) {
      if (state is FeaturedLoading) {
        // is loading
        return Center(child: CircularProgressIndicator());
      }else if(state is Featuredloaded) {

        // final featurelist = state.lstFeatureds.lproduct;
      // return Container(
      //     height: _containHeight,
      //     // height: 1000,
      //     padding: EdgeInsets.all(2.0),
      //     child: GridView.count(
      //         physics: ScrollPhysics(),
      //         primary: false,
      //         padding: const EdgeInsets.all(10),
      //         crossAxisSpacing: 10,
      //         mainAxisSpacing: 10,
      //         crossAxisCount: 2,
      //
      //        // childAspectRatio: (itemWidth / itemHeight),
      //         children: _listFeaturegrid()
      //     )

          return Container(
            height: 1000,
            child: RefreshIndicator(
              onRefresh:_loadMore(),
              child: GridView.builder(
                itemCount: _lproduct.length,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    mainAxisExtent: 285
                ),
                itemBuilder: (BuildContext context, int index){
                  if(_lproduct[index]!=null){
                    return ItemGrid(_lproduct[index]!);
                  }else{
                    return Container();
                  }
                },

              ),
            ),
          );
      // );

//        developer.log('feature list all load',
//            name: 'my.app.category', error: featurelist);

//         return Container(
// //                  color: Color(0xFF6991C7),
// //            height: 600.0,
//         height:MediaQuery
//             .of(context)
//             .size
//             .height * 0.5,
//             margin: EdgeInsets.symmetric(vertical: 1.0),
//             child: Row(children: getWidgets(featurelist)));


      }
      return Container();
      // return Center(child: CircularProgressIndicator());
    });
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
     _containHeight=mediaQueryData.size.height;

    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
   itemHeight = (size.height - kToolbarHeight - 24) / 1.6;
   itemWidth = size.width / 2;

    return MultiBlocProvider(providers: [
      BlocProvider<FeaturedsBloc>(
        create: (context) {
          return FeaturedsBloc(
            featuredRepository: FeaturedRepository(),
          )..add(FetchFeatureds(start:0,length: 25));
        },
      ),
    ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<FeaturedsBloc, FeaturedState>(
                  listener: (context, state) {
                    if(state is Featuredloaded){
                      // if(state.orderlst.length>0){
                      setState(() {
                        _lproduct.addAll(state.lstFeatureds.lproduct);
                        isLoading = false;
                      });

                    }
                  }),
            ],
            child:_listFeatureProduct(),
    ));


  }

//   List<Widget> getWidgets(List<Product> lstFeatureds) {
//     List<Widget> widgetlist = [];
//     int plength = lstFeatureds.length; //总数量
//     if (plength == 0) {
//       return widgetlist;
//     }
//
// //    developer.log('feature list render',
// //        name: 'my.app.category', error: plength);
//     int rownumbe = (plength / 2).round();
//     for (int i = 0; i < rownumbe; i++) {
// //      developer.log('feature item render', name: 'my.app.category', error: i);
//       widgetlist.add(
//           Expanded(
//          child: Row(children: [
//           Column(
//             children: <Widget>[
//               Expanded(
// //              flex: 5,
//                 child: ItemGrid(lstFeatureds[i]),
//               ),
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               Expanded(
// //              flex: 5,
//                 child: ItemGrid(lstFeatureds[i+1]),
//               ),
//             ],
//           ),
//       ]),
//        ));
//     }
//
//     return widgetlist;
//   }
}
