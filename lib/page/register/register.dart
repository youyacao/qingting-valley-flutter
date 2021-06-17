import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/login.dart';
import 'package:trtc_demo/page/config/application.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rpasswordController = TextEditingController();
  TextEditingController _inviteCodeController = TextEditingController();
  bool _checkValue = false;

  @override
  void initState() {
    // _usernameController.text = '15882478526';
    // _passwordController.text = '123456';
    // _rpasswordController.text = '123456';
    super.initState();
  }

  _register() async {
    var _username = _usernameController.text;
    var _password = _passwordController.text;
    if (_username == '') {
      return Fluttertoast.showToast(
        msg: '请输入账号',
        gravity: ToastGravity.CENTER,
      );
    }
    if (_password == '') {
      return Fluttertoast.showToast(
        msg: '请输入密码',
        gravity: ToastGravity.CENTER,
      );
    }
    if (_password != _rpasswordController.text) {
      return Fluttertoast.showToast(
        msg: '两次输入密码不一致',
        gravity: ToastGravity.CENTER,
      );
    }
    if (!_checkValue) {
      return Fluttertoast.showToast(
        msg: '请阅读并同意《隐私政策》及《使用协议》',
        gravity: ToastGravity.CENTER,
      );
    }
    EasyLoading.show(status: '正在注册...');
    await Api.Register({
      // 'email': _username,
      'username': _username,
      'password': _password,
      'refcode': _inviteCodeController.text
    }).then((json) {
      var result = LoginModel.fromJson(json);
      Fluttertoast.showToast(
        msg: result.msg,
        gravity: ToastGravity.CENTER,
      );
      if (result.code == 200) {
        Application.router.pop(context);
      }
    }, onError: (error) {
      Fluttertoast.showToast(
        msg: error,
        gravity: ToastGravity.CENTER,
      );
    });
    EasyLoading.dismiss();
  }

  /// 打开外部浏览器
  void _launchURL(String url) async => await canLaunch(url)
      ? await launch(url)
      : Fluttertoast.showToast(
          msg: '请配置正确的URL网址',
          gravity: ToastGravity.CENTER,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册账号'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 130.r, right: 56.r, left: 56.r),
          child: Column(
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: '请输入账号',
                ),
              ),
              SizedBox(
                height: 22.r,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '请输入密码（最少6位，数字+字母）',
                ),
              ),
              SizedBox(
                height: 22.r,
              ),
              TextField(
                controller: _rpasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '请确认密码',
                ),
              ),
              SizedBox(
                height: 22.r,
              ),
              TextField(
                controller: _inviteCodeController,
                decoration: InputDecoration(
                  hintText: '请输入邀请码（选填）',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.r, bottom: 75.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Transform.scale(
                        scale: 0.8,
                        child: Checkbox(
                          value: _checkValue,
                          onChanged: (value) {
                            setState(() {
                              _checkValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                          text: '请阅读并同意',
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Color(0xFF999999),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              setState(() {
                                _checkValue = !_checkValue;
                              });
                            },
                          children: [
                            TextSpan(
                              text: '《隐私政策》',
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('onTap');
                                  // _openWebview('《隐私政策》', 'https://baidu.com');
                                  // _launchURL(_agreement.userPolicyUrl);
                                },
                            ),
                            TextSpan(
                              text: '及',
                            ),
                            TextSpan(
                              text: '《使用协议》',
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('onTap');
                                  // Application.router.navigateTo(context, "/webview_example");
                                  // _launchURL(_agreement.userAgreement);
                                },
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('注册'),
                  onPressed: _register,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
