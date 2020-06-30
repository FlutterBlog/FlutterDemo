import 'package:flutter/material.dart';
// import 'dart:math' as math;

// 变换
class FTContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTContainerPage"),
      ),
      body: Column(
        children: <Widget>[
          // Text("你好", style: TextStyle(color: Colors.red, fontSize: 18.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("你好", style: TextStyle(color: Colors.purple, fontSize: 18.0))
            ],
          ),
          //
          // Container(
          //   //卡片容器的填充
          //   margin: EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 50),
          //   //卡片大小
          //   constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
          //   //背景装饰
          //   decoration: BoxDecoration(
          //     //径向渐变
          //     gradient: RadialGradient(
          //       colors: [Colors.red, Colors.orange],
          //       center: Alignment.topLeft,
          //       radius: .98,
          //     ),
          //     //阴影
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black54,
          //         offset: Offset(2, 2),
          //         blurRadius: 4.0,
          //       ),
          //     ],
          //   ),
          //   //卡片倾斜度
          //   transform: Matrix4.rotationZ(.2),
          //   alignment: Alignment.center,
          //   child: Text(
          //     "Big Data",
          //     style: TextStyle(color: Colors.white, fontSize: 40.0),
          //   ),
          // ),
          Container(
            margin: EdgeInsets.all(20.0), //容器外补白
            color: Colors.orange,
            child: Text("Hello world!"),
          ),
          Container(
            padding: EdgeInsets.all(20.0), //容器内补白
            color: Colors.orange,
            child: Text("Hello world!"),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text("Hello world!"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.orange),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Hello world!"),
            ),
          ),
        ],
      ),
    );
  }
}

// 变换
class FTTransformPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTTransformPage"),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center, //交叉轴
        // mainAxisAlignment: MainAxisAlignment.center, //主轴
        children: <Widget>[
          //
          Text(""),
          Text(""),
          Text(""),
          Container(
            color: Colors.black,
            child: new Transform(
              alignment: Alignment.topRight, // 相对于坐标系原点的对齐方式
              transform: new Matrix4.skewY(0.3), // 沿Y轴倾斜0.3弧度
              child: new Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text("Apartment for rent"),
              ),
            ),
          ),
          Text(""),
          Text(""),
          Text(""),
          // DecoratedBox(
          //   decoration: BoxDecoration(color: Colors.red),
          //   //默认原点为左上角，左移20像素，向上平移5像素
          //   child: Transform.translate(
          //     offset: Offset(10.0, -10.0),
          //     child: Text("Hello world"),
          //   ),
          // ),
          // Text(""),
          // DecoratedBox(
          //   decoration: BoxDecoration(color: Colors.red),
          //   child: Transform.rotate(
          //     //旋转90度
          //     angle: math.pi / 2,
          //     child: Text("Hello world"),
          //   ),
          // ),
          // Text(""),
          // DecoratedBox(
          //   decoration: BoxDecoration(color: Colors.red),
          //   child: Transform.scale(
          //     scale: 1.5,
          //     child: Text("Hello World"),
          //   ),
          // ),
          // Text(""),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     //
          //     DecoratedBox(
          //       decoration: BoxDecoration(color: Colors.red),
          //       child: Transform.scale(
          //         scale: 1.5,
          //         child: Text("Hello World"),
          //       ),
          //     ),
          //     //
          //     Text(
          //       "你好",
          //       style: TextStyle(color: Colors.green, fontSize: 18.0),
          //     ),
          //   ],
          // ),
          // Text(""),
          // Text("123"),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     //
          //     DecoratedBox(
          //       decoration: BoxDecoration(color: Colors.red),
          //       child: RotatedBox(quarterTurns: 1, child: Text("Hello World")),
          //     ),
          //     //
          //     Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0)),
          //   ],
          // ),
          // Text("123"),
        ],
      ),
    );
  }
}

// 装饰容器 可以在子组件绘制前 绘制一些装饰 比如背景、边框、渐变
class FTDecoratedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTDecoratedBoxPage"),
        actions: <Widget>[
          //
        ],
      ),
      body: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              // 渐变背景
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange[700]],
              ),
              // 圆角
              borderRadius: BorderRadius.circular(3.0),
              // 阴影
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2, 2),
                  blurRadius: 4.0,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 64, vertical: 52),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),
          //
        ],
      ),
    );
  }
}

// 尺寸限制容器 ConstrainedBox、SizedBox、UnconstrainedBox、AspectRatio
class FTConstrainedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTConstrainedBoxPage"),
        actions: <Widget>[
          // 在AppBar中直接添加 actions ��子控件 SizedBox 宽高设置无效
          // SizedBox(
          //   width: 20,
          //   height: 20,
          //   child: CircularProgressIndicator(
          //     strokeWidth: 2,
          //     valueColor: AlwaysStoppedAnimation(Colors.white),
          //   ),
          // ),
          //
          // 在AppBar中间接添加 actions 的子控件 SizedBox 宽高设置生效
          UnconstrainedBox(
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 20, minHeight: 20),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
          //
        ],
      ),
      body: Column(
        children: <Widget>[
          // ConstrainedBox 设置最小高度50 内部的子控件高度设置为5将无效
          ConstrainedBox(
            constraints:
                BoxConstraints(minWidth: double.infinity, minHeight: 60.0),
            child: Container(
              height: 5.0,
              child: redBox,
            ),
          ),
          Text(""),
          SizedBox(width: 60.0, height: 60.0, child: redBox),
          Text(""),
          //父子的最小限制冲突时 取父子限制中最大的
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0), //父
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //子
              child: redBox,
            ),
          ),
          Text(""),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
              child: redBox,
            ),
          ),
          Text(""),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
            // 通过 UnconstrainedBox 来清除父控件的限制
            child: UnconstrainedBox(
              //父控件的限制仍然生效 作用在 UnconstrainedBox 上
              //子������根据子控件资�����的限制��行显示
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90, minHeight: 20), //子
                child: redBox,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);

// 填充 Padding
class FTPaddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTPaddingPage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0), //左边添加8像素的留白
              child: Text("Hello World"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), //上下各添加8像素的留白
              child: Text("Hello World"),
            ),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0), //分别设置四周的留白
              child: Text("Hello World"),
            ),
          ],
        ),
      ),
    );
  }
}
