import 'package:flutter/material.dart';

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
          //
          Text(""),
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
          // 在AppBar中直接添加 actions 的子控件 SizedBox 宽高设置无效
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
              //子控件根据子控件资深的限制进行显示
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
