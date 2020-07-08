import 'package:flutter/material.dart';

class FTCoursePage extends StatefulWidget {
  @override
  _FTCoursePageState createState() => _FTCoursePageState();
}

class _FTCoursePageState extends State<FTCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                "课程",
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
