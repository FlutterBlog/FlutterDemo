import 'package:flutter/material.dart';

// class FTPaddingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("FTPaddingPage"),
//       ),
//       body: Column(
//         children: <Widget>[],
//       ),
//     );
//   }
// }

class FTPaddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0), //左边添加8像素的留白
            child: Text("Hello World"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0), //上下各添加8像素的留白
            child: Text("Hello World"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0), //分别设置四周的留白
            child: Text("Hello World"),
          ),
        ],
      ),
    );
  }
}
