import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(String name, String group) {
    _user = UserModel(name: name, group: group);
    notifyListeners();
  }
}
