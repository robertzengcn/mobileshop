import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:amigatoy/Blocs/carousels/carousels.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';


class CarouselsBloc extends Bloc<CarouselsEvent, CarouselsState> {
  final CarouselRepository _carouselRepository;

  CarouselsBloc({required CarouselRepository carouselsRepository})
      : assert(carouselsRepository != null),
        _carouselRepository = carouselsRepository;
  @override
  CarouselsState get initialState => CarouselsEmpty();

  @override
  Stream<CarouselsState> mapEventToState(CarouselsEvent event) async* {
    if (event is FetchCarousels) {
      yield CarouselsLoading();
      try {
        List<Carousel> result = await _carouselRepository.loadPicbytype(event.type);
        print(result);
        yield Carouselsloaded(lstCarousel:result);

      } catch (_) {
        yield CarouselsError();
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