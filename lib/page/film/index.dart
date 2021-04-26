import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/category.dart';
import 'package:trtc_demo/models/video_list.dart';
import 'package:trtc_demo/page/config/application.dart';

class FilmPage extends StatefulWidget {
  @override
  _FilmPageState createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> with TickerProviderStateMixin {
  Color _colorRed = Color.fromRGBO(236, 97, 94, 1);
  TabController _tabController;
  List tabs = [];
  int itemCount = 3;
  List _page = [];
  List _videoList = [];
  List _init = [];
  List _noData = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _getCategory();
  }

  _getCategory() async {
    EasyLoading.show(status: 'loading...');
    var json = await Api.Category();
    var _categoryData = CategoryModel.fromJson(json);
    setState(() {
      tabs = _categoryData.data[0].children;
      for (var i = 0; i < tabs.length; i++) {
        _videoList.add([]);
        _init.add(false);
        _noData.add(false);
        _page.add(1);
      }
      _getVideoList();
      _tabController = TabController(length: tabs.length, vsync: this)
        ..addListener(() {
          if (_videoList[_tabController.index].length == 0) {
            _getVideoList();
          }
        });
    });
  }

  _getVideoList() async {
    if (_page[_tabController.index] > 1) EasyLoading.show(status: 'loading...');
    var json = await Api.VideoList({'page': _page[_tabController.index], 'limit': 10, 'category_id': tabs[_tabController.index].id});
    var video_list = VideoListModel.fromJson(json);
    setState(() {
      _videoList[_tabController.index].addAll(video_list.data.list);
    });
    if (video_list.data.totalPage == 0 || video_list.data.currentPage > video_list.data.totalPage) {
      _noData[_tabController.index] = true;
    }
    _init[_tabController.index] = true;
    EasyLoading.dismiss();
  }

  _onTap(VideoListElement video) {
    Application.router.navigateTo(context, "/film_details", routeSettings: RouteSettings(
      arguments: video,
    ));
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
                              horizontal: 15.w,
                            ),
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.h),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.w,
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
                          onPressed: () {
                            Application.router.navigateTo(context, "/login");
                          },
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
                      tabs: tabs.asMap().entries.map((entry) {
                        return Tab(text: '${entry.value.name}');
                      }).toList(),
                      // tabs: tabs.map((e) => Tab(text: e.name,)).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                controller: _tabController,
                children: tabs.asMap().entries.map((entry) {
                  return EasyRefresh.custom(
                    footer: ClassicalFooter(
                      enableInfiniteLoad: false,
                    ),
                    // emptyWidget: _videoList[entry.key].length == 0
                    //     ? Container(
                    //         height: double.infinity,
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: <Widget>[
                    //             Expanded(
                    //               child: SizedBox(),
                    //               flex: 2,
                    //             ),
                    //             SizedBox(
                    //               width: 100.0,
                    //               height: 100.0,
                    //               child: Image.asset('assets/images/nodata.png'),
                    //             ),
                    //             Text(
                    //               '没有数据',
                    //               style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
                    //             ),
                    //             Expanded(
                    //               child: SizedBox(),
                    //               flex: 3,
                    //             ),
                    //           ],
                    //         ),
                    //       )
                    //     : null,
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 350.h,
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
                              padding: EdgeInsets.all(24.r),
                              child: Text('今日热播'),
                            ),
                          ],
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                        ),
                        sliver: _videoList[entry.key].length == 0 && _init[_tabController.index] ? SliverToBoxAdapter(child: Center(child: Text('没有数据'),),) : SliverGrid(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.r,
                            mainAxisSpacing: 16.r,
                            // childAspectRatio: 1.2,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              if (_videoList[entry.key].length > 0) {
                                return GestureDetector(
                                  onTap: () => _onTap(_videoList[entry.key][index]),
                                  child: ClipRRect(
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
                                              _videoList[entry.key][index].thumb,
                                              height: double.infinity,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                                            decoration: BoxDecoration(
                                              // color: Colors.blue,
                                            ),
                                            height: 60.h,
                                            child: Text(
                                              _videoList[entry.key][index].title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                            childCount: _videoList[entry.key].length,
                          ),
                        ),
                      ),
                    ],
                    onRefresh: () async {
                      _getCategory();
                    },
                    onLoad: () async {
                      if (_noData[_tabController.index]) return false;
                      _page[_tabController.index]++;
                      _getCategory();
                    },
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
