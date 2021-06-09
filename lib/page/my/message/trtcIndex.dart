import 'package:flutter/material.dart';
import 'package:trtc_demo/TRTCChatSalonDemo/model/TRTCChatSalon.dart';
import 'package:trtc_demo/page/config/application.dart';
import 'package:trtc_demo/utils/TxUtils.dart';
import 'package:trtc_demo/utils/constants.dart' as constants;

class TRTCIndexPage extends StatefulWidget {
  @override
  _TRTCIndexPageState createState() => _TRTCIndexPageState();
}

class _TRTCIndexPageState extends State<TRTCIndexPage> {
  TRTCChatSalon trtcVoiceRoom;

  Future<bool> logout() {
    var showDialog2 = showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('确定退出登录吗?'),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            // ignore: deprecated_member_use
            FlatButton(
              child: Text('确定'),
              onPressed: () {
                //关闭对话框并返回true
                trtcVoiceRoom.logout();
                //TRTCChatSalon.destroySharedInstance();
                TxUtils.setStorageByKey(constants.USERID_KEY, '');
                Navigator.popAndPushNamed(
                  context,
                  "/login",
                );
              },
            ),
          ],
        );
      },
    );
    return showDialog2;
  }

  goVoiceRoomDemo() {
    Navigator.pushReplacementNamed(
      context,
      "/chatSalon/list",
    );
  }

  goCallingDemo(isVideo) {
    Application.router
        .navigateTo(context, isVideo ? "/video_contact" : "/audio_contact");
  }

  Widget getTitleItem(String title, String imgUrl, Function onTap) {
    var titleItem = Container(
      height: 80.0,
      color: Color.fromRGBO(30, 57, 103, 1),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  onTap();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      imgUrl,
                      height: 44,
                      width: 44,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
    return titleItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.person),
        //   tooltip: '退出',
        //   onPressed: () async {
        //     await logout();
        //   },
        // ),
        title: Text('TRTC'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(14, 25, 44, 1),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(
              "assets/images/bg_main_title.png",
            ),
            alignment: Alignment.topCenter,
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.0, 1.0],
            colors: [
              Color.fromRGBO(19, 41, 75, 1),
              Color.fromRGBO(0, 0, 0, 1),
            ],
          ),
        ),
        padding: EdgeInsets.only(top: 150, left: 20, right: 20),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 30, crossAxisSpacing: 30),
          children: <Widget>[
            // this.getTitleItem(
            //   '语音沙龙',
            //   "assets/images/ChatSalon.png",
            //   () {
            //     goVoiceRoomDemo();
            //   },
            // ),
            this.getTitleItem(
              '视频通话',
              "assets/images/callingDemo/videoCall.png",
              () {
                goCallingDemo(true);
              },
            ),
            this.getTitleItem(
              '语音通话',
              "assets/images/callingDemo/videoCall.png",
              () {
                goCallingDemo(false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
