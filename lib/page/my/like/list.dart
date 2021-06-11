import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/video_likes_records.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoLikesListPage extends StatefulWidget {
  @override
  _VideoLikesListPageState createState() => _VideoLikesListPageState();
}

class _VideoLikesListPageState extends State<VideoLikesListPage> {
  List<VideoLikesRecordsElement> _list = [];
  int _page = 1;
  bool _lastPage = false;
  bool _init = false;

  @override
  void initState() {
    // TODO: implement initState
    _getVideoLikesRecord();
    super.initState();
  }

  _getVideoLikesRecord() async {
    if (_lastPage) return;
    EasyLoading.show(status: '正在加载...');

    var json = await Api.VideoLikesList({'page': _page, 'limit': 10, 'type': 1});

    var result = VideoLikesRecordsModel.fromJson(json);

    EasyLoading.dismiss();
    _init = true;
    _list.addAll(result.data.list);
    if (result.data.totalPage == 0 || result.data.currentPage >= result.data.totalPage) {
      _lastPage = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的喜欢'),
        centerTitle: true,
      ),
      body: EasyRefresh.custom(
        emptyWidget: _init && _list.length == 0
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
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 3, mainAxisSpacing: 3),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Stack(
                  children: [
                    Image.network(_list[index].video.thumb, width: double.infinity, height: double.infinity, fit: BoxFit.cover),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 5.r),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black38],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                        child: Text(
                          _list[index].video.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15.r,
                      right: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 28.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.r, right: 20.r),
                            child: Text(
                              '${_list[index].video.likeNum}',
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              childCount: _list.length,
            ),
          ),
        ],
        onRefresh: () async {},
        onLoad: () async {
          _page++;
          _getVideoLikesRecord();
        },
      ),
    );
  }
}
