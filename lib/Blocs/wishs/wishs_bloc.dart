import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';

part 'wishs_event.dart';
part 'wishs_state.dart';

class WishsBloc extends Bloc<WishsEvent, WishsState> {
  final WishRepository wishRepository;
  WishsBloc({required this.wishRepository}) : super(WishsInitial());


  @override
  Stream<WishsState> mapEventToState(
    WishsEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is AddWishsEvent){
      try{
      int wishQuantity=await wishRepository.addWish(event.product_id);
      yield WishAddsuccessState(wishQuantity:wishQuantity);
      } catch (error) {
        yield WishErrorState(error: error.toString());
      }
    }else if(event is CheckWishsEvent){
      bool inWish=await wishRepository.checkWish(event.product_id);
      yield WishChecksuccessState(inWishlist:inWish);
    }
  }
}
