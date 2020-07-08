import 'package:flutter/material.dart';

class FTLoginPage extends StatefulWidget {
  @override
  _FTLoginPageState createState() => _FTLoginPageState();
}

class _FTLoginPageState extends State<FTLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                "登录",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
