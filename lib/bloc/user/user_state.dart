part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {
  final existsUser = false;

  @override
  String toString() => 'UserInitial: {existsUser: $existsUser}';
}

class ActiveUser extends UserState {
  final existUser = true;
  final User user;

  ActiveUser(this.user);
}
