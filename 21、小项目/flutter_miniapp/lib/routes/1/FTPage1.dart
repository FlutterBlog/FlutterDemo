import 'package:flutter/material.dart';
import '../Login/FTLoginPage.dart';
import '../../base/SP/FTLocalStorage.dart';

class FTPage1 extends StatefulWidget {
  @override
  _FTPage1State createState() => _FTPage1State();
}

class _FTPage1State extends State<FTPage1> {
  var _isLogin = false;

  @override
  void initState() {
    super.initState();
    _checkLogin();
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
          ],
        ),
      ),
    );
  }
}
