import 'package:flutter/material.dart';
import '../TRTCCallingDemo/ui/VideoCall/TRTCCallingVideo.dart';

final String initialRoute = "/";
final Map<String, WidgetBuilder> routes = {
  "/calling/callingView": (context) => TRTCCallingVideo(),
};
