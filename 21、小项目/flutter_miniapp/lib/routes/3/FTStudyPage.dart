import 'package:flutter/material.dart';
import '../../network/FTNetManager.dart';

class FTStudyPage extends StatefulWidget {
  @override
  _FTStudyPageState createState() => _FTStudyPageState();
}

class _FTStudyPageState extends State<FTStudyPage> {
  bool _isLoading;
  List _dataList;

  @override
  void initState() {
    super.initState();
    _requestList();
  }

  void _requestList() {
    _isLoading = true;
    _dataList = [];

    final url = 'https://api.github.com/orgs/flutterchina/repos';
    FTNetManager.get(url, success: (data) {
      // print(data);
      setState(() {
        _isLoading = false;
        _dataList = data;
      });
    }, error: (error) {
      // print(error);
      setState(() {
        _isLoading = false;
      });
    });
  }

  Widget _returnWidget() {
    if (_isLoading) {
      return CircularProgressIndicator();
    } else {
      return ListView(
        children: _dataList
            .map((e) => ListTile(
                  title: Text(e['full_name']),
                ))
            .toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        alignment: Alignment.center,
        child: _returnWidget(),
      ),
    );
  }
}
