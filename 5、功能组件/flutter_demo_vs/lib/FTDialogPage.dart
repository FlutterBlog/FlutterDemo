import 'package:flutter/material.dart';

class FTDialogPage extends StatefulWidget {
  @override
  _FTDialogPageState createState() => new _FTDialogPageState();
}

class _FTDialogPageState extends State<FTDialogPage> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  // 从底部模态弹出一个全屏菜单
  // PersistentBottomSheetController<int> _showBottomSheet() {
  //   return showBottomSheet<int>(
  //     context: context,
  //     builder: (context) {
  //       return ListView.builder(
  //         itemCount: 20,
  //         itemBuilder: (context, index) {
  //           return ListTile(
  //             title: Text("$index"),
  //             onTap: () {
  //               print(index);
  //               Navigator.of(context).pop();
  //             },
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  // 从底部模态弹出菜单
  Future<int> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  // 弹出选择框
  Future<void> changeLanguage() async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("titletitle"),
          content: Text("contentcontentcontentcontent"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("取消"),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("确认"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("FTDialogPage"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("弹出 对话框 111"),
            onPressed: () async {
              bool delete = await showDeleteConfirmDialog1();
              if (delete == null) {
                print("取消");
              } else {
                print("确认");
              }
            },
          ),
          RaisedButton(
            child: Text("弹出 对话框 222"),
            onPressed: () async {
              final value = await changeLanguage();
            },
          ),
          RaisedButton(
            child: Text("弹出 对话框 333"),
            onPressed: () async {
              int value = await _showModalBottomSheet();
              print(value);
            },
          ),
          RaisedButton(
            child: Text("弹出 对话框 444"),
            onPressed: () async {
              _scaffoldkey.currentState.showBottomSheet((context) {
                // 从底部 模态弹出一个固定高度控件
                // return new Container(
                //   height: 300.0,
                //   color: Colors.greenAccent,
                //   child: new Center(
                //     child: new Text("Hi BottomSheet"),
                //   ),
                // );

                // 从底部 模态弹出一个全屏菜单
                return ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () {
                        print(index);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                );
              });
            },
          ),
          RaisedButton(
            child: Text("弹出 对话框 555"),
            onPressed: () async {
              // final value = await _showModalBottomSheet();
              // print(value);
            },
          ),
          // 控制居中 可以什么东西都不放
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // RaisedButton(
              //   child: Text("FTDialogPage"),
              //   onPressed: () {},
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
