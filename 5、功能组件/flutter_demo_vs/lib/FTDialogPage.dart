import 'package:flutter/material.dart';

class FTDialogPage extends StatefulWidget {
  @override
  _FTDialogPageState createState() => new _FTDialogPageState();
}

class _FTDialogPageState extends State<FTDialogPage> {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("FTDialogPage"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("FTDialogPage"),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
