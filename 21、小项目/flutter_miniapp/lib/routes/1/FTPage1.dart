import 'package:flutter/material.dart';
import 'package:flutter_miniapp/base/Tools/EventBus.dart';
import 'package:flutter_miniapp/base/Tools/FTLocalStorage.dart';
import 'package:flutter_miniapp/routes/Login/FTLoginPage.dart';

class FTPage1 extends StatefulWidget {
  @override
  _FTPage1State createState() => _FTPage1State();
}

class _FTPage1State extends State<FTPage1> {
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
        print("111 Future.then.value");
        print(value);
        setState(() {
          _isLogin = value;
        });
      }
    }).whenComplete(() {
      setState(() {});
    });
  }

  void _userClearLocalData() {
    Future<dynamic> loginFuture = FTLocalStorage.clear();
    loginFuture.then((value) {
      if (value is bool) {
        print(value);
      }
    }).whenComplete(() {
      print('Future.whenComplete');
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
        title: Text("主页"),
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
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: () {
              print("Icons.share");
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
                "主页",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                _userClickAccountBtn();
              },
            ),
            RaisedButton(
              child: Text(
                "清除缓存",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                _userClearLocalData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
