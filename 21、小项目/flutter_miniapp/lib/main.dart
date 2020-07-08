import 'package:flutter/material.dart';
import 'routes/Base/FTTabBarPage.dart';
import 'routes/1/FTPage1.dart';
import 'routes/2/FTPage2.dart';
import 'routes/3/FTPage3.dart';
import 'routes/4/FTPage4.dart';
import 'routes/Login/FTLoginPage.dart';
import 'routes/Login/FTAccountPage.dart';

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
      home: FTTabBarPage(),
      routes: {
        "Page1": (context) => FTPage1(),
        "Page2": (context) => FTPage2(),
        "Page3": (context) => FTPage3(),
        "Page4": (context) => FTPage4(),
        "LoginPage": (context) => FTLoginPage(),
        "Account": (context) => FTAccountPage(),
      },
    );
  }
}
