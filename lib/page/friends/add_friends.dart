import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trtc_demo/provider/jmessage_manager_provider.dart';

class AddFriendsPage extends StatefulWidget {
  JMUserInfo user;

  AddFriendsPage({this.user});

  @override
  _AddFriendsPageState createState() => _AddFriendsPageState();
}

class _AddFriendsPageState extends State<AddFriendsPage> {
  TextEditingController _inputController = TextEditingController();

  _addFriends() async {
    await JMessage.sendInvitationRequest(
      username: widget.user.username,
      appKey: widget.user.appKey,
      reason: _inputController.text,
    );
    Fluttertoast.showToast(
      msg: '发送成功',
      gravity: ToastGravity.CENTER,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            padding: EdgeInsets.only(top: 15.r, right: 15.r, bottom: 15.r),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: _addFriends,
              child: Text('发送'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90.h,
            ),
            Center(
              child: Text(
                '申请添加朋友',
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.h, bottom: 10.h),
              child: Text(
                '发送添加朋友申请',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 28.sp,
                ),
              ),
            ),
            Container(
              height: 180.h,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 247, 247, 1),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: TextField(
                controller: _inputController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
