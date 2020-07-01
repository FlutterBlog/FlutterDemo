import 'package:flutter/material.dart';
import 'FTScrollPage.dart';
import 'FTListViewPage.dart';
import 'FTGridViewPage.dart';
import 'FTCustomScrollViewPage.dart';

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
            Text(""),
            RaisedButton(
              child: Text(
                "Scroll",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // return FTScrollPage();
                  return FTScrollEventPage();
                }));
              },
            ),
            Text(""),
            RaisedButton(
              child: Text(
                "ListView",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // return FTListViewPage();
                  // return FTListViewLinePage();
                  // return FTListViewMorePage();
                  return FTListViewHeadPage();
                }));
              },
            ),
            Text(""),
            RaisedButton(
              child: Text(
                "GridView",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // return FTGridViewPage();
                  return FTGridViewBuildPage();
                }));
              },
            ),
            Text(""),
            RaisedButton(
              child: Text(
                "CustomScrollView",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FTCustomScrollViewPage();
                }));
              },
            ),
            Text(""),
          ],
        ),
      ),
    );
  }
}
