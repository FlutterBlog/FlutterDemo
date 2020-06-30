import 'package:flutter/material.dart';
import 'FTPaddingPage.dart';

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
                "Padding",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                print("onPressed:");

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FTPaddingPage();
                  }),
                );
              },
            ),
            RaisedButton(
              child: Text(
                "ConstrainedBox",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                print("onPressed:");
              },
            ),
            RaisedButton(
              child: Text(
                "DecoratedBox",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                print("onPressed:");
              },
            ),
            RaisedButton(
              child: Text(
                "Transform",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                print("onPressed:");
              },
            ),
            RaisedButton(
              child: Text(
                "Container",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                print("onPressed:");
              },
            ),
            RaisedButton(
              child: Text(
                "Tabbar",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                print("onPressed:");
              },
            ),
            RaisedButton(
              child: Text(
                "Clip",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                print("onPressed:");
              },
            ),
          ],
        ),
      ),
    );
  }
}
