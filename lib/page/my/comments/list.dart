import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/video_comments_records.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentsListPage extends StatefulWidget {
  @override
  _CommentsListPageState createState() => _CommentsListPageState();
}

class _CommentsListPageState extends State<CommentsListPage> {
  List<VideoCommentsRecordsElement> _list = [];
  int _page = 1;
  bool _lastPage = false;
  bool _init = false;

  @override
  void initState() {
    // TODO: implement initState
    _getCommentsRecords();
    super.initState();
  }

  _getCommentsRecords() async {
    if (_lastPage) return;
    EasyLoading.show(status: '正在加载...');
    var json = await Api.VideoCommentsRecords({'page': _page, 'limit': 10, 'type': 1});
    var result = VideoCommentsRecordsModel.fromJson(json);
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
        title: Text('我的评论'),
        centerTitle: true,
      ),
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      body: EasyRefresh.custom(
        footer: ClassicalFooter(
          enableInfiniteLoad: false,
        ),
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
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((content, index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(32.r),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Image.network(_list[index].avatar, width: 65.r, height: 65.r),
                                  ),
                                  SizedBox(width: 20.r),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _list[index].username,
                                        style: TextStyle(fontSize: 28.sp),
                                      ),
                                      Text(
                                        '${_list[index].mtime} · 评论',
                                        style: TextStyle(
                                          fontSize: 24.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.r),
                          child: Text(
                            _list[index].content,
                            style: TextStyle(
                              fontSize: 32.sp,
                            ),
                          ),
                        ),
                        Container(
                          height: 95.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Color.fromRGBO(249, 249, 249, 1),
                          ),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                                  child: Text(
                                    _list[index].title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
                                child: Image.network(
                                  _list[index].thumb,
                                  width: 95.r,
                                  height: 95.r,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 15.r,
                  ),
                ],
              );
            }, childCount: _list.length,),
          ),
        ],
        onRefresh: () async {},
        onLoad: () async {
          _page++;
          _getCommentsRecords();
        },
      ),
    );
  }
}
