import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trtc_demo/base/DemoSevice.dart';
import 'package:trtc_demo/debug/GenerateTestUserSig.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/agreement.dart';
import 'package:trtc_demo/models/login.dart';
import 'package:trtc_demo/models/user_info.dart';
import 'package:trtc_demo/page/config/application.dart';
import 'package:trtc_demo/provider/TRTCProvider.dart';
import 'package:trtc_demo/provider/jmessage_manager_provider.dart';
import 'package:trtc_demo/provider/userProvider.dart';
import 'package:trtc_demo/TRTCChatSalonDemo/model/TRTCChatSalon.dart';
import 'package:trtc_demo/TRTCChatSalonDemo/model/TRTCChatSalonDef.dart';
import 'package:trtc_demo/utils/TxUtils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/constants.dart' as constants;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TRTCChatSalon trtcVoiceRoom = TRTCProvider.trtcVoiceRoom;
  final FocusNode focusNode = FocusNode();
  Color _colorRed = Color.fromRGBO(236, 97, 94, 1);
  bool _checkValue = true;
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  String _result;
  String TOKEN;
  String userId;
  AgreementElement _agreement;

  @override
  void initState() {
    // TODO: implement initState
    _unameController.text = '15882478524';
    _pwdController.text = '123456';
    _getAgreement();
    super.initState();
  }

  _getAgreement() async {
    var json = await Api.Agreement('user');
    print('================================');
    print(json.toString());
    var result = AgreementModel.fromJson(json);
    _agreement = result.data;
    setState(() {});
  }

  _openWebview(String title, String url) {
    Application.router.navigateTo(context, "/webview", routeSettings: RouteSettings(
      arguments: {
        "title": title,
        "url": url,
        "isLocalUrl": false
      },
    ));
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
        title: Text('登录'),
        brightness: Brightness.dark,
        centerTitle: true,
        backgroundColor: _colorRed,
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: TextStyle(fontSize: 32.sp),
            ),
            onPressed: () {
              Application.router.navigateTo(context, "/register");
            },
            child: const Text('注册'),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          focusNode.unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(55.r),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 24.r),
                      child: TextField(
                        autofocus: true,
                        controller: _unameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: '手机号/邮箱',
                        ),
                      ),
                    ),
                    TextField(
                      controller: _pwdController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_open_outlined),
                        hintText: '请输入登录密码',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 96.h),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _login();
                          },
                          style: ButtonStyle(),
                          child: Text('登录'),
                        ),
                      ),
                    ),
                    Row(
                      // alignment: Alignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
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
                        Text.rich(
                          TextSpan(
                              text: '已阅读并同意',
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
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('onTap');
                                      // _openWebview('《隐私政策》', 'https://baidu.com');
                                      _launchURL(_agreement.userPolicyUrl);
                                    },
                                ),
                                TextSpan(
                                  text: '和',
                                ),
                                TextSpan(
                                  text: '《用户协议》',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('onTap');
                                      // Application.router.navigateTo(context, "/webview_example");
                                      _launchURL(_agreement.userAgreement);
                                    },
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _login() async {
    if (_unameController.text == '') {
      return Fluttertoast.showToast(
        msg: '请输入账号',
        gravity: ToastGravity.CENTER,
      );
    }
    if (_pwdController.text == '') {
      return Fluttertoast.showToast(
        msg: '请输入密码',
        gravity: ToastGravity.CENTER,
      );
    }
    FocusScope.of(context).requestFocus(FocusNode());
    EasyLoading.show(status: '正在登录...', maskType: EasyLoadingMaskType.black);
    await Api.Login({
      'username': _unameController.text,
      'password': _pwdController.text
    }).then((value) {
      var res = LoginModel.fromJson(value);
      TOKEN = res.data.token;
      _setToken();
    }, onError: (error) {
      EasyLoading.dismiss();
      return Fluttertoast.showToast(
        msg: error,
        gravity: ToastGravity.CENTER,
      );
    });
    setState(() {});
  }

  _imLogin() async {
    await JMessage.login(
            username: _unameController.text, password: _pwdController.text)
        .then((onValue) {
      if (onValue is JMUserInfo) {
        JMUserInfo u = onValue;
        _result = "【登录后】${u.toJson()}";
      } else {
        _result = "【登录后】null";
      }
      _successLogin();
      setState(() {});
    }, onError: (error) {
      setState(() {
        if (error is PlatformException) {
          PlatformException ex = error;
          _result = "【登录后】code = ${ex.code},message = ${ex.message}";
        } else {
          _result = "【登录后】code = ${error.toString()}";
        }
        _imRegister();
        // Fluttertoast.showToast(
        //   msg: '账号或密码不正确',
        //   gravity: ToastGravity.CENTER,
        // );
      });
    });
  }

  _setToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('TOKEN', TOKEN);
    _getUser();
  }

  _successLogin() {
    EasyLoading.dismiss();
    Fluttertoast.showToast(
      msg: '登录成功',
      gravity: ToastGravity.CENTER,
    );
    Application.router.pop(context);
  }

  _imRegister() async {
    await JMessage.userRegister(
        username: _unameController.text,
        nickname: _unameController.text,
        password: _pwdController.text);
    _imLogin();
  }

  _getUser() async {
    var json = await Api.UserInfo();
    var user = UserInfoModel.fromJson(json);
    UserProvider().setUser(user.data);
    _loginIM();
  }

  _loginIM() async {
    if ((await Permission.camera.request().isGranted &&
        await Permission.microphone.request().isGranted)) {
    } else {
      Fluttertoast.showToast(
        msg: '需要获取音视频权限才能进入',
        gravity: ToastGravity.CENTER,
      );
      return;
    }

    var userId = UserProvider.user.username;

    ActionCallback resValue = await trtcVoiceRoom.login(
      GenerateTestUserSig.sdkAppId,
      userId,
      GenerateTestUserSig.genTestSig(userId),
    );

    await trtcVoiceRoom.setSelfProfile(
        'ID:' + userId, constants.DEFAULT_ROOM_IMAGE);
    if (resValue.code == 0) {
      TxUtils.setStorageByKey(constants.USERID_KEY, userId);
      // _successLogin();
      _imLogin();
    } else {
      EasyLoading.showError('setSelfProfile:' + resValue.desc);
    }
  }
}
