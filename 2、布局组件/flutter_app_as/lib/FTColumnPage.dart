import 'package:flutter/material.dart';

class FTColumnPage extends StatefulWidget {
  FTColumnPage({Key key}) : super(key: key);

  @override
  _FTColumnPageState createState() => _FTColumnPageState();
}

class _FTColumnPageState extends State<FTColumnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTColumnPage"),
      ),

//      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text(" 123456 "),
//              Text(" 10JQKA "),
//              Text(" 123456 "),
//            ],
//          ),
//
//          Row(
//            mainAxisSize: MainAxisSize.min,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text(" 123456 "),
//              Text(" 10JQKA "),
//              Text(" 123456 "),
//            ],
//          ),
//
//          Row(
//            mainAxisAlignment: MainAxisAlignment.end,
//            textDirection: TextDirection.rtl,
//            children: <Widget>[
//              Text(" 10987654 "),
//              Text(" 12345678 "),
//            ],
//          ),
//
//          Row(
//            mainAxisAlignment: MainAxisAlignment.start,
//            verticalDirection: VerticalDirection.up,
//            children: <Widget>[
//              Text(" ABCDEFG ", style: TextStyle(fontSize: 36),),
//              Text(" 1234567 ", style: TextStyle(fontSize: 24),),
//            ],
//          ),
//
//
//        ],
//      ),

//      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: <Widget>[
//
//          Text(" 123456 "),
//          Text(" 10JQKA10JQKA "),
//
//        ],
//      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                      children: <Widget>[
                        Text("hello world "),
                        Text("I am Jack "),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
