import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:trtc_demo/page/config/application.dart';
import 'package:trtc_demo/provider/jmessage_manager_provider.dart';

class SearchFriendsPage extends StatefulWidget {
  @override
  _SearchFriendsPageState createState() => _SearchFriendsPageState();
}

class _SearchFriendsPageState extends State<SearchFriendsPage> {
  TextEditingController _keywordController = TextEditingController();
  bool _loading = false;
  JMUserInfo user;

  @override
  void initState() {
    // TODO: implement initState
    _keywordController.addListener(() {
      if (_keywordController.text == '') {
        _loading = false;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 15,
        title: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          alignment: Alignment.center,
          height: 38,
          padding: EdgeInsets.fromLTRB(15.w, 0.0, 15.w, 0.0),
          child: TextField(
            controller: _keywordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '搜索',
              isDense: true,
            ),
          ),
        ),
        actions: <Widget>[
          InkWell(
            child: Container(
              width: 50,
              height: 50,
              child: Center(
                child: Text("确定"),
              ),
            ),
            onTap: () {
              if (_keywordController.text == '') {
                return Fluttertoast.showToast(
                  msg: '请输入搜索内容',
                  gravity: ToastGravity.CENTER,
                );
              }
              _loading = true;
              setState(() {});
            },
          )
        ],
      ),
      body: Column(
        children: [
          _getFriendsItem(),
          _userInfo(),
        ],
      ),
    );
  }

  _userInfo() {
    if (user != null) {
      return Card(
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Image.network(user.avatarThumbPath != '' ? user.avatarThumbPath : 'http://api.btstu.cn/sjtx/api.php?lx=c1&format=images'),
          ),
          title: Text(user.username),
          subtitle: Text(user.signature, maxLines: 1, overflow: TextOverflow.ellipsis,),
          trailing: OutlinedButton(
            child: Text('添加'),
            onPressed: () {
              Application.router.navigateTo(context, "/add_friends", routeSettings: RouteSettings(
                arguments: user,
              ));
            },
          ),
        ),
      );
    }
    return Container();
  }

  _searchFriends() async {
    await JMessage.getUserInfo(username: _keywordController.text, appKey: '').then((value) {
      if (value is JMUserInfo) {
        user = value;
      }
      _loading = false;
      setState(() {});
    }, onError: (error) {
      if (error is PlatformException) {
        PlatformException ex = error;
        return Fluttertoast.showToast(
          msg: '用户不存在',
          gravity: ToastGravity.CENTER,
        );
      }
    });
  }

  _getFriendsItem() {
    if (_loading) {
      return Card(
        child: ListTile(
          leading: Container(
            width: 80.r,
            height: 80.r,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Icon(
              Icons.supervisor_account_outlined,
              color: Colors.white,
            ),
          ),
          title: Text.rich(
            TextSpan(
              text: '查找账号:',
              children: [
                TextSpan(
                  text: _keywordController.text,
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          onTap: _searchFriends,
        ),
      );
    }
    return Container();
  }
}
