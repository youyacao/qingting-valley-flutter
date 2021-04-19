import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:safemap/safemap.dart';
import 'package:trtc_demo/mock/video.dart';
import 'package:trtc_demo/widget/tikTokCommentBottomSheet.dart';
import 'package:trtc_demo/widget/tikTokScaffold.dart';
import 'package:trtc_demo/widget/tikTokVideo.dart';
import 'package:trtc_demo/widget/tikTokVideoButtonColumn.dart';
import 'package:trtc_demo/widget/tikTokVideoPlayer.dart';

/// 单独修改了bottomSheet组件的高度
import 'package:trtc_demo/other/bottomSheet.dart' as CustomBottomSheet;

GlobalKey<_DouYinPageState> tikTokKey = GlobalKey();

class DouYinPage extends StatefulWidget {
  DouYinPage({
    Key key,
  }) : super(key: key);

  @override
  _DouYinPageState createState() => _DouYinPageState();
}

class _DouYinPageState extends State<DouYinPage> with WidgetsBindingObserver {
  PageController _pageController = PageController();
  VideoListController _videoListController = VideoListController();
  List<UserVideo> videoDataList = [];
  TikTokScaffoldController tkController = TikTokScaffoldController();

  /// 记录点赞
  Map<int, bool> favoriteMap = {};

  @override
  void initState() {
    videoDataList = UserVideo.fetchVideo();
    WidgetsBinding.instance.addObserver(this);
    _videoListController.init(
      _pageController,
      videoDataList,
    );
    tkController.addListener(() {
      if (tkController.value == TikTokPagePositon.middle) {
        _videoListController.currentPlayer.start();
      } else {
        _videoListController.currentPlayer.pause();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _videoListController.currentPlayer.pause();
    super.dispose();
  }

  start() {
    _videoListController.currentPlayer.start();
  }

  pause() {
    _videoListController.currentPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    double a = MediaQuery.of(context).size.aspectRatio;
    bool hasBottomPadding = a < 0.55;

    return Scaffold(
      body: PageView.builder(
        key: Key('douyin'),
        controller: _pageController,
        pageSnapping: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: _videoListController.videoCount,
        itemBuilder: (context, i) {
          // 拼一个视频组件出来
          var data = videoDataList[i];
          bool isF = SafeMap(favoriteMap)[i].boolean ?? false;
          var player = _videoListController.playerOfIndex(i);
          // 右侧按钮列
          Widget buttons = TikTokButtonColumn(
            isFavorite: isF,
            onAvatar: () {
              tkController.animateToPage(TikTokPagePositon.right);
            },
            onFavorite: () {
              setState(() {
                favoriteMap[i] = !isF;
              });
              // showAboutDialog(context: context);
            },
            onComment: () {
              CustomBottomSheet.showModalBottomSheet(
                backgroundColor: Colors.white.withOpacity(0),
                context: context,
                builder: (BuildContext context) => TikTokCommentBottomSheet(),
              );
            },
            onShare: () {},
          );
          // video
          Widget currentVideo = Center(
            child: FijkView(
              fit: FijkFit.fitHeight,
              player: player,
              color: Colors.black,
              panelBuilder: (_, __, ___, ____, _____) => Container(),
            ),
          );

          currentVideo = TikTokVideoPage(
            hidePauseIcon: player.state != FijkState.paused,
            aspectRatio: 9 / 16.0,
            key: Key(data.url + '$i'),
            tag: data.url,
            bottomPadding: hasBottomPadding ? 16.0 : 16.0,
            userInfoWidget: VideoUserInfo(
              desc: data.desc,
              bottomPadding: hasBottomPadding ? 16.0 : 50.0,
              // onGoodGift: () => showDialog(
              //   context: context,
              //   builder: (_) => FreeGiftDialog(),
              // ),
            ),
            onSingleTap: () async {
              if (player.state == FijkState.started) {
                await player.pause();
              } else {
                await player.start();
              }
              setState(() {});
            },
            onAddFavorite: () {
              setState(() {
                favoriteMap[i] = true;
              });
            },
            rightButtonColumn: buttons,
            video: currentVideo,
          );
          return currentVideo;
        },
      ),
    );
  }
}
