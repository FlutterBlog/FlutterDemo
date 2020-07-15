import 'package:flutter/material.dart';
import 'package:flutter_miniapp/base/Tools/EventBus.dart';
import 'package:flutter_miniapp/base/Tools/FTLocalStorage.dart';
import 'package:flutter_miniapp/routes/Login/FTLoginPage.dart';

class FTPage4 extends StatefulWidget {
  @override
  _FTPage4State createState() => _FTPage4State();
}

class _FTPage4State extends State<FTPage4> {
  var _isLogin = false;
  var _subScription;

  @override
  void initState() {
    super.initState();
    _checkLogin();

    // 添加订阅
    _subScription = eventBus.on<FTLoginTypeEvent>().listen((event) {
      print(event.loginType);
      setState(() {
        _isLogin = event.loginType;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    //取消订阅
    _subScription.cancel();
  }

  _checkLogin() {
    Future<dynamic> loginFuture = FTLocalStorage.getBool("FTLoginType");
    loginFuture.then((value) {
      if (value is bool) {
        setState(() {
          _isLogin = value;
        });
      }
    });
  }

  _userClickAccountBtn() {
    if (_isLogin) {
      Navigator.pushNamed(context, "AccountPage");
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => FTLoginPage(), fullscreenDialog: true),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              _userClickAccountBtn();
            },
          ),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.photo_camera, color: Colors.white),
            onPressed: () {
              print("Icons.photo_camera");
            },
          );
        }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                "我的",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                _userClickAccountBtn();
              },
            ),
          ],
        ),
      ),
    );
  }
}
