import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InvitePage extends StatefulWidget {
  InvitePage({this.inviteCode});

  final String inviteCode;

  @override
  _InvitePageState createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  _buildInviteCode() {
    List<String> _inviteCodeList = widget.inviteCode.split('');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < _inviteCodeList.length; i++)
          Container(
            alignment: Alignment.center,
            width: 42.r,
            height: 59.r,
            margin: EdgeInsets.only(right: i != _inviteCodeList.length - 1 ? 9.r : 0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(239, 239, 239, 1),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              _inviteCodeList[i],
              style: TextStyle(
                color: Color.fromRGBO(218, 76, 36, 1),
                fontSize: 31.sp,
              ),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('邀请好友'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(245, 58, 80, 1),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/invite_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 46.r),
                  child: Image.asset(
                    "assets/images/invite_title.png",
                    width: 500.r,
                    height: 167.r,
                  ),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 57.r),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 54.r, bottom: 30.r),
                            child: Text(
                              '您的邀请码',
                              style: TextStyle(
                                fontSize: 31.sp,
                                color: Color.fromRGBO(51, 51, 51, 1),
                              ),
                            ),
                          ),
                          _buildInviteCode(),
                          Padding(
                            padding: EdgeInsets.only(top: 31.r, bottom: 37.r),
                            child: Text(
                              '邀请的好友也可在注册时直接填写邀请码',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Color.fromRGBO(153, 153, 153, 1),
                              ),
                            ),
                          ),
                          QrImage(
                            data: widget.inviteCode,
                            version: QrVersions.auto,
                            size: 318.r,
                            gapless: false,
                            errorStateBuilder: (cxt, err) {
                              return Container(
                                child: Center(
                                  child: Text(
                                    "Uh oh! Something went wrong...",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 68.r, right: 32.r, bottom: 32.r, left: 32.r),
                            child: Container(
                              width: double.infinity,
                              height: 87.r,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(236, 124, 72, 1),
                                  Color.fromRGBO(232, 80, 133, 1),
                                ]),
                                borderRadius: BorderRadius.circular(43.5.r),
                              ),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  )),
                                ),
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(text: widget.inviteCode));
                                  Fluttertoast.showToast(
                                    msg: '复制成功',
                                    gravity: ToastGravity.CENTER,
                                  );
                                },
                                child: Text('复制邀请码'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -114.r,
                    child: Image.asset(
                      "assets/images/invite_gold.png",
                      width: 616.r,
                      height: 207.r,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
