import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:meta/meta.dart';
part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository categoriesRepository;

  CategoriesBloc({required this.categoriesRepository}) : super(CategoriesInitial());
  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    if(event is ListcategoriesEvent){
      try {
        List<Categories> lcate = await categoriesRepository.getCategorieslist(
            event.parentId);

        yield Categorieslistfetched(listcategories: lcate);
      }catch (error, stacktrace) {
        yield Categorieserror(
            error: 'Exception: ' +
                error.toString() +
                'Stacktrace: ' +
                stacktrace.toString());
      }
    }
  }
}
