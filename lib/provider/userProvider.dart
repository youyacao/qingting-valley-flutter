import 'package:flutter/foundation.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/config.dart';
import 'package:trtc_demo/models/user_info.dart';

class UserProvider with ChangeNotifier {
  static UserInfoElement _user;
  static ConfigElement _config;

  static UserInfoElement get user => _user;
  static ConfigElement get config => _config;
  static String get avatar => _user != null ? _user.avatar : '';

  setUser(UserInfoElement user) {
    _user = user;
    notifyListeners();
  }

  getConfig() async {
    var json = await Api.Config('base');
    var result = ConfigModel.fromJson(json);
    _config = result.data;
  }
}
