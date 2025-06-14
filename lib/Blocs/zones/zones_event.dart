part of 'zones_bloc.dart';

@immutable
abstract class ZonesEvent extends Equatable {
  const ZonesEvent();
}

///add product to wish list
class QueryZoneEvent extends ZonesEvent {
  final int? countId;

  const QueryZoneEvent({this.countId});

  @override
  List<Object> get props => [];
}

