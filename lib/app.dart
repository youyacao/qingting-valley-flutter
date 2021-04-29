import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trtc_demo/provider/jmessage_manager_provider.dart';

import 'SplashScreen.dart';
import 'page/config/application.dart';
import 'page/config/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class APP extends StatelessWidget {
  APP() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
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
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter_ScreenUtil',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus.unfocus();
              }
            },
            child: SplashScreen(),
          ),
          onGenerateRoute: Application.router.generator,
          builder: EasyLoading.init(),
          navigatorKey: navigatorKey,
        ),
      ),
    );
  }
}
