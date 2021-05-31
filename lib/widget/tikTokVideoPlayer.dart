import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:trtc_demo/models/video_list.dart';

class VideoListController {
  /// 构造方法
  VideoListController();

  /// 捕捉滑动，实现翻页
  void setPageContrller(PageController pageController) {
    pageController.addListener(() {
      var p = pageController.page ?? 1;
      if (p % 1 == 0) {
        int target = p ~/ 1;
        if (index.value == target) return;
        // 播放当前的，暂停其他的
        var oldIndex = index.value;
        var newIndex = target;
        playerOfIndex(oldIndex).seekTo(0);
        playerOfIndex(oldIndex).pause();
        playerOfIndex(newIndex).start();
        // 完成
        index.value = target;
      }
    });
  }

  /// 获取指定index的player
  FijkPlayer playerOfIndex(int index) => playerList[index];

  /// 视频总数目
  int get videoCount => playerList.length;

  /// 在当前的list后面继续增加视频，并预加载封面
  addVideoInfo(List<VideoListElement> list) {
    for (var info in list) {
      playerList.add(
        FijkPlayer()
          ..setDataSource(
            info.videoUrl,
            showCover: true,
          )
          ..setLoop(0),
      );
    }
  }

  /// 初始化
  init(PageController pageController, List<VideoListElement> initialList) {
    print(initialList);
    addVideoInfo(initialList);
    setPageContrller(pageController);
  }

  /// 目前的视频序号
  ValueNotifier<int> index = ValueNotifier<int>(0);

  /// 视频列表
  List<FijkPlayer> playerList = [];

  ///
  FijkPlayer get currentPlayer => playerList[index.value];

  bool get isPlaying => currentPlayer.state == FijkState.started;

  /// 销毁全部
  void dispose() {
    for (var player in playerList) {
      player.dispose();
    }
    playerList = [];
  }
}
