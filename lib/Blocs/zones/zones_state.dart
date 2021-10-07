part of 'zones_bloc.dart';

@immutable
abstract class ZonesState {}

class ZonesInitial extends ZonesState {}

class Zonesloadingstate extends ZonesState {
  @override
  List<Object> get props => [];
}

class Zonesloadedstate extends ZonesState {
  List<Zones?> zones;
  Zonesloadedstate({required this.zones});
  @override
  List<Object> get props => [zones];
}
