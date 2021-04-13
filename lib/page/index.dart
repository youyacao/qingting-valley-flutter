import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trtc_demo/page/douyin/index.dart';
import 'package:trtc_demo/page/film/index.dart';
import 'package:trtc_demo/page/live/create.dart';
import 'package:trtc_demo/page/live/index.dart';
import 'package:trtc_demo/page/my/index.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectedIndex = 0;
  Color _selectdColor = Color.fromRGBO(236, 97, 94, 1);
  Color _unselectdColor = Colors.black;
  List _bottomBarItems = ['首页', '直播', '', '抖音', '我的'];

  List<StatefulWidget> _indexedStackChildren() {
    return [FilmPage(), LivePage(), CreateLivePage(), DouYinPage(), MyPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        alignment: AlignmentDirectional.center,
        sizing: StackFit.expand,
        index: _selectedIndex,
        children: _indexedStackChildren(),
      ),
      bottomNavigationBar: Container(
        height: 50.h,
        decoration: BoxDecoration(color: Colors.white),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            for (var i = 0; i < _bottomBarItems.length; i++)
              if (_bottomBarItems[i] == '')
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      _onItemTapped(2);
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

  Widget _bottomBarItem(String label, int index) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? _selectdColor : _unselectdColor,
              fontSize: ScreenUtil().setSp(14),
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
