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
      var data = await orderRepository.createOrder(
          event.payment, event.currency, event.comment, event.shipping);
      // print("create order success");
      switch (event.payment) {
        case 'paypal':
        default:
          if (data['approveurl'] != null) {

            yield OrderPaypalwaitingState(paypalUrl: data['approveurl'],returnUrl: data['returnurl'],cancelUrl: data['cancelurl'],orderId: data['orderId']);
          } else {
            yield OrderErrorState(error: "create paypal payment link failure");
          }
          break;
      }
    }

    // yield OrderCreatesuccessState(payment:event.payment,paypalRequest:paypalRequest);
    // }catch (error) {
    //   yield OrderErrorState(error: error.toString());
    // }
  }
}
