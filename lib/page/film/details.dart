import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/video_list.dart';
import 'package:trtc_demo/page/config/application.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilmDetailsPage extends StatefulWidget {
  FilmDetailsPage({this.video});

  final VideoListElement video;

  @override
  _FilmDetailsPageState createState() => _FilmDetailsPageState();
}

class _FilmDetailsPageState extends State<FilmDetailsPage> with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  TabController _tabController;
  Color _colorRed = Color.fromRGBO(255, 68, 68, 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePlayer();
    _tabController = TabController(length: 2, vsync: this);
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.video.videoUrl);
    await Future.wait([
      _videoPlayerController.initialize(),
    ]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
    setState(() {});
  }

  _followUser() async {
    Api.FollowUser({
      'follow_id': widget.video.userId
    }).then((value) {
      print(value.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 360.h + MediaQuery.of(context).padding.top,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Stack(
                  children: [
                    _chewieController != null && _chewieController.videoPlayerController.value.isInitialized
                        ? Chewie(
                            controller: _chewieController,
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(),
                                SizedBox(height: 20),
                                Text('Loading'),
                              ],
                            ),
                          ),
                    Positioned(
                      top: 15.h,
                      left: 24.w,
                      right: 24.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Application.router.pop(context);
                            },
                            child: Icon(
                              Icons.keyboard_backspace,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(232, 234, 236, 1),
                    ),
                  ),
                ),
                child: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Color.fromRGBO(23, 35, 61, 1),
                  unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.65),
                  tabs: [
                    Tab(
                      child: Text('简介'),
                    ),
                    Tab(
                      child: Text('评论 0'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              children: [
                EasyRefresh.custom(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 24.r,
                          right: 24.r,
                          top: 24.r,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: 15.r,
                                        ),
                                        child: ClipOval(
                                          child: Image.network(
                                            widget.video.avatar,
                                            width: 80.r,
                                            height: 80.r,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 2.r),
                                            child: Text(
                                              widget.video.nickname != ''
                                                  ? widget.video.nickname
                                                  : widget.video.username,
                                              style: TextStyle(
                                                fontSize: 28.sp,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '2810粉丝 - 19视频',
                                            style: TextStyle(
                                              fontSize: 24.sp,
                                              color: Color.fromRGBO(128, 134, 149, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: _followUser,
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(BorderSide(
                                      color: _colorRed,
                                    )),
                                    foregroundColor: MaterialStateProperty.all(_colorRed),
                                    minimumSize: MaterialStateProperty.all(Size.square(28)),
                                    // padding: MaterialStateProperty.all(EdgeInsets.zero),
                                  ),
                                  child: Text('关注'),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10.r,
                                bottom: 5.r,
                              ),
                              child: Text(
                                widget.video.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              '原创 · 19.7万次观看 · 10-16发布',
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: Color.fromRGBO(128, 134, 149, 1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 24.r,
                                bottom: 24.r,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.thumb_up_alt_outlined),
                                      Text('883'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.ios_share),
                                      Text('分享'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.star_border_rounded),
                                      Text('883'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.save_alt_outlined),
                                      Text('缓存'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (content, index) {
                          return Container(
                            padding: EdgeInsets.only(
                              left: 24.r,
                              right: 24.r,
                              top: 24.r,
                            ),
                            height: 160.h,
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    right: 24.w,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: Image.network(
                                      'http://api.btstu.cn/sjbz/api.php?lx=dongman&format=images',
                                      width: 295.w,
                                      height: 160.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '如果我们想剪裁子组件的特定区域，比如，在上面示例的图片中，如果我们只想截取图片中部40×30像素的范围应该怎么做？',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 10.h,
                                        ),
                                        child: Text(
                                          '暴走漫画 · 19.7万次观看',
                                          style: TextStyle(
                                            fontSize: 24.sp,
                                            color: Color.fromRGBO(128, 134, 149, 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        childCount: 12,
                      ),
                    ),
                  ],
                  onRefresh: () async {},
                  onLoad: () async {},
                ),
                Padding(padding: EdgeInsets.all(14.r,), child: Text('没有数据'),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
