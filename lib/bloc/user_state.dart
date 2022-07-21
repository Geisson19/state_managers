part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final User? user;

  const UserState({this.existUser = false, this.user});
}

class UserInitial extends UserState {
  const UserInitial({bool existUser = false, User? user})
      : super(existUser: existUser, user: user);

  @override
  String toString() => 'UserInitial { existUser: $existUser, user: $user }';
}

class UserSetState extends UserState {
  final User newUser;

  const UserSetState(this.newUser) : super(existUser: true, user: newUser);

  @override
  String toString() => 'UserSetState { existUser: $existUser, user: $user }';
}
