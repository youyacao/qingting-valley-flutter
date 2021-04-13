import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage>
    with SingleTickerProviderStateMixin {
  Color _colorRed = Color.fromRGBO(236, 97, 94, 1);
  TabController _tabController;
  List tabs = ["1v1", "直播"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         backgroundColor: Colors.white,
    //         // elevation: 0,
    //         bottom: TabBar(
    //             unselectedLabelColor: Colors.redAccent,
    //             indicatorSize: TabBarIndicatorSize.label,
    //             indicator: BoxDecoration(
    //                 gradient: LinearGradient(
    //                     colors: [Colors.redAccent, Colors.orangeAccent]),
    //                 borderRadius: BorderRadius.circular(26),
    //                 color: Colors.redAccent),
    //             tabs: [
    //               Tab(
    //                 child: Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 50,),
    //                   child: Text("1v1"),
    //                 ),
    //               ),
    //               Tab(
    //                 child: Text("直播"),
    //               ),
    //             ]),
    //       ),
    //       body: TabBarView(children: [
    //         Icon(Icons.movie),
    //         Icon(Icons.games),
    //       ]),
    //     )
    // );
    return AnnotatedRegion(
      child: Scaffold(
        body: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
              decoration: BoxDecoration(
                color: _colorRed,
              ),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: TabBar(
                      isScrollable: true,
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.symmetric(vertical: 8),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: Color.fromRGBO(255, 255, 255, 0.3),
                      ),
                      tabs: tabs
                          .map((e) => Tab(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Text(e),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 16.w,
                    bottom: 0,
                    child: Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Icon(Icons.apps),
                  Icon(Icons.movie),
                ],
              ),
            ),
          ],
        ),
      ),
      value: SystemUiOverlayStyle.light,
    );
  }
}
