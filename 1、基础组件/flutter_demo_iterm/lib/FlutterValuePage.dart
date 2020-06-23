
import 'package:flutter/material.dart';

// 二级页面
class FlutterValuePage extends StatelessWidget {

  FlutterValuePage({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    String icons = "";
    icons += "\uE914";
    icons += " \uE000";
    icons += " \uE90D";

    print("FlutterValuePage-Build-$text");

    return Scaffold(
      appBar: AppBar(
        title: Text("ValuePage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text, textAlign: TextAlign.center,),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "returnValue"),
                child: Text("返回按钮"),
              ),
              Text(" "),
              Image(
                image: AssetImage("testPic/my_icon.png"),
                width: 88,
              ),
              Text(" "),
              Image.asset('testPic/my_icon.png', width: 100,),
              Text(" "),
//              Image.asset('testPic/my_icon.png',
//                width: 100,
//                color: Colors.blue,
//                colorBlendMode: BlendMode.difference,),
//              Image(
//                image: NetworkImage(
//                    "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png"),
//                width: 200.0,
//              ),
//              Image.network("https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png", width: 200,),
//              Image(
//                image: NetworkImage(
//                    "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png"),
//                width: 200.0,
//                color: Colors.blue,
//                colorBlendMode: BlendMode.difference,
//              ),
//              Text(icons,
//                style: TextStyle(
//                    fontFamily: "MaterialIcons",
//                    fontSize: 24.0,
//                    color: Colors.green
//                ),
//              ),
//              Icon(Icons.thumb_up, color: Colors.green,),
            ],
          ),
        )
      ),
    );
  }

}