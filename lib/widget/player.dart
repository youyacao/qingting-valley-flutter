import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trtc_demo/models/video_list.dart';
import 'package:trtc_demo/widget/player_controls.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

/***
 * 播放器部分,借鉴了部分(很多)Chewie_video的代码.实现视频播放能力.
 */
class Player extends StatefulWidget {
  VideoListElement video;

  Player(this.video);

  @override
  State<StatefulWidget> createState() {
    return PlayerState();
  }
}

class PlayerState extends State<Player> {
  static List<VideoPlayerController> player = [];
  VideoPlayerController _controller;
  static bool isWakelock = false;

  @override
  void initState() {
    super.initState();
    if (!isWakelock) {
      //这里特殊处理, initState 会在上个视频 dispose 前调用,导致屏幕常亮失效.
      Wakelock.enable();
      isWakelock = true;
    }
    var url = "assets/v2.mp4";
    print(url);
    _controller = VideoPlayerController.asset(url)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
    player.add(_controller);
  }

  @override
  Widget build(BuildContext context) {
//监听物理返回按键,做退出App 播放器释放操作
    return WillPopScope(
      onWillPop: ()async {
        await _controller.dispose();
        exit(0);
      },
      child: (_controller != null && _controller.value.isInitialized)
          ? Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),
          //底部播控条
          PlayerControls(_controller)
        ],
      )
          : Center(child: CupertinoActivityIndicator()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
    if (_controller != null) {
      _controller.dispose();
    }
    player.remove(_controller);
    if (isWakelock && player.length <= 0) {
      Wakelock.disable();
      isWakelock = false;
    }
  }
}
