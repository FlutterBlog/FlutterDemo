import 'package:flutter/material.dart';

//类
class FTLoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

//状态类
class _LoginPageState extends State<FTLoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  TextEditingController _tfController1 = TextEditingController();
  TextEditingController _tfController2 = TextEditingController();

  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    //动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));

    super.initState();

    _tfController1.addListener(() {
      print(_tfController1.text);
    });

    _tfController2.addListener(() {
      print(_tfController2.text);
    });

    focusNode1.addListener(() {
      print(focusNode1.hasFocus);
    });

    focusNode2.addListener(() {
      print(focusNode2.hasFocus);
    });

//    _tfController1.text = "hello world";
//    _tfController1.selection = TextSelection(
//      baseOffset: 2,
//      extentOffset: _tfController1.text.length,
//    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
//                Theme(data: Theme.of(context).copyWith(
//                  hintColor: Colors.red,
//                  inputDecorationTheme: InputDecorationTheme(
//                    labelStyle: TextStyle(color: Colors.grey),//定义label字体样式
//                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0)//定义提示文本样式
//                  ),
//                ), child: Column(children: <Widget>[
//                  TextField(
//                    autofocus: true,
//                    focusNode: focusNode1,//关联focusNode1
//                    decoration: InputDecoration(
//                      prefixIcon: Icon(Icons.lock),
//                      labelText: "用户名",
//                      hintText: "请输入用户名",
//                      enabledBorder: UnderlineInputBorder(
//                        borderSide: BorderSide(color: Colors.grey),
//                      ),
//                      focusedBorder: UnderlineInputBorder(
//                        borderSide: BorderSide(color: Colors.blue),
//                      ),
//                    ),
//                    controller: _tfController1,
//                  ),
//                  TextField(
//                    focusNode: focusNode2,//关联focusNode2
//                    decoration: InputDecoration(
//                      prefixIcon: Icon(Icons.lock),
//                      labelText: "密码",
//                      hintText: "请输入登录密码",
//                      hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
//                    ),
//                    controller: _tfController2,
//                  ),
//                ],)),
//                TextField(
//                  autofocus: true,
//                  focusNode: focusNode1,//关联focusNode1
//                  decoration: InputDecoration(
//                    prefixIcon: Icon(Icons.lock),
//                    labelText: "用户名",
//                    hintText: "请输入用户名",
//                    enabledBorder: UnderlineInputBorder(
//                      borderSide: BorderSide(color: Colors.grey),
//                    ),
//                    focusedBorder: UnderlineInputBorder(
//                        borderSide: BorderSide(color: Colors.blue),
//                    ),
//                  ),
//                  controller: _tfController1,
////                  onChanged: (v){
////                    print(v);
////                  },
//                ),
//                TextField(
//                  focusNode: focusNode2,//关联focusNode2
//                  decoration: InputDecoration(
//                    prefixIcon: Icon(Icons.lock),
//                    labelText: "密码",
//                    hintText: "请输入登录密码",
//                    hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
//                  ),
//                  controller: _tfController2,
////                  onChanged: (v){
////                    print(v);
////                  },
//                ),

                TextFormField(
                  autofocus: true,
                  focusNode: focusNode1, //关联focusNode1
                  controller: _tfController1,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "用户名",
                    hintText: "请输入用户名",
                  ),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  },
                ),
                TextFormField(
                  autofocus: true,
                  obscureText: true,
                  focusNode: focusNode2, //关联focusNode1
                  controller: _tfController2,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "密码",
                    hintText: "请输入登录密码",
                  ),
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            return RaisedButton(
                              padding: EdgeInsets.all(16.0),
                              child: Text("完成"),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: () {
                                if (Form.of(context).validate()) {
                                  Navigator.pop(context);
                                }
                              },
                            );
                          },
                        ),

//                        child: RaisedButton(
//                          padding: EdgeInsets.all(16.0),
//                          child: Text("完成"),
//                          color: Theme.of(context).primaryColor,
//                          textColor: Colors.white,
//                          onPressed: () {
//
//                            print("==================");
//                            if ((_formKey.currentState as FormState).validate()) {
//                              print(123123123);
//                            }
//
//                          },
//                        ),
                      ),
                    ],
                  ),
                ),
//                Container(
//                  child: TextField(
//                    keyboardType: TextInputType.emailAddress,
//                    decoration: InputDecoration(
//                      prefixIcon: Icon(Icons.email),
//                      labelText: "Email",
//                      hintText: "请输入电子邮箱",
//                      border: InputBorder.none, //隐藏下划线
//                      focusedBorder: UnderlineInputBorder(
//                        borderSide: BorderSide(color: Colors.blue),
//                      ),
//                    ),
//                  ),
//                  decoration: BoxDecoration(
//                    border: Border(bottom: BorderSide(color: Colors.red[200], width: 1.0))
//                  ),
//                ),

//                Builder(builder: (ctx) {
//                  return Column(
//                    children: <Widget>[
//                      RaisedButton(
//                        child: Text("移动焦点"),
//                        onPressed: () {
//                          // 将焦点从第一个TextField移到第二个TextField
//                          // 第一种写法
////                          FocusScope.of(context).requestFocus(focusNode2);
//
//                          // 第二种写法
//                          if (focusScopeNode == null) {
//                            focusScopeNode = FocusScope.of(context);
//                          }
//                          focusScopeNode.requestFocus(focusNode2);
//                        },
//                      ),
//                      RaisedButton(
//                        child: Text("隐藏键盘"),
//                        onPressed: () {
//                          // 当所有编辑框都失去焦点时键盘就会收起
//                          focusNode1.unfocus();
//                          focusNode2.unfocus();
//                        },
//                      ),
//                    ],
//                  );
//                },
//                ),

                // 线形进度 默认高度
                //  LinearProgressIndicator(backgroundColor: Colors.grey[200],),
                //  Text(""),
                //  LinearProgressIndicator(backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation(Colors.blue),),
                //  Text(""),
                //  LinearProgressIndicator(backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation(Colors.blue), value: 0.35,),
                //  Text(""),

                // 圆形进度 默认父视图大小
                //  CircularProgressIndicator(),
                //  Text(""),
                //  CircularProgressIndicator(backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation(Colors.blue),),
                //  Text(""),
                //  CircularProgressIndicator(backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation(Colors.blue), value: 0.35, strokeWidth: 3.0,),

                // 线形进度 自定义高度
                //  SizedBox(
                //    height: 3,
                //    child: LinearProgressIndicator(backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation(Colors.blue),),
                //  ),
                //  Text(""),
                //  SizedBox(
                //    height: 3,
                //    child: LinearProgressIndicator(backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation(Colors.blue), value: 0.35,),
                //  ),
                //  Text(""),

                // 圆形进度 自定义尺寸
                //  SizedBox(
                //    width: 99,
                //    height: 99,
                //    child: CircularProgressIndicator(backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation(Colors.blue), strokeWidth: 3.0,),
                //  ),
                //  Text(""),

                // 进度条
                // SizedBox(
                //   width: 90,
                //   height: 90,
                //   child: CircularProgressIndicator(
                //     backgroundColor: Colors.grey[200],
                //     valueColor: AlwaysStoppedAnimation(Colors.blue),
                //     strokeWidth: 5.0,
                //     value: 0.8,
                //   ),
                // ),
                // Text(""),

                // 进度条
                // // 颜色动画
                // LinearProgressIndicator(
                //   backgroundColor: Colors.grey[200],
                //   valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                //       .animate(_animationController),
                //   value: _animationController.value,
                // ),
              ],
            ),
          )),
    );
  }
}
