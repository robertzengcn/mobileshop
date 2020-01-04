import 'package:flutter/material.dart';
import 'catelogue_bloc.dart';
export 'catelogue_bloc.dart';

class CatelogueBlocProvider extends InheritedWidget{
  final bloc = CatelogueBloc();

  CatelogueBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static CatelogueBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CatelogueBlocProvider) as CatelogueBlocProvider).bloc;

  }

}