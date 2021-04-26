import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:platform/platform.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

const String kMockAppkey = "e6c4b0e7040066f0d8f8c212";

MethodChannel channel = MethodChannel('jmessage_flutter');
JmessageFlutter JMessage = new JmessageFlutter.private(channel, const LocalPlatform());

class JMessageManagerProvider with ChangeNotifier {
  init() async {
    print('------------------------------------------------------------------------------------------- JMessage Init');
    JMessage..setDebugMode(enable: true);
    JMessage.init(isOpenMessageRoaming: true, appkey: kMockAppkey);
    JMessage.applyPushAuthority(new JMNotificationSettingsIOS(sound: true, alert: true, badge: true));
  }
}
