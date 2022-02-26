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

      final String? tokenStr = await userRepository.hasToken();
    final String? testStr=await userRepository.getUsertoken();
    print("------------------");
    print(testStr);
        print("*****************");
      if (tokenStr!=null&&tokenStr.length>0) {
        List<String> tokenArr=tokenStr.split(":");
        if(int.parse(tokenArr[1])>DateTime.now().millisecondsSinceEpoch){
          //token expire
          yield AuthenticationAuthenticated(token:tokenArr[0]);
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
      String Tokenstring=event.user.usertoken+":"+event.user.userexpired;
      print(Tokenstring);
      await userRepository.persistToken(Tokenstring);
      print("5252525252");

      final String? tokenStr = await userRepository.hasToken();
      print(tokenStr);
      yield AuthenticationAuthenticated(token:Tokenstring);

    }else if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken(event.token);
      yield AuthenticationUnauthenticated();
    }
  }
}
