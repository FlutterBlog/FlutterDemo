import 'package:flutter/material.dart';
import 'routes/Base/FTTabBarPage.dart';
import 'routes/Base/FTGuidePage.dart';
import 'routes/1/FTPage1.dart';
import 'routes/2/FTPage2.dart';
import 'routes/3/FTPage3.dart';
import 'routes/4/FTPage4.dart';
import 'routes/Login/FTLoginPage.dart';
import 'routes/Login/FTAccountPage.dart';

import 'base/SP/FTLocalStorage.dart';

// 程序主函数
void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Widget homePage = new Container(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterDemo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: FTTabBarPage(),
      home: FutureBuilder(
        future: FTLocalStorage.getBool("FTFirstLaunch"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          bool isFirstBool = false;
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data is bool) {
              isFirstBool = snapshot.data;
            }
          }
          return isFirstBool ? FTTabBarPage() : FTGuidePage();
        },
      ),
      routes: {
        "TabBarHome": (context) => FTTabBarPage(),
        "Page1": (context) => FTPage1(),
        "Page2": (context) => FTPage2(),
        "Page3": (context) => FTPage3(),
        "Page4": (context) => FTPage4(),
        "LoginPage": (context) => FTLoginPage(),
        "AccountPage": (context) => FTAccountPage(),
      },
    );
  }
}
