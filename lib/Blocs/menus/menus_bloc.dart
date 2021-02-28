import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:amigatoy/Blocs/menus/menus.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';


class MenusBloc extends Bloc<MenusEvent, MenusState> {
  final MenuRepository _menuRepository;
//  StreamSubscription _carouselSubscription;

  MenusBloc({@required MenuRepository menuRepository})
      : assert(menuRepository != null),
        _menuRepository = menuRepository;
  @override
  MenusState get initialState => MenusEmpty();

  @override
  Stream<MenusState> mapEventToState(MenusEvent event) async* {
    if (event is FetchMenutype) {
      yield MenusLoading();
      try {
        List<Menu> result = await _menuRepository.fetchMenutype(event.type);
//        print(result);
        yield Menusloaded(lstMenu:result);

      } catch (_) {
        yield MenusError();
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