import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/agent.dart';
import 'package:trtc_demo/models/agent_list.dart';
import 'package:trtc_demo/models/user_info.dart';
import 'package:trtc_demo/page/config/application.dart';

class AgentPage extends StatefulWidget {
  @override
  _AgentPageState createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  Color _pink = Color.fromRGBO(245, 131, 160, 1);
  Color _grey = Color.fromRGBO(245, 245, 245, 1);
  UserInfoElement _userInfo;
  AgentElement _agentData;
  List<AgentListElement> _list = [];
  bool _init = false;

  @override
  void initState() {
    _getUserInfo();
    _getAgent();
    _getAgentList();
    super.initState();
  }

  _getUserInfo() async {
    var json = await Api.UserInfo();
    var user = UserInfoModel.fromJson(json);
    _userInfo = user.data;
    setState(() {});
  }

  _getAgent() async {
    var json = await Api.Agent();
    var result = AgentModel.fromJson(json);
    _agentData = result.data;
    setState(() {});
  }

  _getAgentList() async {
    var json = await Api.AgentList();
    var result = AgentListModel.fromJson(json);
    _init = true;
    _list.addAll(result.data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的代理'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 32.r),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: Image.network('${_userInfo?.avatar ?? 'http://api.btstu.cn/sjtx/api.php?lx=c1&format=images'}', width: 200.r, height: 200.r),
                        ),
                        Positioned(
                          bottom: -10.r,
                          child: Image.asset('assets/images/mine_proxy_level_0.png', width: 267.r, height: 60.r),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32.r),
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '升级到',
                            ),
                            TextSpan(
                              text: '青铜代理',
                              style: TextStyle(
                                color: _pink,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('分成40%'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.r),
                        child: Image.network('https://qingtingyunshejiaoxcx.youyacao.com/mine_proxy_long_arrow.png', width: 285.r, height: 30.r),
                      ),
                      Text(
                        '分成46%',
                        style: TextStyle(
                          color: _pink,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.r,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(32.r),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20.r),
                    margin: EdgeInsets.only(bottom: 32.r),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 6.r,
                          color: _pink,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    child: Text('推广收益'),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      color: _pink,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 2.r,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '今日收益',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.r,
                                  ),
                                ),
                                Text(
                                  '￥${_agentData?.todayEarnings ?? '00'}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.r,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 2.r,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '今日业绩',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.r,
                                  ),
                                ),
                                Text(
                                  '￥${_agentData?.todayPerformance ?? '0.00'}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.r,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Text(
                                  '总收入',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.r,
                                  ),
                                ),
                                Text(
                                  '￥${_agentData?.earnings ?? '0.00'}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.r,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.r,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(32.r),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20.r),
                    margin: EdgeInsets.only(bottom: 32.r),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 6.r,
                          color: _pink,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    child: Text('推广数据'),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 32.r),
                    decoration: BoxDecoration(
                      color: _grey,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        if (_init && _list.length == 0) Text('暂无数据') else for (var i = 0; i < _list.length; i++) Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_list[i].title),
                            Text('${_list[i].num}人'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.r,
                  ),
                  GestureDetector(
                    onTap: () {
                      Application.router.navigateTo(
                        context,
                        "/invite",
                        routeSettings: RouteSettings(
                          arguments: _userInfo.refcode,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 32.r),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 2.r,
                            color: _grey,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network('https://qingtingyunshejiaoxcx.youyacao.com/mine_proxy_go_promotion.png', width: 45.r, height: 45.r),
                              SizedBox(
                                width: 15.r,
                              ),
                              Text('去推广'),
                            ],
                          ),
                          Image.network('https://qingtingyunshejiaoxcx.youyacao.com/right_arrow.png', width: 28.r, height: 28.r),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
