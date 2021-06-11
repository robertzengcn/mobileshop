import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:amigatoy/Blocs/products/products.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';


class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productRepository;
//  StreamSubscription _carouselSubscription;

  ProductsBloc({required this.productRepository}):super(ProductsEmpty());
//      : assert(productRepository != null),
//        _productRepository = productRepository;
//  @override
//  ProductsState get initialState => ProductsEmpty();

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is FetchProducttype) {
      yield ProductsLoading();
      try {
        List<Product> result = await productRepository.loadProductlist();
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