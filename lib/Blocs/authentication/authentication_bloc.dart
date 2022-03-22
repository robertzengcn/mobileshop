import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
//import 'package:meta/meta.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/User.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
        await userRepository.downloadPublickey();

      // final String? tokenStr = await userRepository.hasToken();
    final String? tokenStr=await userRepository.getUsertoken();

      if (tokenStr!=null&&tokenStr.length>0) {
        final String? userName=await userRepository.getUsername();
        if(userName!=null) {
          //token expire
          yield AuthenticationAuthenticated(token: tokenStr,name:userName);
        }else{
          yield AuthenticationUnauthenticated();
        }
      } else {
        yield AuthenticationUnauthenticated();
      }
    }else if (event is LoggedIn) {
      yield AuthenticationLoading();
//      await userRepository.persistToken(event.token);
//       await userRepository.insertUser(event.user);


      await userRepository.persistToken(event.user.usertoken,event.user.userexpired,event.user.username);


      // final String? tokenStr = await userRepository.hasToken();

      yield AuthenticationAuthenticated(token:event.user.usertoken,name:event.user.username);

    }else if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }else if (event is UpdateAuthnameEvent){
      final String? tokenStr=await userRepository.getUsertoken();
      if(tokenStr!=null){
        yield AuthenticationAuthenticated(token: tokenStr,name:event.name);
      }else{
        yield AuthenticationUnauthenticated();
      }

    }
  }
}
