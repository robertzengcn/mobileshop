import 'dart:async';

import 'package:amigatoy/Repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;
  SearchBloc({required this.searchRepository}) : super(SearchInitial());
  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchinitEvent) {
      yield Searchpageloadingstate();
      List<String?> serarchterm=await searchRepository.getSearchterms();

      yield SearchTermreadystate(searchTerms: serarchterm);
    }else if(event is SearchstartEvent){
      yield Searchingstate();
      // try {
      SearchResList searchres=await searchRepository.searchProduct(event.serarchterm, event.page,event.num);

      yield Searchfinishstate(lps:searchres.lps,num:searchres.resNum);
      // } catch (error) {
      //   yield SearchErrorState(error: error.toString());
      // }
    }
  }

}
