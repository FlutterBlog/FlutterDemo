import 'package:flutter/material.dart';

class FTPage2 extends StatefulWidget {
  @override
  _FTPage2State createState() => _FTPage2State();
}

class _FTPage2State extends State<FTPage2> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SizedBox(
                width: 200,
                height: 44,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('院校'),
    //   ),
    //   body: new Container(
    //     alignment: Alignment.center,
    //     child: FutureBuilder(
    //       future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
    //       builder: (BuildContext context, AsyncSnapshot snapshot) {
    //         //请求完成
    //         if (snapshot.connectionState == ConnectionState.done) {
    //           Response response = snapshot.data;
    //           //发生错误
    //           if (snapshot.hasError) {
    //             return Text(snapshot.error.toString());
    //           }
    //           //请求成功，通过项目信息构建用于显示项目名称的ListView
    //           return ListView(
    //             children: response.data
    //                 .map<Widget>((e) => ListTile(title: Text(e["full_name"])))
    //                 .toList(),
    //           );
    //         }
    //         //请求未完成时弹出loading
    //         return CircularProgressIndicator();
    //       },
    //     ),
    //   ),
    // );
  }
}
