import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:treva_shop_flutter/blocs/products/products.dart';
import 'package:products_repository/products_repository.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;
  StreamSubscription _productsSubscription;

  ProductsBloc({@required ProductsRepository productsRepository})
      : assert(productsRepository != null),
        _productsRepository = productsRepository;
  @override
  ProductsState get initialState => ProductsLoading();

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is LoadProducts) {
      yield* _mapLoadTodosToState();
    }
  }

  Stream<ProductsState> _mapLoadTodosToState() async* {
    _productsSubscription?.cancel();
    _productsSubscription = _productsRepository.products().listen(
          (products) => add(ProductsUpdated(products)),
    );
  }

}