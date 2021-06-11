import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RechargeVipPage extends StatefulWidget {
  @override
  _RechargeVipPageState createState() => _RechargeVipPageState();
}

class _RechargeVipPageState extends State<RechargeVipPage> {
  List _vipList = [
    {"title": "月卡", "desc": "赠送200积分", "time": 30, "original_price": 30, "special_price": 28},
    {"title": "季卡", "desc": "赠送500积分", "time": 120, "original_price": 120, "special_price": 100},
    {"title": "半年卡", "desc": "赠送1200积分", "time": 182, "original_price": 180, "special_price": 160},
    {"title": "年卡", "desc": "赠送5000积分", "time": 365, "original_price": 300, "special_price": 280}
  ];
  List _payTypeList = [
    {"title": "微信支付", "icon": Icons.credit_card},
    {"title": "支付宝支付", "icon": Icons.credit_card},
    {"title": "银行卡支付", "icon": Icons.credit_card}
  ];
  int _index = 0;
  int _payIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _buildVipItem(item, index) {
    return GestureDetector(
      onTap: () {
        _index = index;
        setState(() {});
      },
      child: Container(
        width: double.infinity,
        height: 100.r,
        margin: EdgeInsets.only(top: 20.r),
        padding: EdgeInsets.symmetric(horizontal: 30.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 1.r, color: _index == index ? Color.fromRGBO(255, 91, 53, 1) : Color.fromRGBO(226, 226, 226, 1), style: BorderStyle.solid),
          color: _index == index ? Color.fromRGBO(255, 91, 53, 0.1) : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${item['time']}天VIP',
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: Color.fromRGBO(34, 34, 34, 1),
                  ),
                ),
                Text(
                  item['desc'],
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color.fromRGBO(161, 161, 161, 1),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text.rich(TextSpan(
                  children: [
                    TextSpan(
                      text: '特惠价',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 91, 53, 1),
                        fontSize: 22.sp,
                      ),
                    ),
                    TextSpan(
                      text: '￥${item['special_price']}',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 91, 53, 1),
                        fontSize: 36.sp,
                      ),
                    ),
                  ],
                )),
                Text(
                  '￥${item['original_price']}',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Color.fromRGBO(161, 161, 161, 1),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildPayItem(item, index) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(226, 226, 226, 1),
                width: 1.r,
                style: BorderStyle.solid,
              ),
            ),
          ),
          child: ListTile(
            // leading: Icon(item['icon']),
            title: Text(item['title']),
            trailing: Checkbox(
              value: _payIndex == index,
              onChanged: (bool value) {
                setState(() {
                  _payIndex = index;
                });
              },
            ),
            selected: _payIndex == index,
            dense: true,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('开通VIP'),
        centerTitle: true,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30.r, right: 30.r, left: 30.r),
                    color: Color.fromRGBO(246, 246, 246, 1),
                    child: Container(
                      padding: EdgeInsets.all(30.r),
                      width: double.infinity,
                      height: 212.r,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(255, 179, 110, 1),
                          Color.fromRGBO(255, 91, 53, 1),
                        ]),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '蜻蜓V系统 · ${_vipList[_index]['title']}',
                            style: TextStyle(
                              fontSize: 28.sp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 18.r,
                          ),
                          Text(
                            '有效期${_vipList[_index]['time']}天',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '选择VIP',
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Color.fromRGBO(161, 161, 161, 1),
                          ),
                        ),
                        for (var i = 0; i < _vipList.length; i++) _buildVipItem(_vipList[i], i),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.r),
                          child: Text(
                            '选择支付方式',
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: Color.fromRGBO(161, 161, 161, 1),
                            ),
                          ),
                        ),
                        for (var i = 0; i < _payTypeList.length; i++) _buildPayItem(_payTypeList[i], i),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 88.r,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(226, 226, 226, 1),
                  width: 1.r,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.r),
                    child: Text.rich(TextSpan(
                      children: [
                        TextSpan(
                          text: '支付金额',
                          style: TextStyle(
                            color: Color.fromRGBO(161, 161, 161, 1),
                            fontSize: 22.sp,
                          ),
                        ),
                        TextSpan(
                          text: ' ${_vipList[_index]['special_price']} ',
                          style: TextStyle(
                            color: Color.fromRGBO(34, 34, 34, 1),
                            fontSize: 36.sp,
                          ),
                        ),
                        TextSpan(
                          text: '元',
                          style: TextStyle(
                            color: Color.fromRGBO(161, 161, 161, 1),
                            fontSize: 22.sp,
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
                Container(
                  width: 300.r,
                  height: 88.r,
                  color: Color.fromRGBO(255, 91, 53, 1),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      )),
                    ),
                    child: Text(
                      '确认支付',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.sp,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
