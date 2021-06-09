import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trtc_demo/base/DemoSevice.dart';
import 'package:trtc_demo/provider/TRTCProvider.dart';
import 'package:trtc_demo/provider/jmessage_manager_provider.dart';
import 'package:trtc_demo/provider/userProvider.dart';

import 'SplashScreen.dart';
import 'page/config/application.dart';
import 'page/config/routes.dart';
import './routes/routes.dart' as router;

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(APP());
  });
}

class APP extends StatefulWidget {
  // 用于路由返回监听
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  @override
  _APP createState() => _APP();
}

class _APP extends State<APP> {
  @override
  void initState() {
    // TODO: implement initState
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
    DemoSevice.sharedInstance().setNavigatorKey(navigatorKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      // allowFontScaling: false,
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => JMessageManagerProvider()..init(),
            lazy: false,
          ),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(
            create: (_) => TRTCProvider()..init(),
            lazy: false,
          ),
        ],
        child: MaterialApp(
          navigatorObservers: [APP.routeObserver],
          debugShowCheckedModeBanner: false,
          title: 'Flutter_ScreenUtil',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus.unfocus();
              }
            },
            child: SplashScreen(),
          ),
          onGenerateRoute: Application.router.generator,
          builder: EasyLoading.init(),
          navigatorKey: navigatorKey,
          initialRoute: router.initialRoute,
          routes: router.routes,
        ),
      ),
    );
  }
}
