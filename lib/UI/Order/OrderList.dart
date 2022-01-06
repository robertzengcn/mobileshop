// import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:amigatoy/Arguments/PaySuccessArguments.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/UI/widgets/order_list.dart';

class OrderList extends StatefulWidget {
  static const routeName = '/orderlist';

  @override
  _orderlistState createState() => _orderlistState();
}

class _orderlistState extends State<OrderList> {
  List<Order> lorder=[];
  int startPage=0;
  bool isLoading = false;
  int pageLength=25;


  Widget _orderlistScaffold(){
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      /// Appbar
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: Icon(Icons.arrow_back)),
        elevation: 0.0,
        title: Text(
          "Order List",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
              color: Colors.black54,
              fontFamily: "Gotik"),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF6991C7)),
      ),
      body:
    // Container(
        // child: SingleChildScrollView(
        //   child:
          Container(
            height:_screenHeight,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child:
              // Column(

                // children: <Widget>[
                  /// For RadioButton if selected or not selected

                  // Divider(
                  //   height: 1.0,
                  //   color: Colors.black26,
                  // ),

                  BlocBuilder<OrdersBloc, OrdersState>(
                      builder: (context, orderstate) {
                        if(orderstate is OrderPenddingState&&(lorder.length==0)){
                          return Center(child: CircularProgressIndicator());
                        }else if(orderstate is OrderlistFeatchedState){
                          if(lorder.length>0){
                              return Column(
                                children: <Widget>[
                                  Expanded(
                                    child: NotificationListener<ScrollNotification>(
                                      onNotification: (ScrollNotification scrollInfo) {
                                        if (!isLoading && scrollInfo.metrics.pixels ==
                                            scrollInfo.metrics.maxScrollExtent) {
                                          print("80");
                                          // start loading data

                                            startPage=startPage+pageLength;
                                          // });
                                          BlocProvider.of<OrdersBloc>(context)
                                              .add(FeatchOrderlistEvent(start:startPage,length: pageLength));
                                          // BlocProvider<OrdersBloc>(create: (context) {
                                          //   return OrdersBloc(orderRepository: OrderRepository())..add(FeatchOrderlistEvent(start:startPage,length: pageLength));
                                          // });

                                        }
                                        return false;
                                      },
                                      child: orderListWidget(lorder),
                                    ),
                                  ),
                                  Container(
                                    height: isLoading ? 50.0 : 0,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: new CircularProgressIndicator(),
                                    ),
                                  ),
                                ],
                              );
                          }else{

                          }
                        }
                          return Container();
                      }
                  ),
                // ],
              // ),
            ),
          ),
        // ),
      // ),
    );
  }

  Widget build(BuildContext context) {


    return MultiBlocProvider(
        providers: [
          BlocProvider<OrdersBloc>(create: (context) {
            return OrdersBloc(orderRepository: OrderRepository())..add(FeatchOrderlistEvent(start:0,length: 25));
          }),

        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<OrdersBloc, OrdersState>(
                  listener: (context, state) {
                    if(state is OrderlistFeatchedState){
                      if(state.orderlst.length>0){
                        state.orderlst.forEach((value){
                          if(value!=null){
                            lorder.add(value);
                          }
                        });
                      }
                      setState(() {
                        isLoading = false;
                      });
                      // print(isLoading);
                    }
                  }),
            ],
            child: _orderlistScaffold(),
        ));
  }
}

