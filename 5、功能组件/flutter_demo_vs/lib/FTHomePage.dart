import 'package:flutter/material.dart';
import 'WillPopScopeTestRoute.dart';
import 'FTInheritedWidgetPage.dart';
import 'FTProviderPage.dart';
import 'FTDialogPage.dart';

class FTHomePage extends StatefulWidget {
  FTHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FTHomePageState createState() => _FTHomePageState();
}

class _FTHomePageState extends State<FTHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                "WillPopScope",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WillPopScopeTestRoute();
                }));
              },
            ),
            Text(""),
            RaisedButton(
              child: Text(
                "InheritedWidget",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InheritedWidgetTestRoute();
                }));
              },
            ),
            Text(""),
            RaisedButton(
              child: Text(
                "ProviderWidget",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // return FTProviderPage();
                  return ThemeTestRoute();
                }));
              },
            ),
            Text(""),
            RaisedButton(
              child: Text(
                "Dialog",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FTDialogPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
