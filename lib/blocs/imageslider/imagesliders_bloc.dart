import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:treva_shop_flutter/blocs/imageslider/imagesliders.dart';
import 'package:firebase_repository/firebase_repository.dart';

class ImageslidersBloc extends Bloc<ImageslidersEvent, ImageslidersState> {
  final ImageslidersRepository _imageslidersRepository;
  StreamSubscription _imagesliderSubscription;

  ImageslidersBloc({@required ImageslidersRepository imageslidersRepository})
      : assert(imageslidersRepository != null),
        _imageslidersRepository = imageslidersRepository;
  @override
  ImageslidersState get initialState => HomeImagesliderLoading();

  @override
  Stream<ImageslidersState> mapEventToState(ImageslidersEvent event) async* {
    if (event is LoadImageslider) {
      yield* _mapLoadImagesToState();
    }
  }

  Stream<ImageslidersState> _mapLoadImagesToState() async* {
    _imagesliderSubscription?.cancel();
    _imagesliderSubscription = _imagesliderSubscription.imagesliders().listen(
          (imgsliders) => add(ImagesliderUpdated(imgsliders)),
    );
  }

}