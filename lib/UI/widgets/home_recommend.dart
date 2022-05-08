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
  bool _isLoading =true;
  late double _containHeight;
  // double itemHeight =0;
  // double itemWidth =0;
  int _startPage=0;
  int _pageLength=25;
  double _productlistheight=0;

  ///get feature product list
  // List<ItemGrid> _listFeaturegrid(){
  //   List<ItemGrid> resGrid=[];
  //   _lproduct.forEach((value) {
  //     if(value!=null){
  //     resGrid.add(ItemGrid(value));
  //     }
  //   });
  //   return resGrid;
  // }

  // Future<void> _loadMore() async {
  //   _startPage=_startPage+_pageLength;
  //   BlocProvider.of<FeaturedsBloc>(context)
  //       .add(FeaturedloadMore(start:_startPage,length: _pageLength));
  //   // return true;
  // }

  //feature list widget
  Widget _listFeatureProduct(){
    return BlocBuilder<FeaturedsBloc, FeaturedState>(builder: (context, state) {
      if (state is FeaturedLoading) {
        // is loading
        return Center(child: CircularProgressIndicator());
      }else if(state is Featuredloaded) {
        _productlistheight=((_lproduct.length/2).ceil()*310);
        if(_lproduct.length<state.lstFeatureds.totalNum){
          _productlistheight+=77;
        }
          return Container(
            height: _productlistheight,
            // child: RefreshIndicator(
            //   onRefresh:() async {
            //     _startPage=_startPage+_pageLength;
            //     BlocProvider.of<FeaturedsBloc>(context)
            //         .add(FeaturedloadMore(start:_startPage,length: _pageLength));
            //   },
            //   triggerMode: RefreshIndicatorTriggerMode.anywhere,
              child: Column(
                children:[
                  GridView.builder(
                    shrinkWrap: true,
                  itemCount: _lproduct.length,
                  physics: ScrollPhysics(),
                  //physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  // physics:const AlwaysScrollableScrollPhysics(),
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
                _isLoading?const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 1.5,
                    )):Container(),
                _lproduct.length<state.lstFeatureds.totalNum?ElevatedButton(
                    child: Text(
                        "Load More",
                        style: TextStyle(fontSize: 14)
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                                side: BorderSide(color: Colors.red)
                            )
                        )
                    ),
                    onPressed: () async {
                          _startPage=_startPage+_pageLength;
                          BlocProvider.of<FeaturedsBloc>(context)
                              .add(FeaturedloadMore(start:_startPage,length: _pageLength));
                          _isLoading = true;
                    })
          :Container(),
                ]
              ),
           // ),
          );
      }
      return Container();
    });
  }
  @override
  Widget build(BuildContext context){
    MediaQueryData mediaQueryData = MediaQuery.of(context);
     _containHeight=mediaQueryData.size.height;

    //var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
   //itemHeight = (size.height - kToolbarHeight - 24) / 1.6;
   //itemWidth = size.width / 2;

    return MultiBlocProvider(providers: [
      BlocProvider<FeaturedsBloc>(
        create: (context) {
          return FeaturedsBloc(
            featuredRepository: FeaturedRepository(),
          )..add(FetchFeatureds(start:_startPage,length: _pageLength));
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
                        _isLoading = false;
                      });

                    }
                  }),
            ],
            child:_listFeatureProduct(),
    ));

  }

}
