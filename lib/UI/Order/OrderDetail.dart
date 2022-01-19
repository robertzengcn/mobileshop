// import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:amigatoy/Arguments/PaySuccessArguments.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/UI/widgets/order_list.dart';
// import 'package:flutter/scheduler.dart';

class OrderDetail extends StatefulWidget {
  static const routeName = '/orderdetail';

  @override
  _orderlistState createState() => _orderdetailState();
}

class _orderdetailState extends State<OrderDetail> {
  List<Order?> lorder=[];
  int _startPage=0;
  bool isLoading = false;
  int _pageLength=5;
  bool _initPage=true;//first time load page


  // final ScrollController _controller = ScrollController();

  // OrderRepository orderRepository=new OrderRepository();

  void initState() {
    super.initState();
    // if(!_initPage){
    // WidgetsBinding.instance
    //     ?.addPostFrameCallback((_) => _scrollDown());
  // }
  }

  // void _scrollDown() async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   SchedulerBinding.instance?.addPostFrameCallback((_) {
  //     _controller.animateTo(
  //         _controller.position.maxScrollExtent,
  //         duration: const Duration(milliseconds: 400),
  //         curve: Curves.fastOutSlowIn);
  //   });
  //   // _controller.jumpTo(_controller.position.maxScrollExtent);
  // }
  _loadMore()async{

    _startPage=_startPage+_pageLength;
    ListOrder lorders=await orderRepository.featchOrderlist(_startPage, _pageLength);
    setState(() {
      lorder.addAll(lorders.lorder);
      isLoading = false;
    });
  }


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
                        if(orderstate is OrderPenddingState){
                          return Center(child: CircularProgressIndicator());
                        }else if(orderstate is OrderlistFeatchedState){
                          if(orderstate.totolNum>0){
                              return Column(
                                children: <Widget>[
                                  Expanded(
                                    child: NotificationListener<ScrollNotification>(
                                      onNotification: (ScrollNotification scrollInfo) {
                                        if (!isLoading && scrollInfo.metrics.pixels ==
                                            scrollInfo.metrics.maxScrollExtent&&(_startPage<=orderstate.totolNum)) {

                                          // start loading data
                                          // setState(() {
                                           isLoading=true;
                                           _initPage=false;
                                            _loadMore();


                                            // List<Order?> lorders=await orderRepository.featchOrderlist(_startPage, _pageLength);
                                          // });
                                          // });

                                          // BlocProvider.of<OrdersBloc>(context)
                                          //     .add(FeatchOrderlistEvent(start:_startPage,length: _pageLength));
                                          // BlocProvider<OrdersBloc>(create: (context) {
                                          //   return OrdersBloc(orderRepository: OrderRepository())..add(FeatchOrderlistEvent(start:startPage,length: pageLength));
                                          // });

                                        }
                                        return false;
                                      },
                                      child: orderListWidget(lorder),
                                    ),
                                  ),
                                  // Container(
                                  //   height: !isLoading&&(_startPage<=orderstate.totolNum) ? 50.0 : 0,
                                  //   color: Colors.transparent,
                                  //   child: Text(
                                  //     "pull to get more",
                                  //     maxLines: 1,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     style: const TextStyle(
                                  //       fontWeight: FontWeight.w500,
                                  //       fontSize: 14.0,
                                  //     ),
                                  //   ),
                                  // ),
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
                            return Container(child: Text(
                              "No order found",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ));
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
            return OrdersBloc(orderRepository: OrderRepository())..add(FeatchOrderlistEvent(start:_startPage,length: _pageLength));
          }),

        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<OrdersBloc, OrdersState>(
                  listener: (context, state) {
                    if(state is OrderlistFeatchedState){
                      // if(state.orderlst.length>0){
                      setState(() {
                        lorder.addAll(state.orderlst);
                        isLoading = false;
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
            child: _orderlistScaffold(),
        ));
  }
}

