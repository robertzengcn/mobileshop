// import 'dart:async';
import 'package:flutter/material.dart';

// import 'package:amigatoy/Arguments/PaySuccessArguments.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/UI/widgets/order_detail.dart';

// import 'package:amigatoy/UI/widgets/order_list.dart';
// import 'package:flutter/scheduler.dart';

class OrderDetailPage extends StatefulWidget {
  static const routeName = '/orderdetail';
  final int orderId;

  OrderDetailPage({ Key? key, required this.orderId }) : super(key: key);

  @override
  _orderdetailState createState() => _orderdetailState();
}

class _orderdetailState extends State<OrderDetailPage> {

  void initState() {
    super.initState();
  }

  Widget _orderlistScaffold() {
    return Scaffold(

      /// Appbar
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: Icon(Icons.arrow_back)),
        elevation: 0.0,
        title: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
          if (state is OrderdetailFeatchedState) {
            return Text(
              state.orderdetail.orderinfo.ordersStatusName,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.black54,
                  fontFamily: "Gotik"),
            );
          }else{
            return Text(
              "Order Detail",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.black54,
                  fontFamily: "Gotik"),
            );
          }
          }
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF6991C7)),
      ),
      body: Container(

        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: BlocBuilder<OrdersBloc, OrdersState>(
              builder: (context, orderstate) {
                if (orderstate is OrderPenddingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (orderstate is OrderdetailFeatchedState) {
                  return SingleChildScrollView(
                      child: Column(
                          children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                            child:Container(
                              // color: Colors.white,
                              child: CustomOrderDetail(
                                  orderId:orderstate.orderdetail.orderinfo.ordersId,
                                  ordersStatusName:orderstate.orderdetail.orderinfo.ordersStatusName,
                                  lproduct:orderstate.orderdetail.orderProduct,
                                  orderTotal: orderstate.orderdetail.orderinfo.orderTotal.toString(),
                                  shippingText: orderstate.orderdetail.orderinfo.shipingText,
                                subTotaltext: orderstate.orderdetail.orderinfo.subtotalText,
                                datePurchased: orderstate.orderdetail.orderinfo.datePurchasedtime,
                                orderBill: orderstate.orderdetail.orderBill,
                              ),
                            )
                      ),
                          ]
                      ));
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
            return OrdersBloc(orderRepository: OrderRepository())
              ..add(FeatchOrderDetailEvent(orderId: widget.orderId));
          }),

        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<OrdersBloc, OrdersState>(
                listener: (context, state) {
                  if (state is OrderlistFeatchedState) {
                    // if(state.orderlst.length>0){
                  }
                }),
          ],
          child: _orderlistScaffold(),
        ));
  }
}

