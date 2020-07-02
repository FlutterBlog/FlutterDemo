import 'package:flutter/material.dart';

class FTScrollEventPage extends StatefulWidget {
  @override
  _FTScrollEventPageState createState() => _FTScrollEventPageState();
}

class _FTScrollEventPageState extends State<FTScrollEventPage> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FTScrollEventPage")),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print(_progress);
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            // return true;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemExtent: 50, //固定高度
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("ScrollView: $index"),
                  );
                },
              ),
              CircleAvatar(
                radius: 30,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
        // child: ListView.builder(
        //   itemCount: 100,
        //   itemExtent: 50, //固定高度
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text("ScrollView: $index"),
        //     );
        //   },
        // ),
      ),
    );
  }
}

// 悬浮按钮快速回到顶部
// class FTScrollEventPage extends StatefulWidget {
//   @override
//   _FTScrollEventPageState createState() => _FTScrollEventPageState();
// }

// class _FTScrollEventPageState extends State<FTScrollEventPage> {
//   ScrollController _controller = new ScrollController();
//   bool showToTopBtn = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() {
//       print(_controller.offset);
//       if (_controller.offset < 1000 && showToTopBtn) {
//         setState(() {
//           showToTopBtn = false;
//         });
//       } else if (_controller.offset >= 1000 && showToTopBtn == false) {
//         setState(() {
//           showToTopBtn = true;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("FTScrollEventPage")),
//       body: Scrollbar(
//         child: ListView.builder(
//           itemCount: 100,
//           itemExtent: 50, //固定高度
//           controller: _controller,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text("ScrollView: $index"),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: !showToTopBtn
//           ? null
//           : FloatingActionButton(
//               child: Icon(Icons.arrow_upward),
//               onPressed: () {
//                 _controller.animateTo(.0,
//                     duration: Duration(milliseconds: 200), curve: Curves.ease);
//               },
//             ),
//     );
//   }
// }

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
