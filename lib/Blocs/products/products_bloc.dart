import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:amigatoy/Blocs/products/products.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';


class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productRepository;
//  StreamSubscription _carouselSubscription;

  ProductsBloc({required this.productRepository}):super(ProductsEmptyState());


  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if(event is ProductScreenLoadedEvent){
//      try {
        yield ProductsLoadingState();
        Product loadproduct=await productRepository.getProductbyid(event.productId);
        yield ProductsloadedState(product:loadproduct);
//      } catch (e) {
//        print(e);
//        yield ProductsErrorState();
//      }
    }
  }


}