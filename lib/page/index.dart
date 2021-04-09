import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trtc_demo/page/douyin/index.dart';
import 'package:trtc_demo/page/film/index.dart';
import 'package:trtc_demo/page/live/index.dart';
import 'package:trtc_demo/page/my/index.dart';

import 'config/application.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectedIndex = 0;
  Color _selectdColor = Color.fromRGBO(236, 97, 94, 1);
  Color _unselectdColor = Colors.black;
  List<Map> _bottomBarItems = [
    {
      'url': '/',
      'label': '首页'
    },
    {
      'url': '/live',
      'label': '直播'
    },
    {
      'url': '/create/live',
      'label': ''
    },
    {
      'url': '/douyin',
      'label': '抖音'
    },
    {
      'url': '/my',
      'label': '我的'
    },
  ];
  List _pages = [FilmPage(), LivePage(), '', DouYinPage(), MyPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 50.h,
        decoration: BoxDecoration(color: Colors.white),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            for (var i = 0; i < _bottomBarItems.length; i++)
              if (_bottomBarItems[i]['label'] == '')
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Application.router.navigateTo(context, "/create_live");
                    },
                    child: Center(
                      child: Container(
                        height: 28.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          color: _selectdColor,
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              else
                _bottomBarItem(_bottomBarItems[i], i)
          ],
        ),
      ),
    );
  }

  Widget _bottomBarItem(Map item, int index) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => _onItemTapped(index, item['url']),
        child: Center(
          child: Text(
            item['label'],
            style: TextStyle(
              color: _selectedIndex == index ? _selectdColor : _unselectdColor,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index, String url) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
