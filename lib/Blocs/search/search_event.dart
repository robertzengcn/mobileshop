part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}
class SearchinitEvent extends SearchEvent{
  const SearchinitEvent();
  @override
  List<Object> get props => [];
}
class SearchstartEvent extends SearchEvent{
  final String serarchterm;
  final int page;// the start search page
  final int num;// the search length
  const SearchstartEvent({required this.serarchterm,
  required this.page,
    required this.num,
  });
  @override
  List<Object> get props => [serarchterm];
}
