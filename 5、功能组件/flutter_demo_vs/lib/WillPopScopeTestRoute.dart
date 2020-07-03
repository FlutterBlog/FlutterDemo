import 'package:flutter/material.dart';

// 返回拦截
class WillPopScopeTestRoute extends StatefulWidget {
  @override
  _WillPopScopeTestRouteState createState() => _WillPopScopeTestRouteState();
}

class _WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WillPopScopeTestRoute"),
      ),
      //
      body: new WillPopScope(
        onWillPop: () async {
          print("1秒内连续按两次返回键退出");
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出"),
        ),
      ),

      //
      // body: Column(
      //   children: <Widget>[
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Text(
      //           "WillPopScopeTestRoute",
      //           style: TextStyle(color: Colors.purple, fontSize: 18.0),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),

      //
    );
  }
}

// 一个简单的新页面
class WillPopScopeTestRoute111 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("WillPopScopeTestRoute"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "WillPopScopeTestRoute",
                style: TextStyle(color: Colors.purple, fontSize: 18.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
