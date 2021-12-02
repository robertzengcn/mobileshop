import 'dart:async';

import 'package:amigatoy/Models/Invoice.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';

part 'paypal_event.dart';
part 'paypal_state.dart';

class PaypalBloc extends Bloc<PaypalEvent, PaypalState> {
  final PaypalServices services = PaypalServices();
  PaypalBloc() : super(PaypalInitial());

  @override
  Stream<PaypalState> mapEventToState(
    PaypalEvent event,
  ) async* {
    if (event is createPayment) {
      yield PaypalpenddingState();

        // try {
          String accessToken = await services.getAccessToken();

          final res = await services.createPaypalPayment(event.invoice, accessToken);

          yield PaypalcreatesuccessState(checkoutUrl:res["approvalUrl"]!,executeUrl:res["executeUrl"]!,accessToken:accessToken);

        // } catch (e) {
        //
        // }

    }else if(event is executePayment){
      yield PaypalpenddingState();
      String paymentId=await services.executePayment(event.url,event.payerId,event.accessToken);
      yield PaypalFinishState(paymentId: paymentId);
    }
  }
}
