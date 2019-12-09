import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/CategoryDetail.dart';
/// Popular Keyword Item class
class SubCategory extends StatelessWidget {
  @override
  String title;
  int id;

  SubCategory({this.title,this.id});

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:4.0,left: 3.0),
          child: Container(
            height: 21,
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
              child:InkWell(
                onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => new categoryDetail(id, title: title)));
                  },
                  child:Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black54, fontFamily: "Sans"),
                  ),
              )
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15.0)),
      ],
    );
  }
}