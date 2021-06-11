import 'package:trtc_demo/TRTCCallingDemo/ui/TRTCCallingContact.dart';
import 'package:trtc_demo/TRTCCallingDemo/ui/VideoCall/TRTCCallingVideo.dart';
import 'package:trtc_demo/TRTCCallingDemo/ui/base/CallingScenes.dart';
import 'package:trtc_demo/models/user_list.dart';
import 'package:trtc_demo/page/chat/chat.dart';
import 'package:trtc_demo/page/film/details.dart';
import 'package:trtc_demo/page/friends/add_friends.dart';
import 'package:trtc_demo/page/friends/search_friends.dart';
import 'package:trtc_demo/page/index.dart';
import 'package:trtc_demo/page/live/create.dart';
import 'package:trtc_demo/page/live/index.dart';
import 'package:trtc_demo/page/login/ProfileManager_Mock.dart';
import 'package:trtc_demo/page/login/index.dart';
import 'package:trtc_demo/page/my/carmi/exchange.dart';
import 'package:trtc_demo/page/my/comments/list.dart';
import 'package:trtc_demo/page/my/fans/list.dart';
import 'package:trtc_demo/page/my/follow/list.dart';
import 'package:trtc_demo/page/my/invite/index.dart';
import 'package:trtc_demo/page/my/invite/list.dart';
import 'package:trtc_demo/page/my/like/list.dart';
import 'package:trtc_demo/page/my/message/trtcIndex.dart';
import 'package:trtc_demo/page/my/record/download.dart';
import 'package:trtc_demo/page/my/record/play.dart';
import 'package:trtc_demo/page/my/task/center.dart';
import 'package:trtc_demo/page/my/vip/recharge.dart';
import 'package:trtc_demo/page/trtcmeetingdemo/setting.dart';
import '../helpers/color_helpers.dart';
import '../demo/demo_simple_component.dart';
import 'package:flutter/painting.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var rootHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});

var demoRouteHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String message = params["message"]?.first;
  String colorHex = params["color_hex"]?.first;
  String result = params["result"]?.first;
  Color color = Color(0xFFFFFFFF);
  if (colorHex != null && colorHex.length > 0) {
    color = Color(ColorHelpers.fromHexString(colorHex));
  }
  return DemoSimpleComponent(message: message, color: color, result: result);
});

var demoFunctionHandler = Handler(
    type: HandlerType.function,
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String message = params["message"]?.first;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Hey Hey!",
              style: TextStyle(
                color: const Color(0xFF00D6F7),
                fontFamily: "Lazer84",
                fontSize: 22.0,
              ),
            ),
            content: Text("$message"),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("OK"),
                ),
              ),
            ],
          );
        },
      );
      return;
    });

/// Handles deep links into the app
/// To test on Android:
///
/// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
var deepLinkHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String colorHex = params["color_hex"]?.first;
  String result = params["result"]?.first;
  Color color = Color(0xFFFFFFFF);
  if (colorHex != null && colorHex.length > 0) {
    color = Color(ColorHelpers.fromHexString(colorHex));
  }
  return DemoSimpleComponent(message: "DEEEEEP LINK!!!", color: color, result: result);
});

var douyinHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SettingPage();
});

var liveHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LivePage();
});

var createLiveHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CreateLivePage();
});

var filmDetailsHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FilmDetailsPage(
    video: context.settings.arguments,
  );
});

var loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

var chatHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ChatPage(
    user: context.settings.arguments,
  );
});

var searchFriendsHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SearchFriendsPage();
});

var addFriendsHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AddFriendsPage(
    user: context.settings.arguments,
  );
});

var carmiExchangeHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CarmiExchange();
});

var fansListHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FansListPage();
});

var followListHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FollowListPage();
});

var inviteListHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return InviteListPage();
});

var taskCenterHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TaskCenterPage();
});

var downloadRecordHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DownloadRecordPage();
});

var playRecordHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return PlayRecordPage();
});

var trtcIndexHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TRTCIndexPage();
});

var videoContactHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TRTCCallingContact(CallingScenes.VideoOneVOne);
});

var audioContactHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TRTCCallingContact(CallingScenes.AudioOneVOne);
});

var callingViewtHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  final arguments = context.settings.arguments as Map;
  return TRTCCallingVideo(
    remoteUserInfo: arguments['remoteUserInfo'],
    callType: arguments['callType'],
    callingScenes: arguments['callingScenes'],
  );
});

var inviteHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return InvitePage(
    inviteCode: context.settings.arguments,
  );
});

var rechargeVipHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RechargeVipPage();
});

var commentsListHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CommentsListPage();
});

var videoLikesListHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return VideoLikesListPage();
});
