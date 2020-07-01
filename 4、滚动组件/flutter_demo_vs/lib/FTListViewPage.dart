import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// ListView 添加表头
class FTListViewHeadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTListViewHeadPage"),
      ),
      // 表头 + 列表 + 固定高度
      // body: Column(
      //   children: <Widget>[
      //     ListTile(title: Text("HeaderView")),
      //     SizedBox(
      //       height: 400,
      //       child: ListView.builder(
      //         itemCount: 50,
      //         itemExtent: 50,
      //         itemBuilder: (context, index) {
      //           return ListTile(title: Text("$index"));
      //         },
      //       ),
      //     ),
      //   ],
      // ),

      // 表头 + 列表 + 计算高度
      // body: Column(
      //   children: <Widget>[
      //     ListTile(title: Text("HeaderView")),
      //     SizedBox(
      //       height: MediaQuery.of(context).size.height - 44 - 56 - 56,
      //       child: ListView.builder(
      //         itemCount: 50,
      //         itemExtent: 50,
      //         itemBuilder: (context, index) {
      //           return ListTile(title: Text("$index"));
      //         },
      //       ),
      //     ),
      //   ],
      // ),

      // 表头 + 列表 + 动态高度
      body: Column(
        children: <Widget>[
          ListTile(title: Text("HeaderView")),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemExtent: 50,
              itemBuilder: (context, index) {
                return ListTile(title: Text("$index"));
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ListView 滑动加载
class FTListViewMorePage extends StatefulWidget {
  @override
  _FTListViewMorePageState createState() => _FTListViewMorePageState();
}

// ListView 滑动加载
class _FTListViewMorePageState extends State<FTListViewMorePage> {
  static const loadingTag = "##Loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    requestData();
  }

  @override
  Widget build(BuildContext context) {
    // 构造器
    return Scaffold(
      appBar: AppBar(
        title: Text("FTListViewMorePage"),
      ),
      body: Scrollbar(
        child: ListView.separated(
          itemCount: _words.length,
          itemBuilder: (context, index) {
            if (_words[index] == loadingTag) {
              if (_words.length - 1 < 100) {
                // 获取数据
                requestData();
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2.0),
                  ),
                );
              } else {
                // 数据超过100 不在获取新数据
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text("没有更多了", style: TextStyle(color: Colors.grey)),
                );
              }
            }
            return ListTile(title: Text(_words[index]));
          },
          separatorBuilder: (context, index) => Divider(height: .0),
        ),
      ),
    );
  }

  void requestData() {
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        _words.insertAll(
          _words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }
}

// ListView 添加分割线
class FTListViewLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 两根横线
    Widget divider1 = Divider(color: Colors.black38);
    Widget divider2 = Divider(color: Colors.red);

    // 构造器1
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("FTListViewPage"),
    //   ),
    //   body: Scrollbar(
    //     child: ListView.builder(
    //       itemCount: 50,
    //       itemExtent: 50,
    //       itemBuilder: (context, index) {
    //         return ListTile(title: Text("ListView: $index"));
    //       },
    //     ),
    //   ),
    // );

    // 构造器2
    return Scaffold(
      appBar: AppBar(
        title: Text("FTListViewLinePage"),
      ),
      body: Scrollbar(
        child: ListView.separated(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(title: Text("ListView: $index"));
          },
          separatorBuilder: (context, index) {
            return index % 2 == 0 ? divider1 : divider2;
          },
        ),
      ),
    );
  }
}

// ListView 延迟构建
class FTListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTListViewPage"),
      ),
      // 滚动条有
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 50,
          itemExtent: 50,
          itemBuilder: (context, index) {
            return ListTile(title: Text("$index"));
          },
        ),
      ),
      // 滚动条无
      // body: ListView.builder(
      //   itemCount: 50,
      //   itemExtent: 50,
      //   itemBuilder: (context, index) {
      //     return ListTile(title: Text("$index"));
      //   },
      // ),
    );
  }
}

// ListView
// class FTListViewPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("FTListViewPage"),
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         padding: const EdgeInsets.all(20.0),
//         children: <Widget>[
//           const Text('I\'m dedicating every day to you'),
//           Text(''),
//           const Text('Domestic life was never quite my style'),
//           Text(''),
//           const Text('When you smile, you knock me out, I fall apart'),
//           Text(''),
//           const Text('And I thought I was so smart'),
//           Text(''),
//           const Text('I\'m dedicating every day to you'),
//           Text(''),
//           const Text('Domestic life was never quite my style'),
//           Text(''),
//           const Text('When you smile, you knock me out, I fall apart'),
//           Text(''),
//           const Text('And I thought I was so smart'),
//           Text(''),
//           const Text('I\'m dedicating every day to you'),
//           Text(''),
//           const Text('Domestic life was never quite my style'),
//           Text(''),
//           const Text('When you smile, you knock me out, I fall apart'),
//           Text(''),
//           const Text('And I thought I was so smart'),
//           Text(''),
//           const Text('I\'m dedicating every day to you'),
//           Text(''),
//           const Text('Domestic life was never quite my style'),
//           Text(''),
//           const Text('When you smile, you knock me out, I fall apart'),
//           Text(''),
//           const Text('And I thought I was so smart'),
//           Text(''),
//           const Text('I\'m dedicating every day to you'),
//           Text(''),
//           const Text('Domestic life was never quite my style'),
//           Text(''),
//           const Text('When you smile, you knock me out, I fall apart'),
//           Text(''),
//           const Text('And I thought I was so smart'),
//           Text(''),
//           const Text('I\'m dedicating every day to you'),
//           Text(''),
//           const Text('Domestic life was never quite my style'),
//           Text(''),
//           const Text('When you smile, you knock me out, I fall apart'),
//           Text(''),
//           const Text('And I thought I was so smart'),
//           Text(''),
//           const Text('I\'m dedicating every day to you'),
//           Text(''),
//           const Text('Domestic life was never quite my style'),
//           Text(''),
//           const Text('When you smile, you knock me out, I fall apart'),
//           Text(''),
//           const Text('And I thought I was so smart'),
//           Text(''),
//         ],
//       ),
//       // body: Column(
//       //   children: <Widget>[
//       //     Row(
//       //       mainAxisAlignment: MainAxisAlignment.center,
//       //       children: <Widget>[
//       //         Text(
//       //           "FTListViewPage",
//       //           style: TextStyle(color: Colors.purple, fontSize: 18.0),
//       //         ),
//       //       ],
//       //     ),
//       //   ],
//       // ),
//     );
//   }
// }
