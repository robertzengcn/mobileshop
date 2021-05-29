import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:amigatoy/Blocs/featureds/featureds.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';
//import 'dart:developer' as developer;

class FeaturedsBloc extends Bloc<FeaturedEvent, FeaturedState> {
  final FeaturedRepository _featuredRepository;
//  StreamSubscription _carouselSubscription;

  FeaturedsBloc({required FeaturedRepository featuredRepository})
      : assert(featuredRepository != null),
        _featuredRepository = featuredRepository;
  @override
  FeaturedState get initialState => FeaturedEmpty();

  @override
  Stream<FeaturedState> mapEventToState(FeaturedEvent event) async* {
    if (event is FetchFeatureds) {
      yield FeaturedLoading();
      try {
//        developer.log('get feature product list',
//          name: 'my.app.category',
//
//        );
        List<Product> result = await _featuredRepository.loadFeaturedlist();

        yield Featuredloaded(lstFeatureds:result);

      } catch (e) {
        print('error caught: $e');
        yield FeaturedError();
      }
    }
  }



}