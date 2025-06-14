import 'package:flutter/material.dart';
import 'package:amigatoy/ListItem/Product.dart';
//import 'package:amigatoy/Services/CRUDModel.dart';
import 'package:amigatoy/UI/HomeUIComponent/productCard.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<Product> products;

  @override
  Widget build(BuildContext context) {
//    final productProvider = Provider.of<CRUDModel>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addProduct');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(child: Text('Test add product')),
      ),
      body: Container(
//        child: StreamBuilder(
//            stream: productProvider.fetchProductsAsStream(),
//            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//              if (snapshot.hasData) {
//                print(snapshot.data.documents);
//                products = snapshot.data.documents
//                    .map((doc) => Product.fromMap(doc.data, doc.documentID))
//                    .toList();
//                return ListView.builder(
//                  itemCount: products.length,
//                  itemBuilder: (buildContext, index) =>
//                      ProductCard(productDetails: products[index]),
//                );
//              } else {
//
//                return Text('fetching');
//              }
//            }),
      ),
    );
    ;
  }
}