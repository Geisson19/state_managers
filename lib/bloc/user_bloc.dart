import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:state_managers/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));

    on<RemoveUserEvent>((event, emit) => emit(const UserInitial()));

    on<ChangeUserAgeEvent>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(age: event.newAge)));
    });

    on<AddCareerEvent>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(careers: [
        ...state.user!.careers,
        event.career,
      ])));
    });
  }
}
