import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';

part 'relative_product_event.dart';
part 'relative_product_state.dart';

class RelativeProductBloc extends Bloc<RelativeProductEvent, RelativeProductState> {
  late ProductRepository _productRepository;
  RelativeProductBloc({required ProductRepository productRepository}) : super(RelativeProductInitialState()){
    _productRepository=ProductRepository();
  }



  @override
  Stream<RelativeProductState> mapEventToState(
    RelativeProductEvent event,
  ) async* {
    if (event is FetchRelativeProductEvent) {
      yield RelativeProductloading();

      List<Product> result = await _productRepository.loadrelativeProductlist(
          event.productId);
      yield RelativeProductloadedState(lstRelative:result);
    }
    // TODO: implement mapEventToState
  }
}
