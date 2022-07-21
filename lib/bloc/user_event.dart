part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final User user;
  ActivateUser(this.user);
}

class ChangeUserAgeEvent extends UserEvent {
  final int newAge;
  ChangeUserAgeEvent(this.newAge);
}

class AddCareerEvent extends UserEvent {
  final String career;
  AddCareerEvent(this.career);
}

class RemoveUserEvent extends UserEvent {}
