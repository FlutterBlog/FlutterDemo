import 'package:flutter/material.dart';

class FTScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("FTScrollPage"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "FTScrollPage",
                style: TextStyle(color: Colors.purple, fontSize: 18.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
