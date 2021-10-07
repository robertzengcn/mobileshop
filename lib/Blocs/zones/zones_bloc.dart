import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
part 'zones_event.dart';
part 'zones_state.dart';

class ZonesBloc extends Bloc<ZonesEvent, ZonesState> {
  final CustomerAddressRepository customerAddressRepository;
  ZonesBloc({required this.customerAddressRepository}) : super(ZonesInitial());
  @override
  Stream<ZonesState> mapEventToState(
      ZonesEvent event
      ) async* {
    if(event is QueryZoneEvent){
      yield Zonesloadingstate();

      List<Zones?> zonesList=await customerAddressRepository.getZoneslist(event.countId);

      yield Zonesloadedstate(zones:zonesList);
    }

  }
}
