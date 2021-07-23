import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
//import 'package:meta/meta.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/User.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository}): super(AuthenticationUninitialized()) {
//    final userRepository=UserRepository();
  }
//      : assert(userRepository != null);
  @override
//  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is AppStarted) {
      final User? user = await userRepository.hasToken();

      if (user!=null) {
        yield AuthenticationAuthenticated(token:user.usertoken);
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
//      await userRepository.persistToken(event.token);
      await userRepository.insertUser(event.user);
      yield AuthenticationAuthenticated(token:event.user.usertoken);
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken(event.token);
      yield AuthenticationUnauthenticated();
    }
  }
}
