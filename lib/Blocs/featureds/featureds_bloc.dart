import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:amigatoy/Blocs/featureds/featureds.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';


class FeaturedsBloc extends Bloc<FeaturedEvent, FeaturedState> {
  final FeaturedRepository _featuredRepository;
//  StreamSubscription _carouselSubscription;

  FeaturedsBloc({@required FeaturedRepository featuredRepository})
      : assert(featuredRepository != null),
        _featuredRepository = featuredRepository;
  @override
  FeaturedState get initialState => FeaturedEmpty();

  @override
  Stream<FeaturedState> mapEventToState(FeaturedEvent event) async* {
    if (event is FetchFeatureds) {
      yield FeaturedLoading();
      try {
        List<Product> result = await _featuredRepository.loadFeaturedlist();
        print(result);
        yield Featuredloaded(lstFeatureds:result);

      } catch (_) {
        yield FeaturedError();
      }
    }
  }



}