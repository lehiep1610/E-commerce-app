import 'package:flutter/material.dart';

import 'package:e_commerce_app/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: 'id',
      name: 'name',
      password: 'password',
      email: 'email',
      userType: 'userType',
      token: 'token');

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
