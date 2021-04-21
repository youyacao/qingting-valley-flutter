import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  PageController _pageController = PageController();
  List _list = [];

  @override
  void initState() {
    // TODO: implement initState
    _list = [1, 2, 3, 4, 5];
    _pageController.addListener(() {
      if (_pageController.page.round() == _list.length - 2) {
        _list.addAll([6, 7, 8, 9, 10]);
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, i) {
        return Container(
          child: Text('${i}'),
        );
      }, itemCount: _list.length,),
    );
  }
}
