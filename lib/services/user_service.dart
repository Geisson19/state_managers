import 'dart:async';

import 'package:state_managers/models/user.dart';

class _UserService {
  User? _user;

  final StreamController<User?> _userController =
      StreamController<User?>.broadcast();

  Stream<User?> get userStream => _userController.stream;

  User? get user => _user;

  bool get existUser => _user != null;

  void loadUser(User user) {
    _user = user;
    _userController.add(_user);
  }

  void loadAge(int age) {
    if (existUser) {
      _user!.age = age;
      _userController.add(_user);
    }
  }

  void dispose() {
    _userController.close();
  }
}

final userService = _UserService();
