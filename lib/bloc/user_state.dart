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
