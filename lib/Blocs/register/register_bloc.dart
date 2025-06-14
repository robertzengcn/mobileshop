import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/User.dart';
import 'package:amigatoy/Blocs/authentication/authentication.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  RegisterBloc({
    required this.userRepository,
    required this.authenticationBloc,
}) : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
      RegisterEvent event,
      ) async* {
    if (event is RegisterBtnclick){
      yield  RegisterLoadingState();
       try {

        User user = await userRepository.registerUser(
            event.fullName,  event.email, event.password);
        authenticationBloc.add(LoggedIn(user: user));

        yield RegisterCompleted();
      }catch (error) {
        yield Registerfailure(error: error.toString());
      }
    }
  }
}
