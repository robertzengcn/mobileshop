import 'dart:async';

// import 'package:amigatoy/Models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';
// import 'package:amigatoy/Repository/repository.dart';
part 'paypal_event.dart';
part 'paypal_state.dart';

class PaypalBloc extends Bloc<PaypalEvent, PaypalState> {
  final OrderRepository orderRepository;
  // OrdersBloc({required this.orderRepository}) : super(OrdersInitial());

  // final PaypalServices services = PaypalServices();
  PaypalBloc({required this.orderRepository}) : super(PaypalInitial());

  @override
  Stream<PaypalState> mapEventToState(
    PaypalEvent event,
  ) async* {
    if (event is createPayment) {
      yield PaypalCreateState();

        // try {
        //   String accessToken = await services.getAccessToken();

          // final res = await services.createPaypalPayment(event.paypalrequest, accessToken);

          // yield PaypalcreatesuccessState(checkoutUrl:res["approvalUrl"]!,executeUrl:res["executeUrl"]!,accessToken:accessToken);

        // } catch (e) {
        //
        // }

    }else if(event is successPayment){//paypal payment finish

      await orderRepository.checkOrderpayment(int.parse(event.orderId));
      yield PaypalFinishState(paymentId:event.paymentId,orderId:event.orderId);
      // yield PaypalpenddingState();
      // String paymentId=await services.executePayment(event.url,event.payerId,event.accessToken);
      // yield PaypalFinishState(paymentId: paymentId);
    }
  }
}
