import 'dart:async';
import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:amigatoy/Blocs/products/products.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productRepository;

//  StreamSubscription _carouselSubscription;
  ProductsBloc({required this.productRepository}) : super(ProductsEmptyState());
  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is ProductScreenLoadedEvent) {
      try {
        yield ProductsLoadingState();
        Product loadproduct =
            await productRepository.getProductbyid(event.productId);
        yield ProductsloadedState(product: loadproduct);
      } catch (error) {
        yield ProductsErrorState(error: error.toString());
      }
    } else if (event is FetchProductcatEvent) {
      try {
        yield ProductsLoadingState();
        List<Product> lproduct = await productRepository.loadProductlist(
            event.cateId, event.start, event.length);
        yield ProductlistloadedState(lproduct: lproduct);
      } catch (error) {
        yield ProductsErrorState(error: error.toString());
      }
    } else if (event is FetchMoreProductcatEvent) {
      try {
        List<Product> lproduct = await productRepository.loadProductlist(
            event.cateId, event.start, event.length);
        yield ProductlistloadedState(lproduct: lproduct);
      } catch (error) {
        yield ProductsErrorState(error: error.toString());
      }
    } else if (event is ScreenLoadedrandEvent) {
      //load rand product
      try {
        yield ProductsLoadingState();
        List<Product?> loadproduct =
            await productRepository.loadProductlistbyrand(event.randnum);
        yield RandProductsLoadedState(loadproduct: loadproduct);
      } catch (error,stack) {
        print(error.toString());
        print(stack.toString());
        // _debugReportException(ErrorDescription('building $this'), e, stack)
        yield ProductsErrorState(error: error.toString());
      }
    }
  }
}
