import 'dart:async';

import 'package:amigatoy/Models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';
part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository userRepository;
  UsersBloc({required this.userRepository}) : super(UsersInitial());
  @override
  Stream<UsersState> mapEventToState(UsersEvent event) async* {
    if (event is getUserinfoevent) {
      yield loadingUserinfostate();

      UserInfo userinfo = await userRepository.getUserinfo();
      yield queryUserinfosuccessstate(userinfo: userinfo);
    }
  }
}
