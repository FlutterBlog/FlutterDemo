import 'package:flutter/material.dart';

class FTAccountPage extends StatefulWidget {
  @override
  _FTAccountPageState createState() => _FTAccountPageState();
}

class _FTAccountPageState extends State<FTAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
                "Login",
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
