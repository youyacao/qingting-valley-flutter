import 'package:flutter/foundation.dart';
import 'package:trtc_demo/TRTCChatSalonDemo/model/TRTCChatSalon.dart';
import 'package:trtc_demo/base/DemoSevice.dart';
import 'package:trtc_demo/debug/GenerateTestUserSig.dart';
import 'package:trtc_demo/utils/TxUtils.dart';
import 'package:trtc_demo/utils/constants.dart' as constants;

class TRTCProvider with ChangeNotifier {
  static TRTCChatSalon _trtcVoiceRoom;

  static TRTCChatSalon get trtcVoiceRoom => _trtcVoiceRoom;

  init() async {
    _trtcVoiceRoom = await TRTCChatSalon.sharedInstance();
    DemoSevice.sharedInstance().start();
  }

  static login() async {
    String userId = await TxUtils.getStorageByKey(constants.USERID_KEY);
    TxUtils.setStorageByKey(constants.USERID_KEY, userId);
    await _trtcVoiceRoom.login(
      GenerateTestUserSig.sdkAppId,
      userId,
      GenerateTestUserSig.genTestSig(userId),
    );
  }

  static logout() {
    _trtcVoiceRoom.logout();
    TxUtils.setStorageByKey(constants.USERID_KEY, '');
  }
}
