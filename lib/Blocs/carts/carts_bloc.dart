import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';
part 'carts_event.dart';
part 'carts_state.dart';

class CartsBloc extends Bloc<CartsEvent, CartsState> {
  final CartRepository cartRepository;
  CartsBloc({required this.cartRepository}) : super(CartsInitialState());

  @override
  Stream<CartsState> mapEventToState(
    CartsEvent event,
  ) async* {
    if (event is AddToCartEvent) {
      try {
        int cartQuantity = await cartRepository.addCart(
            event.productId, event.quantity, event.args);
        if (cartQuantity > 0) {
          yield CartsAddsuccessState(cartQuantity: cartQuantity);
        } else {
          yield CartsErrorState(error: "unknow error happened");
        }
      } catch (error) {
        yield CartsErrorState(error: error.toString());
      }
    } else if (event is queryCartquantityEvent) {
      try {
        int quantity = await cartRepository.getCartquantity();
        yield CartsQuantitygetsuccessState(cartQuantity: quantity);
      } catch (error,stacktrace) {
        yield CartsErrorState(error: 'Exception: '+error.toString()+'Stacktrace: ' + stacktrace.toString());
      }
    } else if (event is queryCartcontentEvent) {
      try {
        CartInfo cartInfo= await cartRepository.getCartcontent();

        yield CartlistsuccessState(
            cartList: cartInfo.cartlist,
            cartTotal:cartInfo.carttotal,
          shippingMelist: cartInfo.shippingMethod
        );
      } catch (error, stacktrace) {
        yield CartsErrorState(error: 'Exception: '+error.toString()+'Stacktrace: ' + stacktrace.toString());
      }
    } else if (event is updateCartquantityEvent) {
      try {
        await cartRepository.updateCartquanity(
            event.cartId, event.quantity);
        CartInfo cartinfo = await cartRepository.getCartcontent();
        yield CartRefreshingState();
        yield CartlistsuccessState(
            cartList: cartinfo.cartlist,
            cartTotal: cartinfo.carttotal,
          shippingMelist: cartinfo.shippingMethod
        );
      } catch (error,stacktrace) {
        yield CartsErrorState(error: 'Exception: '+error.toString()+'Stacktrace: ' + stacktrace.toString());
      }
    }else if (event is deleteCartEvent) {
      try {
        await cartRepository.deleteCart(event.cartId);
        CartInfo cartInfo = await cartRepository.getCartcontent();

        yield CartRefreshingState();
        yield CartlistsuccessState(
            cartList: cartInfo.cartlist,
            cartTotal: cartInfo.carttotal,
            shippingMelist:cartInfo.shippingMethod);
      } on Exception catch (error,stacktrace) {

        yield CartsErrorState(error: 'Exception: '+error.toString()+'Stacktrace: ' + stacktrace.toString());
      }

    }
    // TODO: implement mapEventToState
  }
}
