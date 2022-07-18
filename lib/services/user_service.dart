import 'package:state_managers/models/user.dart';

import 'package:flutter/material.dart';

class UserService with ChangeNotifier {
  User? _user;

  User? get user => _user;

  bool get existsUser => (_user != null);

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  void setAge(int age) {
    _user!.age = age;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void addCarrer() {
    _user!.carrers!.add('New career ${_user!.carrers!.length + 1}');
    notifyListeners();
  }
}
