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
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: rootHandler);
    router.define(demoSimple, handler: demoRouteHandler);
    router.define(demoSimpleFixedTrans, handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
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
  }
}
