import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'http/api.dart';
import 'models/video_banner.dart';
import 'page/config/application.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  Timer _timer;
  List<VideoBannerElement> _banner = [];
  bool _init = false;

  @override
  void initState() {
    // TODO: implement initState
    _getBanner();
    super.initState();
  }

  _getBanner() async {
    var json = await Api.Banner(1);
    _init = true;
    startTime();
    var result = VideoBannerModel.fromJson(json);
    _banner.addAll(result.data);
    setState(() {});
  }

  /// 打开外部浏览器
  void _launchURL(String url) async => await canLaunch(url)
      ? await launch(url)
      : Fluttertoast.showToast(
          msg: '请配置正确的URL网址',
          gravity: ToastGravity.CENTER,
        );

  startTime() {
    _timer = Timer(Duration(milliseconds: 3000), () {
      _timer.cancel();
      Application.router.navigateTo(
        context,
        "/",
        clearStack: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (_banner.length > 0) {
                _launchURL(_banner[0].adUrl);
              } else {
                Application.router.navigateTo(context, "/", clearStack: true);
              }
            },
            child: _buildAD(),
          ),
        ],
      ),
    );
  }

  _buildAD() {
    if (_banner.length > 0) {
      return Image.network(
        _banner[0].imgUrl,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.contain,
      );
    }
    return SizedBox();
  }
}
