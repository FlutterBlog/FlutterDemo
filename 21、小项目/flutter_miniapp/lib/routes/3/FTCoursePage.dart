import 'package:flutter/material.dart';
import '../../network/FTNetManager.dart';
import '../../models/index.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

class FTCoursePage extends StatefulWidget {
  @override
  _FTCoursePageState createState() => _FTCoursePageState();
}

class _FTCoursePageState extends State<FTCoursePage> {
  bool _isLoading;
  List _dataList;

  @override
  void initState() {
    super.initState();
    _requestBanner();
    // _requestList();
  }

  void _requestList() {
    _isLoading = true;
    _dataList = [];

    var listUrl = "https://xapi.kybyun.com/course/index/courseList";
    FTNetManager.get(listUrl, success: (data) {
      // print(data);

      // setState(() {
      //   _isLoading = false;
      //   _dataList = data;
      // });
    }, error: (error) {
      print(error);
      // setState(() {
      //   _isLoading = false;
      // });
    });
  }

  void _requestBanner() {
    _isLoading = true;
    _dataList = [];

    var bannerUrl = 'https://xapi.kybyun.com/course/index/courseBannerTab';
    FTNetManager.get(bannerUrl, success: (data) {
      // Map <String, dynamic>resDic = {};
      Map dataMap = json.decode(data);

      Map<String, dynamic> resDic = dataMap["res"];
      print(resDic);

      var model = new CourseTopModel.fromJson(resDic);
      print(model.banner);
      print(model.ent);

      // setState(() {
      //   _isLoading = false;
      //   _dataList = data;
      // });
    }, error: (error) {
      print(error);
      // setState(() {
      //   _isLoading = false;
      // });
    });
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
}
