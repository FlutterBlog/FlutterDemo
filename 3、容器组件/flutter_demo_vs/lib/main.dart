import 'package:flutter/material.dart';
import 'FTHomePage.dart';
// import 'FTScaffoldPage.dart';

// 程序主函数
void main() => runApp(MyApp());

// 程序主函数
//void main() {
//  runApp(MyApp());
//}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterDemo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FTHomePage(title: 'FTHomePage'),
      // home: FTScaffoldPage(),
    );
  }
}
