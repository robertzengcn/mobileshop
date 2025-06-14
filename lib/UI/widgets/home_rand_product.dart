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

class HomeRandproduct extends StatefulWidget {
  @override
  HomeRandproductstate createState() => HomeRandproductstate();
}

class HomeRandproductstate extends State<HomeRandproduct> {
  List<Product?> _lproduct=[];
  bool _isLoading =true;
 // late double _containHeight;
  // double itemHeight =0;
  // double itemWidth =0;

  // int _pageLength=24;
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

  ///rand product list widget
  Widget _listRandProduct(){
    return BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
      if (state is ProductsLoadingState) {
        // is loading
        return Center(child: CircularProgressIndicator());
      }else if(state is RandProductsLoadedState) {
        _productlistheight=((_lproduct.length/2).ceil()*298);
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
     // _containHeight=mediaQueryData.size.height;
    return MultiBlocProvider(providers: [
      BlocProvider<ProductsBloc>(
        create: (context) {
          return ProductsBloc(
            productRepository: ProductRepository(),
          )..add(ScreenLoadedrandEvent(randnum: 24));
        },
      ),
    ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<ProductsBloc, ProductsState>(
                  listener: (context, state) {
                    if(state is RandProductsLoadedState){
                      // if(state.orderlst.length>0){
                      setState(() {
                        _lproduct.addAll(state.loadproduct);
                        _isLoading = false;
                      });

                    }
                  }),
            ],
            child:_listRandProduct(),
    ));

  }

}
