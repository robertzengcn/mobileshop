import 'package:flutter/material.dart';
import 'package:amigatoy/UI/CatelogueUIComponent/BrandLayout.dart';
import 'package:amigatoy/UI/CartUIComponent/CartLayout.dart';
import 'package:amigatoy/UI/HomeUIComponent/Home.dart';
import 'package:amigatoy/UI/AcountUIComponent/Profile.dart';

class bottomNavigationBar extends StatefulWidget {
  final int pageIndex;
  bottomNavigationBar ({ Key? key, required this.pageIndex }): super(key: key);
 @override
 _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
 int currentIndex = 0;
 //  late int currentIndex;
 /// Set a type current number a layout class
 Widget callPage(int current) {
  switch (current) {
   case 0:
    return new Home();
   case 1:
    return new brand();
   case 2:
    return new Cartpage();
   case 3:
    return new Profil();
    // break;
   default:
    return Home();
  }
 }

 /// Build BottomNavigationBar Widget
 @override
 Widget build(BuildContext context) {
   currentIndex=widget.pageIndex;
  return Scaffold(
   body: callPage(currentIndex),
   bottomNavigationBar: Theme(
       data: Theme.of(context).copyWith(
           canvasColor: Colors.white,
           textTheme: Theme.of(context).textTheme.copyWith(
               caption: TextStyle(color: Colors.black26.withOpacity(0.15)))),
       child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        fixedColor: Color(0xFF6991C7),
        onTap: (value) {
          print(value);
          // setState(() {
          //   currentIndex = value;
          // });
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => new bottomNavigationBar(pageIndex: value,)));

        },
        items: [
         BottomNavigationBarItem(
             icon: Icon(
              Icons.home,
              size: 23.0,
             ),
             label:"Home",
             // title: Text(
             //  "Home",
             //  style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
             // )
           ),
         BottomNavigationBarItem(
             icon: Icon(Icons.shop),
           label:"Brand",
             // title: Text(
             //  "Brand",
             //  style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
             // )
         ),
         BottomNavigationBarItem(
             icon: Icon(Icons.shopping_cart),
             label:"Cart",
             // title: Text(
             //  "Cart",
             //  style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
             // )
         ),
         BottomNavigationBarItem(
             icon: Icon(
              Icons.person,
              size: 24.0,
             ),
             label:"Acount",
             // title: Text(
             //  "Acount",
             //  style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
             // )
         ),
        ],
       )),
  );
 }
}
