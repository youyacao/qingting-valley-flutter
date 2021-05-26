import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/follow_list.dart';

class FollowListPage extends StatefulWidget {
  @override
  _FollowListPageState createState() => _FollowListPageState();
}

class _FollowListPageState extends State<FollowListPage> {
  int _page = 1;
  List<FollowListElement> _list = [];
  bool _lastPage = false;
  bool _init = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fansList();
  }

  _fansList() async {
    if (_lastPage) return;
    EasyLoading.show(status: '正在加载...');
    var json = await Api.FollowList({'page': _page, 'limit': 10});
    EasyLoading.dismiss();
    _init = true;
    var result = FollowListModel.fromJson(json);
    if (result.data.list.length > 0) {
      if (_page == 1) {
        _list = [];
      }
      _list.addAll(result.data.list);
    }
    if (result.data.totalPage == 0 || result.data.currentPage >= result.data.totalPage) {
      _lastPage = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的关注'),
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
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          _list[index].avatar,
                          width: 90.r,
                          height: 90.r,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.r),
                        child: Text(
                          _list[index].nickname != '' ? _list[index].nickname : _list[index].username,
                          style: TextStyle(
                            fontSize: 28.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }, childCount: _list.length),
          ),
        ],
        onRefresh: () async {
          _page = 1;
          _fansList();
        },
        onLoad: () async {
          _page++;
          _fansList();
        },
      ),
    );
  }
}
