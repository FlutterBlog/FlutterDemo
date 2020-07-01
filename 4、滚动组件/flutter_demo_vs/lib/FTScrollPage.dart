import 'package:flutter/material.dart';

// 滚动监听及控制
class FTScrollEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("FTScrollEventPage"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          physics: ScrollPhysics(),
          child: Center(
            child: Column(
              children: str
                  .split("")
                  .map((e) => Text(e, textScaleFactor: 2))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

// 一个简单的滚动
class FTScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("FTScrollPage"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          physics: ScrollPhysics(),
          child: Center(
            child: Column(
              children: str
                  .split("")
                  .map((e) => Text(e, textScaleFactor: 2))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

// 一个简单的滚动
// class FTSingleChildScrollViewPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("FTScrollPage"),
//       ),
//       body: Column(
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 "FTScrollPage",
//                 style: TextStyle(color: Colors.purple, fontSize: 18.0),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
