import 'package:flutter/material.dart';

import 'page/config/application.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("normal"),
        onPressed: () {
          Application.router.navigateTo(context, "/", clearStack: true,);
        },
      ),
    );
  }
}
