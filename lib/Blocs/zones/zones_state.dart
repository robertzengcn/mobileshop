part of 'zones_bloc.dart';

@immutable
abstract class ZonesState {}

class ZonesInitial extends ZonesState {}

class Zonesloadingstate extends ZonesState {

  List<Object> get props => [];
}

class Zonesloadedstate extends ZonesState {
  final List<Zones?> zones;
  Zonesloadedstate({required this.zones});

  List<Object> get props => [zones];
}
