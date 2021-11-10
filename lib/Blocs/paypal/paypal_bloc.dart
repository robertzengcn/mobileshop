import 'dart:async';

import 'package:amigatoy/Models/Invoice.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';

part 'paypal_event.dart';
part 'paypal_state.dart';

class PaypalBloc extends Bloc<PaypalEvent, PaypalState> {
  PaypalBloc() : super(PaypalInitial());

  @override
  Stream<PaypalState> mapEventToState(
    PaypalEvent event,
  ) async* {
    if (event is createPayment) {
      PaypalServices services = PaypalServices();
      // Future.delayed(Duration.zero, () async* {
        try {
          String accessToken = await services.getAccessToken();

          final res = await services.createPaypalPayment(event.invoice, accessToken);


          yield Paypalcreatesuccess(checkoutUrl:res["approvalUrl"]!,executeUrl:res["executeUrl"]!);

        } catch (e) {

        }
      // });
    }
    // TODO: implement mapEventToState
  }
}
