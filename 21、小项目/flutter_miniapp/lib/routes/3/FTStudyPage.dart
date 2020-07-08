import 'package:flutter/material.dart';

class FTStudyPage extends StatefulWidget {
  @override
  _FTStudyPageState createState() => _FTStudyPageState();
}

class _FTStudyPageState extends State<FTStudyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                "学习",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                // Navigator.pushNamed(context, "LoginPage");
              },
            ),
          ],
        ),
      ),
    );
  }
}
