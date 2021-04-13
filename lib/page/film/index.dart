import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/category.dart';

class FilmPage extends StatefulWidget {
  @override
  _FilmPageState createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> with TickerProviderStateMixin {
  Color _colorRed = Color.fromRGBO(236, 97, 94, 1);
  TabController _tabController;
  List tabs = [];
  int itemCount = 3;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _getCategory();
  }

  _getCategory() async {
    var json = await Api.Category();
    var _categoryData = CategoryModel.fromJson(json);
    setState(() {
      tabs = _categoryData.data[0].children;
      _tabController = TabController(length: tabs.length, vsync: this);
    });
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
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 8.r,
                      right: 8.r,
                      bottom: 0,
                      left: 8.r,
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                            ),
                            height: 35.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(17.5.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 8.w,
                                  ),
                                  child: Text(
                                    '小楼昨夜又东风',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            Icons.history,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                        Container(
                          child: Icon(
                            Icons.download_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      isScrollable: true,
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                        // color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                      tabs: tabs.map((e) {
                        print(e);
                        return Tab(text: e.name);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                controller: _tabController,
                children: tabs.map((e) {
                  return EasyRefresh.custom(
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 195.h,
                              child: Swiper(
                                itemBuilder: (BuildContext context, int index) {
                                  return Image.network(
                                    "http://via.placeholder.com/350x150",
                                    fit: BoxFit.cover,
                                  );
                                },
                                itemCount: itemCount,
                                // autoplay: true,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.r),
                              child: Text('今日热播'),
                            ),
                          ],
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        sliver: SliverGrid(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.r,
                            mainAxisSpacing: 8.r,
                            // childAspectRatio: 1.2,
                          ),
                          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Flex(
                                  direction: Axis.vertical,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Image.network(
                                        'http://api.btstu.cn/sjbz/api.php?lx=dongman&format=images',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                                      decoration: BoxDecoration(
                                          // color: Colors.blue,
                                          ),
                                      height: 32.h,
                                      child: Text(
                                        '下面会提供出来本地插件，供大家使用下载',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // child: Container(
                              //   decoration: BoxDecoration(
                              //     color: Colors.white,
                              //   ),
                              //   child: Column(
                              //     children: [
                              //       Image.network('http://api.btstu.cn/sjbz/api.php?lx=dongman&format=images', width: double.infinity, height: 110, fit: BoxFit.cover,),
                              //       Padding(
                              //         padding: EdgeInsets.only(
                              //           top: 8.h,
                              //           left: 8.w,
                              //           right: 8.w,
                              //         ),
                              //         child: Text(
                              //           '要同时滚动ListView和GridView的时候可以使用SliverList和SliverGrid。',
                              //           maxLines: 1,
                              //           overflow: TextOverflow.ellipsis,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            );
                          }, childCount: 20),
                        ),
                      ),
                    ],
                    onRefresh: () async {
                      _getCategory();
                    },
                    onLoad: () async {},
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      value: SystemUiOverlayStyle.light,
    );
  }
}
