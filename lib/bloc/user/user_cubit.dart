import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managers/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void setUser(User user) {
    emit(ActiveUser(user));
  }

  void changeUserAge(int age) {
    if (state is ActiveUser) {
      final user = (state as ActiveUser).user;
      emit(ActiveUser(User(name: user.name, age: age, careers: user.careers)));
    }
  }

  void addCareer() {
    if (state is ActiveUser) {
      final user = (state as ActiveUser).user;
      emit(ActiveUser(User(name: user.name, age: user.age, careers: [
        ...user.careers!,
        'New career',
      ])));
    }
  }
}
