import 'package:amigatoy/Blocs/search/search_bloc.dart';
import 'package:amigatoy/UI/HomeUIComponent/SearchResult.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';

class searchAppbar extends StatefulWidget {
  @override
  _searchAppbarState createState() => _searchAppbarState();
}

class _searchAppbarState extends State<searchAppbar> {
  List<String?> _serarchterm=[];
  final TextEditingController _searchcontroller = TextEditingController();
  @override
  /// Sentence Text header "Hello i am Treva.........."
  var _textHello = Padding(
    padding: const EdgeInsets.only(right: 50.0, left: 20.0),
    child: Text(
      "Hello, you are shopping at Amiga Toy. What would you like to search ?",
      style: TextStyle(
          letterSpacing: 0.1,
          fontWeight: FontWeight.w600,
          fontSize: 27.0,
          color: Colors.black54,
          fontFamily: "Gotik"),
    ),
  );

  /// Item TextFromField Search
  Widget _searchWidget () {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0, right: 20.0, left: 20.0),
      child:
      Container(
        height: 50.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15.0,
                  spreadRadius: 0.0)
            ]),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Theme(
              data: ThemeData(hintColor: Colors.transparent),
              child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: TextFormField(
                        controller: _searchcontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.search,
                              color: Color(0xFF6991C7),
                              size: 28.0,
                            ),
                            hintText: "Find you want",
                            hintStyle: TextStyle(
                                color: Colors.black54,
                                fontFamily: "Gotik",
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                            if(_searchcontroller.text!=null&&_searchcontroller.text.length>0){
                              // BlocProvider.of<SearchBloc>(context).add(
                              //     SearchstartEvent(
                              //         serarchterm:_searchcontroller.text,
                              //       num:25,
                              //       page: 0
                              //     ));
                              Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => new SearchResult(searchKey: _searchcontroller.text)));
                            }
                        },
                        child: const Text('Search'),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),

    );
  }
  /// Item Favorite Item with Card item
  var _favorite = Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Container(
      height: 250.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Favorite",
              style: TextStyle(fontFamily: "Gotik", color: Colors.black26),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 20.0, bottom: 2.0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[

                /// Get class FavoriteItem
                Padding(padding: EdgeInsets.only(left: 20.0)),
                FavoriteItem(
                  image: "assets/imgItem/shoes1.jpg",
                  title: "Firrona Skirt!",
                  Salary: "\$ 10",
                  Rating: "4.8",
                  sale: "923 Sale",
                ),
                Padding(padding: EdgeInsets.only(left: 20.0)),
                FavoriteItem(
                  image: "assets/imgItem/acesoris1.jpg",
                  title: "Arpenaz 4",
                  Salary: "\$ 200",
                  Rating: "4.2",
                  sale: "892 Sale",
                ),
                Padding(padding: EdgeInsets.only(left: 20.0)),
                FavoriteItem(
                  image: "assets/imgItem/kids1.jpg",
                  title: "Mon Cheri Pingun",
                  Salary: "\$ 3",
                  Rating: "4.8",
                  sale: "110 Sale",
                ),
                Padding(padding: EdgeInsets.only(right: 10.0)),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  /// Popular Keyword Item
  Widget _sugestedText(List<String?> _serarchterm) {
    List<Widget> list = [];
    // list.add(Padding(padding: EdgeInsets.only(left: 20.0)));
    List<Widget> childList = [];
    for(var i = 0; i < _serarchterm.length; i++) {
      if (_serarchterm[i] != null) {
        childList.add(
          KeywordItem(
            title: _serarchterm[i]!,
          ),
        );
      }
    }
    list.add(Wrap(
        runSpacing: 5.0,
        spacing: 5.0,
         direction: Axis.horizontal,
        children: childList
    ));
    return Container(
      height: 145.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              "Populer Keyword",
              style: TextStyle(fontFamily: "Gotik", color: Colors.black26),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: list,
              ))
        ],
      ),
    );
  }
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(create: (context) {
          return SearchBloc(searchRepository: SearchRepository())..add(SearchinitEvent());
        }),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<SearchBloc, SearchState>(
              listener: (context, state) {
                if(state is SearchTermreadystate){
                  _serarchterm.addAll(state.searchTerms);
                }
              }),
        ],
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xFF6991C7),
            ),
            title: Text(
              "Search",
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

                        /// Caliing a variable
                        _textHello,
                        _searchWidget(),
                        (state is SearchTermreadystate)?
                        _sugestedText(_serarchterm):Container(),
                        
                        _favorite,
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

/// Popular Keyword Item class
class KeywordItem extends StatelessWidget {
  @override
  String title;

  KeywordItem({required this.title});

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 3.0),
          child: Container(
            height: 29.5,
            // width: 90.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4.5,
                  spreadRadius: 1.0,
                )
              ],
            ),
            child: Center(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black54, fontFamily: "Sans"),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
      ],
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
