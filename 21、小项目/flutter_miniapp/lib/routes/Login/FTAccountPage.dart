import 'package:flutter/material.dart';
import 'package:flutter_miniapp/base/Tools/EventBus.dart';
import 'package:flutter_miniapp/base/Tools/FTLocalStorage.dart';

class FTAccountPage extends StatefulWidget {
  @override
  _FTAccountPageState createState() => _FTAccountPageState();
}

class _FTAccountPageState extends State<FTAccountPage> {
  void _userDidLogout() {
    Future<dynamic> loginFuture = FTLocalStorage.saveBool("FTLoginType", false);
    loginFuture.then((value) {
      if (value is bool) {
        print(value);
      }
      Navigator.pop(context);
    }).whenComplete(() {
      eventBus.fire(FTLoginTypeEvent(false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("账号中心"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                "退出登录",
                style: TextStyle(fontSize: 26.0, color: Colors.blue),
              ),
              onPressed: () {
                _userDidLogout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
