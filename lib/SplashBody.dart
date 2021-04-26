import 'dart:async';

import 'package:flutter/material.dart';
import 'page/config/application.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    startTime();
    super.initState();
  }

  startTime() {
    _timer = Timer(Duration(milliseconds: 3000), (){
      _timer.cancel();
      Application.router.navigateTo(context, "/", clearStack: true,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Application.router.navigateTo(context, "/", clearStack: true,);
            },
            child: Image.network(
              'http://api.btstu.cn/sjbz/api.php?lx=fengjing&format=images',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
