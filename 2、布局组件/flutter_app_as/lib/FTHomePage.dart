import 'package:flutter/material.dart';
import 'FTColumnPage.dart';

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
              child: Text("Column", style: TextStyle(fontSize: 26.0, color: Colors.blue),),
              onPressed: () {
                print("onPressed:");

                Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return FTColumnPage();
                  }),
                );

              },
            ),

            RaisedButton(
              child: Text("Flex", style: TextStyle(fontSize: 26.0, color: Colors.blue),),
              onPressed: () {
                print("onPressed:");
              },
            ),

            RaisedButton(
              child: Text("Flow", style: TextStyle(fontSize: 26.0, color: Colors.blue),),
              onPressed: () {
                print("onPressed:");
              },
            ),

            RaisedButton(
              child: Text("Stack", style: TextStyle(fontSize: 26.0, color: Colors.blue),),
              onPressed: () {
                print("onPressed:");
              },
            ),

            RaisedButton(
              child: Text("Align", style: TextStyle(fontSize: 26.0, color: Colors.blue),),
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
