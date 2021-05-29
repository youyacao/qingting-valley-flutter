import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trtc_demo/http/api.dart';
import 'package:trtc_demo/models/message.dart';
import 'package:trtc_demo/models/task_list.dart';

class TaskCenterPage extends StatefulWidget {
  @override
  _TaskCenterPageState createState() => _TaskCenterPageState();
}

class _TaskCenterPageState extends State<TaskCenterPage> {
  final ButtonStyle style = ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 28.sp));
  List<TaskItemElement> _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTask();
  }

  _getTask() async {
    EasyLoading.show(status: '正在加载...', maskType: EasyLoadingMaskType.black);
    var json = await Api.TaskList();
    EasyLoading.dismiss();
    var result = TaskListModel.fromJson(json);
    _list.addAll(result.data.dailyTask);
    setState(() {});
  }

  _recieveTask(task_id) async {
    EasyLoading.show(status: '正在领取...', maskType: EasyLoadingMaskType.black);
    await Api.RecieveTask(task_id).then((value) {
      EasyLoading.dismiss();
      var result = MessageModel.fromJson(value);
      if (result.code == 200) {
        _list = [];
        _getTask();
      }
      Fluttertoast.showToast(
        msg: result.msg,
        gravity: ToastGravity.CENTER,
      );
    }, onError: (err) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(
        msg: err,
        gravity: ToastGravity.CENTER,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('任务中心'),
        centerTitle: true,
      ),
      body: EasyRefresh.custom(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Image.asset(
              'assets/images/task_bg.png',
              width: 750.r,
              height: 240.r,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((content, index) {
              return Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Image.asset(
                      'assets/images/task.png',
                      width: 90.r,
                      height: 90.r,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${_list[index].title}（${_list[index].hasNum}/${_list[index].needNum}）', style: TextStyle(
                              fontSize: 30.sp,
                            ),),
                            Padding(
                              padding: EdgeInsets.only(top: 5.r),
                              child: Text('积分+${_list[index].integral}', style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontSize: 28.sp,
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: style,
                      onPressed: _list[index].canReceive == 0 ? null : () {
                        _recieveTask(_list[index].id);
                      },
                      child: const Text('领取'),
                    ),
                  ],
                ),
              );
            }, childCount: _list.length),
          ),
        ],
        onRefresh: () async {},
        onLoad: () async {},
      ),
    );
  }
}
