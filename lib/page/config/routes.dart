import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String demoSimple = "/demo";
  static String demoSimpleFixedTrans = "/demo/fixedtrans";
  static String demoFunc = "/demo/func";
  static String deepLink = "/message";
  static String douyin = '/douyin';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: rootHandler);
    router.define(demoSimple, handler: demoRouteHandler);
    router.define(demoSimpleFixedTrans,
        handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
    router.define(demoFunc, handler: demoFunctionHandler);
    router.define(deepLink, handler: deepLinkHandler);
    router.define(douyin, handler: douyinHandler);
    router.define('/live', handler: liveHandler);
    router.define('/create_live', handler: createLiveHandler);
    router.define('/film_details', handler: filmDetailsHandler);
    router.define('/login', handler: loginHandler);
    router.define('/chat', handler: chatHandler);
    router.define('/search_friends', handler: searchFriendsHandler);
    router.define('/add_friends', handler: addFriendsHandler);
    router.define('/carmi_exchange', handler: carmiExchangeHandler);
    router.define('/fans_list', handler: fansListHandler);
    router.define('/follow_list', handler: followListHandler);
    router.define('/invite_list', handler: inviteListHandler);
    router.define('/task_center', handler: taskCenterHandler);
    router.define('/download_record', handler: downloadRecordHandler);
    router.define('/play_record', handler: playRecordHandler);
    router.define('/trtc_index', handler: trtcIndexHandler);
    router.define('/video_contact', handler: videoContactHandler);
    router.define('/audio_contact', handler: audioContactHandler);
    router.define('/calling_view', handler: callingViewtHandler);
    router.define('/invite', handler: inviteHandler);
    router.define('/recharge_vip', handler: rechargeVipHandler);
    router.define('/comments_list', handler: commentsListHandler);
    router.define('/video_likes_list', handler: videoLikesListHandler);
    router.define('/webview', handler: webviewHandler);
    router.define('/webview_example', handler: webviewExampleHandler);
  }
}
