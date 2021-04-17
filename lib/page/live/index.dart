import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> with SingleTickerProviderStateMixin {
  Color _colorRed = Color.fromRGBO(236, 97, 94, 1);
  TabController _tabController;
  List tabs = ["1v1", "直播"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
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
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
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
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(14.r),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (content, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 14.r,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.02),
                          blurRadius: 4.r,
                          spreadRadius: 0,
                          offset: Offset(0, 2.r),
                        ),
                      ],
                    ),
                    height: 90.h,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            'http://api.btstu.cn/sjbz/api.php?lx=dongman&format=images',
                            width: 90.r,
                            height: 90.r,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.r,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 4.r,
                                  ),
                                  child: Text(
                                    '韩国XJJ',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                                Text(
                                  '韩国美女小姐姐叫你连麦了',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 7.r),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(_colorRed),
                              foregroundColor: MaterialStateProperty.all(Colors.white),
                            ),
                            child: Text('进入'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 15,
            ),
          ),
        ),
      ],
      onRefresh: () async {},
      onLoad: () async {},
    );
  }

  zhiBo() {
    return EasyRefresh.custom(
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(14.r),
          sliver: SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 14.r, mainAxisSpacing: 14.r),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.02),
                        blurRadius: 4.r,
                        spreadRadius: 0,
                        offset: Offset(0, 2.r),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          'http://api.btstu.cn/sjbz/api.php?lx=dongman&format=images',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 7.r,
                        right: 7.r,
                        child: Container(
                          height: 24.h,
                          padding: EdgeInsets.symmetric(horizontal: 8.r),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(12.h),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.local_fire_department, color: Colors.white, size: 18.sp,),
                              Text('1230', style: TextStyle(
                                color: Colors.white,
                              ),),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(7.r),
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
                          child: Text('小姐姐在直播间等你喔', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(
                            color: Colors.white,
                          ),),
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
