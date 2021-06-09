import 'package:flutter/material.dart';
import 'package:trtc_demo/TRTCCallingDemo/model/TRTCCalling.dart';
import 'package:trtc_demo/TRTCCallingDemo/model/TRTCCallingDelegate.dart';
import 'package:trtc_demo/TRTCCallingDemo/ui/base/CallTypes.dart';
import 'package:trtc_demo/TRTCCallingDemo/ui/base/CallingScenes.dart';
import 'package:trtc_demo/debug/GenerateTestUserSig.dart';
import 'package:trtc_demo/page/config/application.dart';
import 'package:trtc_demo/page/login/ProfileManager_Mock.dart';
import 'package:trtc_demo/utils/TxUtils.dart';

class DemoSevice {
  static DemoSevice _instance;

  TRTCCalling _tRTCCallingService;
  ProfileManager _profileManager;
  GlobalKey<NavigatorState> _navigatorKey;
  bool _isRegisterListener = false;
  DemoSevice() {
    initTrtc();
  }
  initTrtc() async {
    _tRTCCallingService = await TRTCCalling.sharedInstance();
    _profileManager = await ProfileManager.getInstance();
  }

  static sharedInstance() {
    if (_instance == null) {
      _instance = new DemoSevice();
    }
    return _instance;
  }

  setNavigatorKey(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  start() async {
    if (_isRegisterListener) {
      _tRTCCallingService.unRegisterListener(onTrtcListener);
    }
    String loginId = await TxUtils.getLoginUserId();
    await _tRTCCallingService.login(GenerateTestUserSig.sdkAppId, loginId,
        await GenerateTestUserSig.genTestSig(loginId));
    _isRegisterListener = true;
    _tRTCCallingService.registerListener(onTrtcListener);
    print('======================start');
  }

  onTrtcListener(type, params) async {
    print('-------------------------------------onTrtcListener事件监听');
    print('=======类型、参数========${type} ——————————————————————————${params}');
    switch (type) {
      case TRTCCallingDelegate.onInvited:
        {
          BuildContext context = _navigatorKey.currentState.overlay.context;
          UserModel userInfo = await _profileManager
              .querySingleUserInfo(params["sponsor"].toString());
          // Application.router.navigateTo(context, "/calling_view",
          //     routeSettings: RouteSettings(
          //       arguments: {
          //         "remoteUserInfo": userInfo,
          //         "callType": CallTypes.Type_Call_Someone,
          //         "callingScenes": params['type'] == TRTCCalling.typeVideoCall
          //             ? CallingScenes.VideoOneVOne
          //             : CallingScenes.AudioOneVOne
          //       },
          //     ));

          Navigator.pushReplacementNamed(
            context,
            "/calling/callingView",
            arguments: {
              "remoteUserInfo": userInfo,
              "callType": CallTypes.Type_Being_Called,
              "callingScenes": params['type'] == TRTCCalling.typeVideoCall
                  ? CallingScenes.VideoOneVOne
                  : CallingScenes.AudioOneVOne
            },
          );
        }
        break;
    }
  }
}
