import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';


class SpecialsBloc extends Bloc<SpecialsEvent, SpecialsState> {
late ProductRepository _productRepository;

  SpecialsBloc({required FeaturedRepository featuredRepository}): super(SpecialsEmpty()){
    _productRepository=ProductRepository();
  }
  @override
  SpecialsState get initialState => SpecialsEmpty();

  @override
  Stream<SpecialsState> mapEventToState(SpecialsEvent event) async* {
    if (event is FetchSpecials) {
      yield SpecialsLoading();

        List<Product> result = await _productRepository.loadspecialProductlist(0,10);

        yield Specialsloaded(lstSpecials:result);

    }
  }



}