
import 'package:flutter/material.dart';
import 'FlutterCupertinoPage.dart';
import 'FlutterStateManagePage.dart';
import 'FlutterLoginPage.dart';

//import 'FlutterSecondPage.dart';
//import 'FlutterValuePage.dart';

// 首页  继承StatefulWidget 表示这是一个有状态的组件
// StatefulWidget  StatelessWidget


//首页类
class FlutterHomePage extends StatefulWidget {
  FlutterHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}


//首页状态类
class _MyHomePageState extends State<FlutterHomePage> {

  int _counter = 0;//定义一个状态

  bool _switchSelect = true; //维护单选开关状态
  bool _checkBoxValue = true;//维护复选框状态

  // 定义一个自增函数
  void _incrementCounter() {
    //setState 通知Flutter框架 状态发生变化 会重新构建 build 方法
    setState(() {
      _counter++;
    });
  }

  static GlobalKey<ScaffoldState> _globalKey= GlobalKey();

  // 构建Widge树
  @override
  Widget build(BuildContext context) {

    print("_MyHomePageState build");
    print("$_switchSelect  $_checkBoxValue");

    // Scaffold
    // Flutter Material 提供的脚手架 提供默认导航栏、标题、主屏幕Widge树的Body属性
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(//Center 将子组件树对齐到屏幕中心
        child: Column(//Column 将所有子组件沿屏幕垂直方向依次排列
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'you has click this button:',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline2,
            ),
            FlatButton(
              child: Text("下一页"),
              textColor: Colors.lightBlue,
              onPressed: (){
                //按钮的点击事件 跳转新页面
//                Navigator.push(context,
////                    MaterialPageRoute(builder: (context){
////                      return FlutterSecondPage();
////                    }, fullscreenDialog: true)
//
////                    MaterialPageRoute(builder: (context){
////                      return FlutterSecondPage();
////                    })
//                );

                // 按钮的点击事件 通过提前注册的路由 跳转新页面
//                Navigator.pushNamed(context, "TALSecondPage1", arguments: "SecondValue");
                Navigator.pushNamed(context, "TALSecondPage2", arguments: "SecondValue");

//                _globalKey.currentState.openDrawer();

                // Navigator.push(context, route)
                // Navigator.of(context).push(route)

                // Navigator
                // 路由管理类 提供打开路由和关闭路由的方法
                // push 将路由入栈 返回一个Future对象 可以接收新路由关闭时的返回数据
                // pop 将路由出栈 result为关闭时要返回的数据

                // MaterialPageRoute
                // builder：WidgeBuilder类型的回调函数 构建路由的具体内容 返回值是widget
                // setting：包含路由的配置信息 路由名称、是否初始路由等®
                // maintainState：默认入栈新路由时，原来的路由仍然保存在内存中，如果想在路由不用的时候释放资源。可以设置为 False
                // fullscreenDialog：表示新路由页面是否一个全屏的模态对话框 iOS中设置为true


                // Context
//                ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();
                //调用ScaffoldState的showSnackBar来弹出SnackBar
//                _state.showSnackBar(
//                  SnackBar(
//                    content: Text("我是SnackBar"),
//                  ),
//                );

//                Scaffold scaffold = context.findAncestorRenderObjectOfType();
//                print((scaffold.appBar as AppBar).title);

              },
            ),
            RaisedButton(
              child: Text("数据交互页"),
              onPressed: () async {

                // 打开页面并等待返回结果
//                var result = await Navigator.push(context,
//                    MaterialPageRoute(builder: (context){
//                      return FlutterValuePage(text: "数据传递",);
//                    })
//                );

                String nextValue = "RouterValue";
                print("数据交互输入: $nextValue");
                var result = await Navigator.pushNamed(context, "TALValuePage", arguments: nextValue);
                print("数据交互输出: $result");
              },
            ),
//            RaisedButton(
//              child: Text("CupertinoButton"),
//              onPressed: () {
//
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context){
//                    return ParentWidgetC();
////                  }, fullscreenDialog: true),
//                  }),
//                );
//              },
//            ),
            RaisedButton(
              child: Text("Login"),
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context){
                    return FlutterLoginPage();
//                  }, fullscreenDialog: true),
                  }),
                );
              },
            ),
//            Switch(
//              value: _switchSelect,//当前状态
//              onChanged: (value){
//                setState(() {
//                  _switchSelect = value;
//                });
//              },
//            ),
//            Checkbox(
//              value: _checkBoxValue,
//              activeColor: Colors.red,
//              onChanged: (value) {
//                setState(() {
//                  _checkBoxValue = value;
//                });
//              },
//            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(//悬浮按钮 onPressed属性接收一个回调函数 被点击后的响应事件 方法也是一个对象 可以直接传入方法对象
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.receipt),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}
