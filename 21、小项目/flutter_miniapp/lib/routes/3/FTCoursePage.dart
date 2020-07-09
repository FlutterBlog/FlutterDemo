import 'package:flutter/material.dart';
import 'package:flutter_miniapp/models/CourseListModel.dart';
import '../../network/FTNetManager.dart';
import '../../models/CourseListModel.dart';
import '../../models/CourseEntModel.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

class FTCoursePage extends StatefulWidget {
  @override
  _FTCoursePageState createState() => _FTCoursePageState();
}

class _FTCoursePageState extends State<FTCoursePage>
    with SingleTickerProviderStateMixin {
  bool _isLoading;
  List<CourseListModel> _dataList;
  List<CourseEntModel> _endList;
  ScrollController _scrollViewController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _requestBanner();
    _requestList();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  void _requestBanner() {
    _isLoading = true;
    _endList = [];

    var bannerUrl = 'https://xapi.kybyun.com/course/index/courseBannerTab';
    FTNetManager.get(bannerUrl, success: (data) {
      Map dataMap = json.decode(data);
      Map<String, dynamic> resDic = dataMap["res"];
      print(resDic);

      var list = resDic["ent"] as List;
      List<CourseEntModel> modelList =
          list.map((e) => CourseEntModel.fromJson(e)).toList();
      setState(() {
        _endList = modelList;
      });
    }, error: (error) {
      print(error);
    });
  }

  void _requestList() {
    _isLoading = true;
    _dataList = [];

    var listUrl = "https://xapi.kybyun.com/course/index/courseList";
    FTNetManager.get(listUrl, success: (data) {
      Map dataMap = json.decode(data);
      List courseDataList = dataMap["res"]["course_list"];
      // print(courseDataList);

      List _courseModelList = courseDataList.map((e) {
        print(e);

        CourseListModel listModel = CourseListModel(
          e["name"],
          e["type"],
          e["course"],
        );

        var classDataList = listModel.course;
        switch (listModel.type) {
          case "1":
            //公开课
            List<CourseFreeClassModel> _classModelList = classDataList
                .map((e) => CourseFreeClassModel.fromJson(e))
                .toList();
            listModel.course = _classModelList;
            break;
          case "2":
            //班课
            List<CourseVipClassModel> _classModelList = classDataList
                .map((e) => CourseVipClassModel.fromJson(e))
                .toList();
            listModel.course = _classModelList;
            break;
          default:
            //无
            listModel.course = [];
            break;
        }
        return listModel;
      }).toList();

      setState(() {
        _isLoading = false;
        _dataList = _courseModelList;
      });
    }, error: (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
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
      // return _returnCustomScrollWidget();
      return _returnScrollWidget();
    }
  }

  Widget _returnScrollWidget() {
    return NestedScrollView(
      controller: _scrollViewController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                height: double.infinity,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 20.0, bottom: 50),
                  child: Image(
                    image: NetworkImage(
                        "http://pic.sc.chinaz.com/files/pic/pic9/202006/bpic20606.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.black54,
              tabs: [
                Tab(
                  child: Text("推荐", style: TextStyle(color: Colors.black54)),
                ),
                Tab(
                  child: Text("专业课", style: TextStyle(color: Colors.black54)),
                ),
                Tab(
                  child: Text("政治", style: TextStyle(color: Colors.black54)),
                ),
                Tab(
                  child: Text("英语", style: TextStyle(color: Colors.black54)),
                ),
                Tab(
                  child: Text("复试", style: TextStyle(color: Colors.black54)),
                ),
              ],
            ),
          )
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _buildListView("aaa:"),
          _buildListView("bbb:"),
          _buildListView("ccc:"),
          _buildListView("ddd:"),
          _buildListView("eee:"),
        ],
      ),
    );
  }

  Widget _buildListView(String s) {
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) => Divider(
              color: Colors.grey,
              height: 1,
            ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              color: Colors.white,
              child: ListTile(title: Text("$s第$index 个条目")));
        });
  }

  Widget _returnCustomScrollWidget() {
    return Material(
      child: CustomScrollView(
        // SliverPersistentHeader
        slivers: <Widget>[
          // SliverAppBar
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image(
                image: NetworkImage(
                    "http://pic.sc.chinaz.com/files/pic/pic9/202006/bpic20606.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // SliverPadding
          // SliverPadding(
          //   padding: const EdgeInsets.all(8.0),
          //   sliver: new SliverGrid(
          //     //Grid
          //     gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2, //Grid按两列显示
          //       mainAxisSpacing: 10.0,
          //       crossAxisSpacing: 10.0,
          //       childAspectRatio: 4.0,
          //     ),
          //     delegate: new SliverChildBuilderDelegate(
          //       (BuildContext context, int index) {
          //         //创建子widget
          //         return new Container(
          //           alignment: Alignment.center,
          //           color: Colors.cyan[100 * (index % 9)],
          //           child: new Text('grid item $index'),
          //         );
          //       },
          //       childCount: 20,
          //     ),
          //   ),
          // ),

          // SliverFixedExtentList
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              //创建列表项
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            }, childCount: 50 //50个列��项
                ),
          ),
        ],
      ),
    );
    // return ListView(
    //   children: _dataList
    //       .map((e) => ListTile(
    //             title: Text(e.name),
    //           ))
    //       .toList(),
    // );
  }
}
