import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/page/config/application.dart';

class CarmiExchange extends StatefulWidget {
  @override
  _CarmiExchangeState createState() => _CarmiExchangeState();
}

class _CarmiExchangeState extends State<CarmiExchange> {
  TextEditingController _textFieldcontroller;

  @override
  void initState() {
    super.initState();
    _textFieldcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _textFieldcontroller.dispose();
    super.dispose();
  }

  _carmiExchange() async {
    if (_textFieldcontroller.text == '') {
      return Fluttertoast.showToast(
        msg: '请输入卡密',
        gravity: ToastGravity.CENTER,
      );
    }
    EasyLoading.show(status: '正在兑换...', maskType: EasyLoadingMaskType.black);
    await Api.Login({'code': _textFieldcontroller.text}).then((value) {
      Fluttertoast.showToast(
        msg: '兑换成功',
        gravity: ToastGravity.CENTER,
      );
      Application.router.pop(context);
    }, onError: (error) {
      EasyLoading.dismiss();
      return Fluttertoast.showToast(
        msg: error,
        gravity: ToastGravity.CENTER,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('卡密兑换'),
        centerTitle: true,
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              primary: Colors.white,
              textStyle: TextStyle(fontSize: 32.sp),
            ),
            onPressed: _carmiExchange,
            child: const Text('兑换'),
          ),
        ],
      ),
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: TextField(
            autofocus: true,
            controller: _textFieldcontroller,
            decoration: InputDecoration(
              hintText: '请输入卡密',
              hintStyle: TextStyle(color: Colors.grey),
              hintMaxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
