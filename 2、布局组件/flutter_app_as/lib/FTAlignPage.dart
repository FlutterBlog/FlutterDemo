import 'package:flutter/material.dart';

// 层叠布局
class FTAlignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTStackPage"),
      ),


      // body: Container(
      //   width: 120.0,
      //   height: 120.0,
      //   color: Colors.blue[50],
      //   child: Align(
      //     widthFactor: 2,
      //     heightFactor: 2,
      //     // alignment: Alignment.topRight,
      //     // alignment: Alignment(1, 1),
      //     // alignment: FractionalOffset(0.2, 0.6),
      //     child: FlutterLogo(size: 60,),
      //   ),
      // ),
      
      body: Column(
        children: <Widget>[
          
          Text(" "),
          
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(child: Text("data"),),
          ),

          Text(" "),

          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(child: Text("data"), widthFactor: 1, heightFactor: 1,),
          ),

        ],
      ),

    );
  }
}