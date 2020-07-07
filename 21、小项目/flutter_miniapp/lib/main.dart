import 'package:flutter/material.dart';
import 'routes/FTHomePage.dart';

// 程序主函数
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
