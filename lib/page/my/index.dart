import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/user_info.dart';
import 'package:trtc_demo/page/config/application.dart';
import 'package:trtc_demo/provider/jmessage_manager_provider.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  UserInfoModel _userInfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _getUserInfo() async {
    var json = await Api.UserInfo();
    print('===============================$json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('chat'),
            onPressed: () {
              Application.router.navigateTo(context, "/chat");
            },
          ),
          ElevatedButton(
            child: Text('logou im'),
            onPressed: _logout,
          ),
          ElevatedButton(
            child: Text('getUserInfo'),
            onPressed: _getUserInfo,
          ),
        ],
      ),
    );
  }

  _logout() {
    JMessage.logout();
    Fluttertoast.showToast(
      msg: '退出成功',
      gravity: ToastGravity.CENTER,
    );
    Application.router.navigateTo(context, "/login");
  }
}
