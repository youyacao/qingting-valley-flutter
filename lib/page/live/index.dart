import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/user_list.dart';
import 'package:trtc_demo/page/config/application.dart';
import 'package:trtc_demo/provider/jmessage_manager_provider.dart';

class LivePage extends StatefulWidget {
  LivePage({ this.initialIndex = 0 });
  final int initialIndex;
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> with SingleTickerProviderStateMixin {
  Color _colorRed = Color.fromRGBO(236, 97, 94, 1);
  TabController _tabController;
  List tabs = ["1v1", "直播"];
  int _page1 = 1;
  bool _lastPage1 = false;
  bool _init1 = false;
  List<UserListElement> _list1 = [];

  @override
  void initState() {
    _getUserList();
    _tabController = TabController(length: tabs.length, vsync: this, initialIndex: widget.initialIndex);
    super.initState();
  }

  _getUserList() async {
    if (_lastPage1) return;
    EasyLoading.show(status: '正在加载...');
    var json = await Api.UserList({'page': _page1, 'limit': 10});
    _init1 = true;
    EasyLoading.dismiss();
    var result = UserListModel.fromJson(json);
    _list1.addAll(result.data.list);
    if (result.data.totalPage == 0 || result.data.currentPage >= result.data.totalPage) {
      _lastPage1 = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
              decoration: BoxDecoration(
                color: _colorRed,
              ),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: TabBar(
                      isScrollable: true,
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.symmetric(vertical: 8),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: Color.fromRGBO(255, 255, 255, 0.3),
                      ),
                      tabs: tabs
                          .map((e) => Tab(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Text(e),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 16.w,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.search_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Application.router.navigateTo(context, "/search_friends");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                controller: _tabController,
                children: [
                  lianMai(),
                  zhiBo(),
                ],
              ),
            ),
          ],
        ),
      ),
      value: SystemUiOverlayStyle.light,
    );
  }

  lianMai() {
    return EasyRefresh.custom(
      emptyWidget: _init1 && _list1.length == 0
          ? Container(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(),
                    flex: 2,
                  ),
                  SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset('assets/images/nodata.png'),
                  ),
                  Text(
                    '没有数据',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: 3,
                  ),
                ],
              ),
            )
          : null,
      footer: ClassicalFooter(
        enableInfiniteLoad: false,
      ),
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(24.r),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (content, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 24.r,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.02),
                          blurRadius: 8.r,
                          spreadRadius: 0,
                          offset: Offset(0, 4.r),
                        ),
                      ],
                    ),
                    height: 100.h,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.network(
                            _list1[index].avatar,
                            width: 100.h,
                            height: 100.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.r,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _list1[index].username,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 32.sp,
                                  ),
                                ),
                                // Text(
                                //   '韩国美女小姐姐叫你连麦了',
                                //   maxLines: 1,
                                //   overflow: TextOverflow.ellipsis,
                                // ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.r),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(_colorRed),
                              foregroundColor: MaterialStateProperty.all(Colors.white),
                            ),
                            child: Text('进入'),
                            onPressed: () {
                              _getMyInfo(_list1[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: _list1.length,
            ),
          ),
        ),
      ],
      onRefresh: () async {},
      onLoad: () async {
        _page1++;
        _getUserList();
      },
    );
  }

  _getMyInfo(UserListElement arguments) async {
    JMUserInfo user = await JMessage.getMyInfo();
    if (user != null) {
      await JMessage.getUserInfo(username: arguments.username).then((value) {
        Application.router.navigateTo(context, "/chat",
            routeSettings: RouteSettings(
              arguments: arguments,
            ));
      }, onError: (error) {
        Fluttertoast.showToast(
          msg: '该用户还未注册IM',
          gravity: ToastGravity.CENTER,
        );
      });
    } else {
      Application.router.navigateTo(context, "/login");
    }
  }

  zhiBo() {
    return EasyRefresh.custom(
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(24.r),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 24.r, mainAxisSpacing: 24.r),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.02),
                        blurRadius: 8.r,
                        spreadRadius: 0,
                        offset: Offset(0, 2.r),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        // borderRadius: BorderRadius.circular(8.r),
                        child: Image.network(
                          'http://api.btstu.cn/sjbz/api.php?lx=dongman&format=images',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10.r,
                        right: 10.r,
                        child: Container(
                          height: 40.h,
                          padding: EdgeInsets.symmetric(horizontal: 15.r),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(20.h),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: Colors.white,
                                size: 32.sp,
                              ),
                              Text(
                                '1230',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black45,
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Text(
                            '小姐姐在直播间等你喔',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ),
      ],
      onRefresh: () async {},
      onLoad: () async {},
    );
  }
}
