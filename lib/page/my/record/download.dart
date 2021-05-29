import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/download_record.dart';

class DownloadRecordPage extends StatefulWidget {
  @override
  _DownloadRecordPageState createState() => _DownloadRecordPageState();
}

class _DownloadRecordPageState extends State<DownloadRecordPage> {
  bool _init = false;
  bool _lastPage = false;
  int _page = 1;
  List<DownloadRecordElement> _list = [];

  @override
  void initState() {
    // TODO: implement initState
    _getDownloadRecord();
    super.initState();
  }

  _getDownloadRecord() async {
    if (_lastPage) return;
    EasyLoading.show(status: '正在加载...');
    var json = await Api.DownloadRecord({
      'page': _page,
      'limit': 10
    });
    var result = DownloadRecordModel.fromJson(json);
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
        title: Text('下载记录'),
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
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((content, index) {
              return Padding(
                padding: EdgeInsets.only(top: 20.r, right: 30.r, left: 30.r),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 32.r),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Container(
                              width: 315.r,
                              height: 200.r,
                              color: Colors.grey[100],
                              child: Image.network(
                                _list[index].thumb,
                                width: 315.r,
                                height: 200.r,
                              ),
                            ),
                          ),
                          // Positioned(
                          //   right: 0,
                          //   bottom: 0,
                          //   left: 0,
                          //   child: Container(
                          //     padding: EdgeInsets.symmetric(vertical: 5.r),
                          //     decoration: BoxDecoration(
                          //       gradient: LinearGradient(
                          //         colors: [Colors.black12, Colors.transparent],
                          //         begin: Alignment.bottomCenter,
                          //         end: Alignment.topCenter,
                          //       ),
                          //     ),
                          //     child: Row(
                          //       children: [
                          //         Icon(
                          //           Icons.play_arrow,
                          //           color: Colors.white,
                          //         ),
                          //         Text(
                          //           '123',
                          //           style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: 28.sp,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 30.r),
                            child: Text(
                              _list[index].title,
                              style: TextStyle(
                                fontSize: 30.sp,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 10.r),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(_list[index].mtime, style: TextStyle(
                              fontSize: 24.sp,
                              color: Colors.grey,
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: _list.length),
          ),
        ],
        onRefresh: () async {},
        onLoad: () async {
          _page++;
          _getDownloadRecord();
        },
      ),
    );
  }
}
