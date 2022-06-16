part of 'rand_product_bloc.dart';

abstract class RandProductEvent extends Equatable {
  const RandProductEvent();
}

@immutable
class ScreenLoadedEvent extends RandProductEvent {
  final int randnum;

  ScreenLoadedEvent({
    required this.randnum,
  });
  @override
  List<Object> get props => [randnum];
}
