import 'package:flutter/material.dart';
import '../Login/FTLoginPage.dart';
import '../../base/SP/FTLocalStorage.dart';

class FTPage4 extends StatefulWidget {
  @override
  _FTPage4State createState() => _FTPage4State();
}

class _FTPage4State extends State<FTPage4> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
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
                if (_isLogin) {
                  Navigator.pushNamed(context, "AccountPage");
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => FTLoginPage(),
                        fullscreenDialog: true),
                  );
                }

                // Navigator.pushNamed(context, "Account");
              },
            ),
          ],
        ),
      ),
    );
  }
}
