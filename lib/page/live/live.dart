import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveListPage extends StatefulWidget {
  @override
  _LiveListPageState createState() => _LiveListPageState();
}

class _LiveListPageState extends State<LiveListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh.custom(
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
      ),
    );
  }
}
