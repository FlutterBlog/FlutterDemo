import 'package:flutter/material.dart';
import '../Login/FTLoginPage.dart';

class FTPage1 extends StatefulWidget {
  @override
  _FTPage1State createState() => _FTPage1State();
}

class _FTPage1State extends State<FTPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print("Icons.share");
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                "主页",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => FTLoginPage(),
                      fullscreenDialog: true),
                );
                // Navigator.pushNamed(context, "LoginPage");
              },
            ),
          ],
        ),
      ),
    );
  }
}
