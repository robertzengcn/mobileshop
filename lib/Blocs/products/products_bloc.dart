import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:amigatoy/Blocs/products/products.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';


class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository _productRepository;
//  StreamSubscription _carouselSubscription;

  ProductsBloc({@required ProductRepository productRepository})
      : assert(productRepository != null),
        _productRepository = productRepository;
  @override
  ProductsState get initialState => ProductsEmpty();

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is FetchProducts) {
      yield ProductsLoading();
      try {
        List<Product> result = await _productRepository.fetchProducttype(event.type);
        print(result);
        yield Productsloaded(lstProduct:result);

      } catch (_) {
        yield ProductsError();
      }
    }
  }

//  Stream<CarouselsState> _mapLoadImagesToState() async* {
//    _carouselSubscription?.cancel();
//    _imagesliderSubscription = _imageslidersRepository.imagesliders().listen(
//          (imgsliders) => add(ImagesliderUpdated(imgsliders)),
//    );
//  }

}