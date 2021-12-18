import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrderRepository orderRepository;
  OrdersBloc({required this.orderRepository}) : super(OrdersInitial());

  @override
  Stream<OrdersState> mapEventToState(
    OrdersEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is CreateOrderEvent) {
      // try {
        yield OrderPenddingState();
              Object paypalRequest=await orderRepository.createOrder(event.payment, event.currency, event.comment, event.shipping);
            print("create order success");
            yield OrderCreatesuccessState(payment:event.payment,paypalRequest:paypalRequest);
      // }catch (error) {
      //   yield OrderErrorState(error: error.toString());
      // }
    }
  }
}
