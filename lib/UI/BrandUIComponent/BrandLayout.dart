import 'package:flutter/material.dart';
// import 'package:amigatoy/UI/BrandUIComponent/BrandDetail.dart';
// import 'package:amigatoy/ListItem/BrandDataList.dart';
import 'package:amigatoy/Models/Categories.dart';
import 'package:amigatoy/UI/HomeUIComponent/Search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';

class brand extends StatefulWidget {
  final int? parentcategoriesId;

  brand({ Key? key, this.parentcategoriesId }) : super(key: key);

  @override
  _brandState createState() => _brandState();
}

class _brandState extends State<brand> {
  List<Categories?> lcategories=[];

  @override
  Widget build(BuildContext context) {
    int parentId=0;
    if(widget.parentcategoriesId!=null){
      parentId=widget.parentcategoriesId!;
    }

    /// Component appbar
    var _appbar = AppBar(
      backgroundColor: Color(0xFFFFFFFF),
      elevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
          "Category",
          style: TextStyle(
              fontFamily: "Gotik",
              fontSize: 20.0,
              color: Colors.black54,
              fontWeight: FontWeight.w700),
        ),
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (_, __, ___) => new searchAppbar()));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.search,
              size: 27.0,
              color: Colors.black54,
            ),
          ),
        )
      ],
    );

    Widget _mainCatelist=Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Scaffold(
        /// Calling variable appbar
          appBar: _appbar,
          body: Container(
            color: Colors.white,
            child: CustomScrollView(
              /// Create List Menu
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.only(top: 0.0),
                  sliver: SliverFixedExtentList(
                      itemExtent: 145.0,
                      delegate: SliverChildBuilderDelegate(
                        /// Calling itemCard Class for constructor card
                              (context, index) => itemCard(lcategories[index]!),
                          childCount: lcategories.length)),
                ),
              ],
            ),
          )),
    );

    return MultiBlocProvider(
        providers: [
          BlocProvider<CategoriesBloc>(create: (context) {
            return CategoriesBloc(categoriesRepository: CategoriesRepository())..add(ListcategoriesEvent(parentId: parentId));
          }),

        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<CategoriesBloc, CategoriesState>(
                listener: (context, state) {
                  if(state is Categorieslistfetched){

                    // if(state.orderlst.length>0){
                    setState(() {
                      lcategories.addAll(state.listcategories);

                    });

                    // if(!_initPage){
                    //   _scrollDown();
                    // }
                    // state.orderlst.forEach((value){
                    //   if(value!=null){
                    //     lorder.add(value);
                    //   }
                    // });
                    // }
                    // setState(() {
                    //   isLoading = false;
                    // });
                    // print(isLoading);
                  }
                }),
          ],
          child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context,catestate) {
              if(catestate is Categorieslistfetched){
                return _mainCatelist;
              }else{
                return Container();
              }

            }
          ),
        ));
  }
}

/// Constructor for itemCard for List Menu
class itemCard extends StatelessWidget {
  /// Declaration and Get data from BrandDataList.dart
  final Categories categories;
  itemCard(this.categories);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
          if(categories.hasChild){
            print(categories.parentId);
            Navigator.of(context).push(
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new brand(parentcategoriesId:categories.categoriesId),
                  transitionDuration: Duration(milliseconds: 600),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: child,
                    );
                  }),
            );
          }else{

          }
          // Navigator.of(context).push(
          //   PageRouteBuilder(
          //       pageBuilder: (_, __, ___) => new brandDetail(brand),
          //       transitionDuration: Duration(milliseconds: 600),
          //       transitionsBuilder:
          //           (_, Animation<double> animation, __, Widget child) {
          //         return Opacity(
          //           opacity: animation.value,
          //           child: child,
          //         );
          //       }),
          // );
        },
        child: Container(
          height: 130.0,
          width: 400.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Hero(
            tag: 'hero-tag-${categories.categoriesId}',
            child: Material(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image:NetworkImage(categories.categoriesImageUrl,),
                    fit: BoxFit.contain,

                )),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.black12.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text(
                      categories.categoriesName,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Berlin",
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
