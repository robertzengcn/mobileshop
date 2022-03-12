import 'dart:async';
// import 'package:amigatoy/Models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Repository/repository.dart';
part 'update_user_event.dart';
part 'update_user_state.dart';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  final UserRepository userRepository;
  UpdateUserBloc({required this.userRepository}) : super(UpdateUserInitial());
  @override
  Stream<UpdateUserState> mapEventToState(UpdateUserEvent event) async* {
    if(event is Updateinfoevent){
      try{
     bool res=await userRepository.updateUserinfo(event.name, event.telephone);
      if(res){
        await userRepository.saveUsername(event.name);
      }
      yield UpdateUsersuccessstate();
      }catch (error) {
        yield UpdateUserErrorState(error:error.toString());
      }

    }
  }
}
