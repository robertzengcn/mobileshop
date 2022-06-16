import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';
part 'rand_product_event.dart';
part 'rand_product_state.dart';

class RandProductBloc extends Bloc<RandProductEvent, RandProductState> {
  final ProductRepository productRepository;

  RandProductBloc({required this.productRepository}) : super(RandProductInitial());
  @override
  Stream<RandProductState> mapEventToState(RandProductEvent event) async* {
    if(event is ScreenLoadedEvent){
//      try {
      yield RandProductsLoadingState();
      List<Product?> loadproduct=await productRepository.loadProductlistbyrand(event.randnum);
      yield RandProductsLoadedState(loadproduct:loadproduct);
    }
  }
}
