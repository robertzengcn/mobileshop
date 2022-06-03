part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchTermreadystate extends SearchState {
  final List<String?> searchTerms;
  const SearchTermreadystate({required this.searchTerms});
  @override
  List<Object> get props => [];
}
class Searchpageloadingstate extends SearchState {
  @override
  List<Object> get props => [];
}
class Searchingstate extends SearchState {
  @override
  List<Object> get props => [];
}
class Searchfinishstate extends SearchState {
  final List<Product?> lps;
  final int num;
  const Searchfinishstate({required this.lps,required this.num});
  @override
  List<Object> get props => [];
}
class SearchErrorState extends SearchState {
  final String error;

  SearchErrorState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'search product get error { error: $error }';
}
