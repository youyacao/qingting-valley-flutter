import 'package:flutter/foundation.dart';
import 'package:trtc_demo/models/user_info.dart';

class UserProvider with ChangeNotifier {
  static UserInfoElement _user;

  static UserInfoElement get user => _user;

  setUser(UserInfoElement user) {
    _user = user;
    notifyListeners();
  }
}
