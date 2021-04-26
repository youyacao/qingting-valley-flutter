import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:trtc_demo/page/config/application.dart';
import 'package:trtc_demo/provider/jmessage_manager_provider.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  PageController _pageController = PageController();
  List _list = [];
  String _result = '';

  @override
  void initState() {
    // TODO: implement initState
    _list = [1, 2, 3, 4, 5];
    _pageController.addListener(() {
      if (_pageController.page.round() == _list.length - 2) {
        _list.addAll([6, 7, 8, 9, 10]);
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Column(
        children: [
          Text(_result),
          ElevatedButton(
            child: Text('_result'),
            onPressed: () {
              _login();
            },
          ),
          ElevatedButton(
            child: Text('chat'),
            onPressed: () {
              Application.router.navigateTo(context, "/chat");
            },
          ),
        ],
      ),
    );
  }

  _login() async {
    await JMessage.login(username: 'yinman', password: '123456a2').then((onValue) {
      if (onValue is JMUserInfo) {
        JMUserInfo u = onValue;
        _result = "【登录后】${u.toJson()}";
      } else {
        _result = "【登录后】null";
      }
      setState(() {});
    }, onError: (error) {
      setState(() {
        if (error is PlatformException) {
          PlatformException ex = error;
          _result = "【登录后】code = ${ex.code},message = ${ex.message}";
        } else {
          _result = "【登录后】code = ${error.toString()}";
        }
      });
    });
  }
}
