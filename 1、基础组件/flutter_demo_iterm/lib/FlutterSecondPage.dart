
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'dart:developer';

//----------------------------- FlutterSecondPage ------------------------------
// 二级页面
class FlutterSecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context).settings.arguments;
    debugPrint("路由接收参数:$args");

    // 通过三方包 随机生成字符串
    final wordPair = new WordPair.random();

    return Scaffold(
      appBar: AppBar(
        title: Text("SecondPage"),
      ),
      body: Center(
        child: Text(wordPair.toString()),
      ),
    );
  }

}

//----------------------------- FlutterWidgetPage ------------------------------

class FlutterWidgetPage extends StatelessWidget {
  const FlutterWidgetPage({
    Key key,
    @required this.text,
    this.backgroundColor:Colors.grey,
  }):super(key:key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {

    debugPrint(" ✅✅✅ ❎❎❎ ❌❌❌ ");
    var args = ModalRoute.of(context).settings.arguments;
    debugPrint(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    debugPrint("RouterValue:$args");
    debugPrint("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");

    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: <Widget>[
//                Text(text*10, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
//                Text("Hello World", style: TextStyle(
//                  color: Colors.blueGrey, fontSize: 18.0, height: 1.5, fontFamily: "Courier", decoration: TextDecoration.underline, decorationStyle: TextDecorationStyle.dotted
//                )),
//                Text(text*6, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
//                Text(" "),
//                Text.rich(TextSpan(
//                  children: [
//                    TextSpan(text: "Home: "),
//                    TextSpan(text: "https://www.baidu.com", style: TextStyle(color: Colors.lightBlue)),
//                  ]
//                )),
//                DefaultTextStyle(
//                  style: TextStyle(color: Colors.red, fontSize: 20.0),
//                  textAlign: TextAlign.center,
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text("Hello World"),
//                      Text("This is XXX"),
//                      Text("This is XXX", style: TextStyle(inherit: false, color: Colors.grey),),
//                    ],
//                  ),
//                ),
//                Text(" "),
                RaisedButton(
                  child: Text("返回"),
                  onPressed: () => Navigator.pop(context),
                ),
//                FlatButton(
//                  child: Text("  123  "),
//                  onPressed: () { },
//                ),
//                OutlineButton(
//                  child: Text("  456  "),
//                  onPressed: () { },
//                ),
//                IconButton(
//                  icon: Icon(Icons.thumb_up),
//                  onPressed: () { },
//                ),
//                Text(" "),
                RaisedButton.icon(
                  icon: Icon(Icons.thumb_up),
                  label: Text("赞"),
                  onPressed: () => Navigator.pop(context),
                ),
//                FlatButton.icon(
//                  icon: Icon(Icons.add),
//                  label: Text("  123  "),
//                  onPressed: () { },
//                ),
//                OutlineButton.icon(
//                  icon: Icon(Icons.info),
//                  label: Text("  456  "),
//                  onPressed: () { },
//                ),
//                Text(" "),
                FlatButton(
//                  color: Color(0x000000),
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("提交"),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: (){ },
                ),
              ],
            ),
          )
      ),
    );
  }
}