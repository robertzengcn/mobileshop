import 'package:amigatoy/Blocs/search/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';
// import 'package:amigatoy/UI/HomeUIComponent/SearchResult.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/UI/widgets/item_grid.dart';

class SearchResult extends StatefulWidget {
  final String searchKey;
  const SearchResult ({ Key? key, required this.searchKey }): super(key: key);
  @override
  _searchResultState createState() => _searchResultState();
}

class _searchResultState extends State<SearchResult> {
  List<Product?> _lproduct=[];
  int _startPage=0;
  int _pageLength=25;
  int _total=0;
  @override
  /// Item Favorite Item with Card item
  Widget _searchResult() {
    if(_total>0){
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          height: 250.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Result:",
                  style: TextStyle(fontFamily: "Gotik", color: Colors.black26),
                ),
              ),
              Expanded(
                child: Container(
                  height: (_lproduct.length/2).ceil()*300,
                  child: RefreshIndicator(
                    onRefresh:() async {
                      _startPage=_startPage+_pageLength;
                      BlocProvider.of<SearchBloc>(context)
                          .add(SearchstartEvent(serarchterm: widget.searchKey,page:_startPage,num: _pageLength));
                    },
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
                ),
              ),
            ],
          ),
        ),
      );
    }else{

      return Container(child: Center(
          child: Text("sorry, we not find any result",
            textAlign: TextAlign.center,
          )
      ),);
    }

  }
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(create: (context) {
          return SearchBloc(searchRepository: SearchRepository())..add(SearchstartEvent(serarchterm: widget.searchKey,page:0,num:25));
        }),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<SearchBloc, SearchState>(
              listener: (context, state) {
                if(state is Searchfinishstate){
                  _total=state.num;
                  _lproduct.addAll(state.lps);
                }
              }),
        ],
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xFF6991C7),
            ),
            title: Text(
              "Search Result",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.black54,
                  fontFamily: "Gotik"),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              
              return SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[



                        if(state is Searchingstate)Center(child: CircularProgressIndicator()),

                          if(state is Searchfinishstate)
                            _searchResult(),


                        Padding(padding: EdgeInsets.only(
                            bottom: 30.0, top: 2.0))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


///Favorite Item Card
class FavoriteItem extends StatelessWidget {
  String image, Rating, Salary, title, sale;

  FavoriteItem({required this.image,
    required this.Rating,
    required this.Salary,
    required this.title,
    required this.sale});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF656565).withOpacity(0.15),
                blurRadius: 4.0,
                spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
              )
            ]),
        child: Wrap(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 120.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.0),
                          topRight: Radius.circular(7.0)),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.black54,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    Salary,
                    style: TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            Rating,
                            style: TextStyle(
                                fontFamily: "Sans",
                                color: Colors.black26,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14.0,
                          )
                        ],
                      ),
                      Text(
                        sale,
                        style: TextStyle(
                            fontFamily: "Sans",
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
