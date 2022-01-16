import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:amigatoy/Blocs/featureds/featureds.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';


class FeaturedsBloc extends Bloc<FeaturedEvent, FeaturedState> {
late FeaturedRepository _featuredRepository;


  FeaturedsBloc({required FeaturedRepository featuredRepository}): super(FeaturedEmpty()){
    _featuredRepository=FeaturedRepository();
  }

//      : assert(featuredRepository != null),
//        _featuredRepository = featuredRepository;
  @override
  FeaturedState get initialState => FeaturedEmpty();

  @override
  Stream<FeaturedState> mapEventToState(FeaturedEvent event) async* {
    if (event is FetchFeatureds) {
      yield FeaturedLoading();
//      try {
//        developer.log('get feature product list',
//          name: 'my.app.category',
//
//        );
        ListProduct result = await _featuredRepository.loadFeaturedlist(event.start,event.length);

        yield Featuredloaded(lstFeatureds:result);

//      } catch (e) {
//        print('error caught: $e');
//        yield FeaturedError();
//      }
    }else if(event is FeaturedloadMore){
      ListProduct result = await _featuredRepository.loadFeaturedlist(event.start,event.length);

      yield Featuredloaded(lstFeatureds:result);
    }
  }



}