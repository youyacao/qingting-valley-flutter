import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safemap/safemap.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/video_list.dart';
import 'package:trtc_demo/widget/tikTokCommentBottomSheet.dart';
import 'package:trtc_demo/widget/tikTokScaffold.dart';
import 'package:trtc_demo/widget/tikTokVideo.dart';
import 'package:trtc_demo/widget/tikTokVideoButtonColumn.dart';
import 'package:trtc_demo/widget/tikTokVideoPlayer.dart';

/// 单独修改了bottomSheet组件的高度
import 'package:trtc_demo/other/bottomSheet.dart' as CustomBottomSheet;

GlobalKey<_DouYinPageState> tikTokKey = GlobalKey();

class DouYinPage extends StatefulWidget {
  DouYinPage({Key key}) : super(key: key);

  @override
  _DouYinPageState createState() => _DouYinPageState();
}

class _DouYinPageState extends State<DouYinPage> with WidgetsBindingObserver {
  VideoListController _videoListController = VideoListController();
  PageController _pageController = PageController();
  List<VideoListElement> videoDataList = [];
  Map<int, bool> favoriteMap = {};
  TikTokScaffoldController tkController = TikTokScaffoldController();

  int _page = 1;
  int _limit = 10;

  Size size;

  double offset = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    _pageController
      ..addListener(() {
        if (_pageController.page == _videoListController.videoCount - 1) {
          _page++;
          loadAsset();
        }
      });
    // loadAsset();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _videoListController.currentPlayer.pause();
    super.dispose();
  }

  /// 进入后台暂停
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state != AppLifecycleState.resumed) {
      _videoListController ?? _videoListController.currentPlayer.pause();
    }
    if (state == AppLifecycleState.resumed) {
      _videoListController ?? _videoListController.currentPlayer.start();
    }
  }

  Future<String> loadAsset() async {
    var json = await Api.VideoList({'page': _page, 'limit': _limit});
    var video_list = VideoListModel.fromJson(json);
    videoDataList.addAll(video_list.data.list);
    if (_page == 1) {
      _videoListController.init(
        _pageController,
        video_list.data.list,
      );
    } else {
      _videoListController.addVideoInfo(video_list.data.list);
    }
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant StatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    size = MediaQuery.of(context).size;
    setState(() {});
  }

  int curPlayPosition = 0;

  start() {
    _videoListController.currentPlayer.start();
  }

  pause() {
    _videoListController.currentPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return _buildWidget();
  }

  Widget emptyWidgetbuildCupertinoActivityIndicator() {
    return Center(child: CupertinoActivityIndicator());
  }

  Widget _buildWidget() {
    double a = MediaQuery.of(context).size.aspectRatio;
    bool hasBottomPadding = a < 0.55;

    if (_videoListController.videoCount <= 0) {
      return emptyWidgetbuildCupertinoActivityIndicator();
    } else {
      return PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: _videoListController.videoCount,
        itemBuilder: (context, index) {
          // 拼一个视频组件出来
          var data = videoDataList[index];
          bool isF = SafeMap(favoriteMap)[index].boolean ?? false;
          var player = _videoListController.playerOfIndex(index);
          // 右侧按钮列
          Widget buttons = TikTokButtonColumn(
            isFavorite: isF,
            onAvatar: () {
              tkController.animateToPage(TikTokPagePositon.right);
            },
            onFavorite: () {
              setState(() {
                favoriteMap[index] = !isF;
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
              fit: FijkFit.fitWidth,
              player: player,
              color: Colors.black,
              panelBuilder: (_, __, ___, ____, _____) => Container(),
            ),
          );

          currentVideo = TikTokVideoPage(
            hidePauseIcon: player.state != FijkState.paused,
            aspectRatio: 9 / 16.0,
            key: Key(data.videoUrl + '$index'),
            tag: data.videoUrl,
            bottomPadding: hasBottomPadding ? 16.0 : 16.0,
            userInfoWidget: VideoUserInfo(
              desc: data.title,
              username: data.nickname != '' ? data.nickname : data.username,
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
                favoriteMap[index] = true;
              });
            },
            rightButtonColumn: buttons,
            video: currentVideo,
          );
          return currentVideo;
        },
      );
    }
  }
}
