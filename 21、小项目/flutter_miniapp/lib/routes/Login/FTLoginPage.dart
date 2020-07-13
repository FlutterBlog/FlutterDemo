import 'package:flutter/material.dart';
import '../../base/SP/FTLocalStorage.dart';

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
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _userDidLogin() {
    Future<dynamic> loginFuture = FTLocalStorage.saveBool("FTLoginType", true);
    loginFuture.then((value) {
      if (value is bool) {
        print(value);
      }
    }).whenComplete(() {
      Navigator.pop(context);
    });
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
                                  _userDidLogin();
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
