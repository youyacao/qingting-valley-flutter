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
      backgroundColor: Colors.white,
      body: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(
                Icons.textsms_outlined,
                size: 28,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.r, horizontal: 30.r),
                  child: Column(
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
                              child:
                                  Image.network('${_userInfo?.avatar ?? 'http://api.btstu.cn/sjtx/api.php?lx=c1&format=images'}', width: 130.r, height: 130.r),
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
                        padding: EdgeInsets.symmetric(vertical: 40.r),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 42.sp,
                                    ),
                                  ),
                                  Text(
                                    '粉丝',
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 42.sp,
                                    ),
                                  ),
                                  Text(
                                    '关注',
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 42.sp,
                                    ),
                                  ),
                                  Text(
                                    '获赞',
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 42.sp,
                                    ),
                                  ),
                                  Text(
                                    '推广',
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                    ),
                                  ),
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
                      Container(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 336.r,
                            height: 140.r,
                            padding: EdgeInsets.all(24.r),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://qingtingyunshejiaoxcx.youyacao.com/mine_viewing_ticket_bg.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5.r),
                                  child: Text(
                                    '0/10',
                                    style: TextStyle(
                                      fontSize: 36.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  '今日观影券',
                                  style: TextStyle(
                                    color: Color.fromRGBO(153, 153, 153, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 336.r,
                            height: 140.r,
                            padding: EdgeInsets.all(24.r),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://qingtingyunshejiaoxcx.youyacao.com/mine_download_ticket_bg.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5.r),
                                  child: Text(
                                    '0/10',
                                    style: TextStyle(
                                      fontSize: 36.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  '今日下载券',
                                  style: TextStyle(
                                    color: Color.fromRGBO(153, 153, 153, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 18.r,
                      ),
                      Container(
                        width: 690.r,
                        height: 120.r,
                        padding: EdgeInsets.symmetric(horizontal: 20.r),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://qingtingyunshejiaoxcx.youyacao.com/mine_promotion_entrance_bg.webp'),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://qingtingyunshejiaoxcx.youyacao.com/mine_coupon.png',
                                  width: 42.r,
                                  height: 30.r,
                                ),
                                Container(
                                  width: 20.r,
                                ),
                                Text(
                                  '分享推广',
                                  style: TextStyle(
                                    fontSize: 32.sp,
                                    color: Color.fromRGBO(143, 69, 3, 1),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 20.r,
                                ),
                                Text(
                                  '获取更多观影/下载券',
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                    color: Color.fromRGBO(173, 41, 11, 1),
                                  ),
                                ),
                                Image.network(
                                  'https://qingtingyunshejiaoxcx.youyacao.com/red_right_arrow.png',
                                  width: 42.r,
                                  height: 30.r,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 18.r,
                      ),
                      Container(
                        width: 690.r,
                        height: 120.r,
                        padding: EdgeInsets.symmetric(horizontal: 20.r),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://qingtingyunshejiaoxcx.youyacao.com/mine_vip_entrance_bg.webp'),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  'https://qingtingyunshejiaoxcx.youyacao.com/mine_vip.png',
                                  width: 42.r,
                                  height: 30.r,
                                ),
                                Container(
                                  width: 20.r,
                                ),
                                Text(
                                  '购买VIP',
                                  style: TextStyle(
                                    fontSize: 32.sp,
                                    color: Color.fromRGBO(143, 69, 3, 1),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 20.r,
                                ),
                                Text(
                                  '开通VIP无限观影',
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                    color: Color.fromRGBO(143, 69, 3, 1),
                                  ),
                                ),
                                Image.network(
                                  'https://qingtingyunshejiaoxcx.youyacao.com/yellow_right_arrow.png',
                                  width: 42.r,
                                  height: 30.r,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 18.r,
                  color: Colors.grey[100],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.r, vertical: 20.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 246.r,
                        height: 160.r,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(246, 185, 6, 1),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.r),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 20.r),
                                    child: Text(
                                      '余额',
                                      style: TextStyle(
                                        fontSize: 32.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '￥0.00',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.sp,
                                        ),
                                      ),
                                      Text(
                                        '充值/提现 >',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 28.r,
                              child: Image.network(
                                'https://qingtingyunshejiaoxcx.youyacao.com/mine_balance_flag.png',
                                width: 86.r,
                                height: 48.r,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 426.r,
                        height: 160.r,
                        padding: EdgeInsets.symmetric(horizontal: 20.r),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://qingtingyunshejiaoxcx.youyacao.com/mine_proxy_entrance_bg.webp'),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 20.r),
                              child: Text(
                                '全名代理',
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '推广APP，躺着也能赚钱！',
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                Image.network(
                                  'https://qingtingyunshejiaoxcx.youyacao.com/red_right_arrow.png',
                                  width: 28.r,
                                  height: 28.r,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 18.r,
                  color: Colors.grey[100],
                ),
                _menuItemBuild('官方福利群', Icons.account_circle_outlined, '参加活动送VIP'),
                _menuItemBuild('兑换激活码', Icons.keyboard_outlined),
                _menuItemBuild('任务中心', Icons.list_alt_outlined, '升级提升特权'),
                _menuItemBuild('我的评论', Icons.speaker_notes_outlined),
                _menuItemBuild('我的点赞', Icons.thumb_up_alt_outlined),
                _menuItemBuild('我的下载', Icons.download_outlined),
                _menuItemBuild('播放记录', Icons.schedule_outlined),
                Container(
                  height: 18.r,
                  color: Colors.grey[100],
                ),
                _menuItemBuild('设置', Icons.settings_outlined),
                // Column(
                //   children: [
                //     ElevatedButton(
                //       child: Text('chat'),
                //       onPressed: () {
                //         Application.router.navigateTo(context, "/chat");
                //       },
                //     ),
                //     ElevatedButton(
                //       child: Text('logou im'),
                //       onPressed: _logout,
                //     ),
                //     ElevatedButton(
                //       child: Text('getUserInfo'),
                //       onPressed: _getUserInfo,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _menuItemBuild(String label, IconData iconData, [String tip = '']) {
    return Container(
      height: 100.r,
      padding: EdgeInsets.symmetric(horizontal: 30.r),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20.r),
            child: Icon(
              iconData,
              size: 48.sp,
            ),
          ),
          Expanded(
            child: Container(
              height: 100.r,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.r, style: BorderStyle.solid, color: Colors.grey[100]),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 28.sp,
                    ),
                  ),
                  Row(
                    children: [
                      if (tip != '')
                        Padding(
                          padding: EdgeInsets.only(right: 5.r),
                          child: Text(
                            tip,
                            style: TextStyle(
                              color: Color.fromRGBO(245, 140, 168, 1),
                            ),
                          ),
                        ),
                      Image.network(
                        'https://qingtingyunshejiaoxcx.youyacao.com/right_arrow.png',
                        width: 28.r,
                        height: 28.r,
                      ),
                    ],
                  ),
                ],
              ),
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
