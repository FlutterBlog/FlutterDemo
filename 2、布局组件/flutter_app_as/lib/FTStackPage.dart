import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// 层叠布局
class FTStackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTStackPage"),
      ),

//      body: Column(
//        children: <Widget>[
//        ],
//      ),

      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,//未定位 Widget 占满 Stack 空间
          children: <Widget>[

            Container(
              child: Text("Hello World", style: TextStyle(color: Colors.white),),
              color: Colors.red,
            ),
            
            Positioned(
              left: 18.0,
              bottom: 18.0,
              child: Text("This is a UILabel111"),
            ),

            Positioned(
              top: 18.0,
              left: 18.0,
              child: Text("This is a UILabel222"),
            ),

          ],
        ),
      ),

    );
  }
}