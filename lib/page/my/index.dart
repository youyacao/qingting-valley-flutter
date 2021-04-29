import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/user_info.dart';
import 'package:trtc_demo/page/config/application.dart';
import 'package:trtc_demo/provider/jmessage_manager_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  UserInfoElement _userInfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _getUserInfo() async {
    var json = await Api.UserInfo();
    var user = UserInfoModel.fromJson(json);
    _userInfo = user.data;
    setState(() {});
  }

  get nickname {
    if (_userInfo != null) {
      return _userInfo.nickname != '' ? _userInfo.nickname : _userInfo.username;
    }
    return '请登录';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(
                Icons.textsms,
                size: 28,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(32.r),
              children: [
                Row(
                  children: [
                    Container(
                      width: 140.r,
                      height: 140.r,
                      margin: EdgeInsets.only(right: 15.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70.r),
                        color: Color.fromRGBO(235, 236, 240, 1),
                      ),
                      child: ClipOval(
                        child: Image.network('${_userInfo?.avatar ?? 'http://api.btstu.cn/sjtx/api.php?lx=c1&format=images'}', width: 130.r, height: 130.r),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$nickname',
                          style: TextStyle(
                            fontSize: 32.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Text(
                            '${_userInfo?.desc ?? '--'}',
                            style: TextStyle(
                              fontSize: 28.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80.h, bottom: 40.h),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text('0', style: TextStyle(
                              fontSize: 42.sp,
                            ),),
                            Text('粉丝', style: TextStyle(
                              fontSize: 28.sp,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text('0', style: TextStyle(
                              fontSize: 42.sp,
                            ),),
                            Text('关注', style: TextStyle(
                              fontSize: 28.sp,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text('0', style: TextStyle(
                              fontSize: 42.sp,
                            ),),
                            Text('获赞', style: TextStyle(
                              fontSize: 28.sp,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text('0', style: TextStyle(
                              fontSize: 42.sp,
                            ),),
                            Text('推广', style: TextStyle(
                              fontSize: 28.sp,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                  color: Color.fromRGBO(220, 222, 227, 1),
                ),
                Column(
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
              ],
            ),
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
