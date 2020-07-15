import 'package:flutter/material.dart';

class FTLoginProvider extends ChangeNotifier {
  bool userLogType;

  FTLoginProvider(this.userLogType);

  void userLogin() {
    userLogType = true;
    notifyListeners();
  }

  void userLogout() {
    userLogType = false;
    notifyListeners();
  }

  get isLogin => userLogType;
}
