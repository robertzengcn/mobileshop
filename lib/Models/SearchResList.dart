import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';

class SearchResList extends Equatable {

  final List<Product?> lps; //result list
  final int resNum;// result number
  SearchResList({
    required this.lps,
    required this.resNum
    });
  @override
  List<Object> get props => [
    lps,resNum
  ];
}