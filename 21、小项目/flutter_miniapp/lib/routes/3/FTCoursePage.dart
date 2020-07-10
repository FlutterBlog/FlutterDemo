import 'package:flutter/material.dart';
import 'package:flutter_miniapp/models/CourseListModel.dart';
import '../../models/CourseListModel.dart';
import '../../models/CourseListModel.dart';
import '../../models/CourseListModel.dart';
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
        CourseListModel listModel = CourseListModel(
          e["name"],
          e["type"],
          e["course"],
        );

        var classDataList = listModel.course;
        switch (listModel.type) {
          case 1:
            //公开课
            List<CourseFreeClassModel> _classModelList = classDataList
                .map((e) => CourseFreeClassModel.fromJson(e))
                .toList();
            listModel.course = _classModelList;
            break;
          case 2:
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
      return _returnScrollWidget();
    }
  }

  Widget _returnScrollWidget() {
    return NestedScrollView(
      controller: _scrollViewController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.grey[50],
            pinned: true,
            floating: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                height: double.infinity,
                color: Colors.grey[50],
                child: Container(
                  margin: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 20.0, bottom: 55),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(
                          "http://pic.sc.chinaz.com/files/pic/pic9/202006/bpic20606.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                Text("推荐"),
                Text("专业课"),
                Text("英语"),
                Text("政治"),
                Text("复试"),
              ],
              indicatorWeight: 1,
              indicatorPadding: EdgeInsets.only(left: 10, right: 10),
              labelPadding: EdgeInsets.symmetric(horizontal: 10),
              isScrollable: true,
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              labelStyle: TextStyle(
                fontSize: 22.0,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelColor: Color(0xffAAAAAA),
              unselectedLabelStyle: TextStyle(
                fontSize: 22.0,
                color: Color(0xffAAAAAA),
              ),
              indicatorSize: TabBarIndicatorSize.label,
            ),
          )
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _buildListView(0),
          _buildListView(1),
          _buildListView(2),
          _buildListView(3),
          _buildListView(4),
        ],
      ),
    );
  }

  Widget _buildListView(int groupID) {
    return ListView.builder(
      itemCount: _dataList.length > 0 ? _dataList.first.course.length : 0,
      itemExtent: 196,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.grey,
          child: _buildListItem(groupID, index),
        );
      },
    );
  }

  Widget _buildListItem(int groupID, int idx) {
    return new Container(
      alignment: Alignment.topLeft,
      padding:
          const EdgeInsets.only(left: 24.0, right: 24.0, top: 6.0, bottom: 6.0),
      color: Colors.grey[50],
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.topLeft, //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 78, bottom: 74),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "大纲出来之前该如何复习",
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, height: 1.5),
                  ),
                  Text(
                    "· 考研政治命题规律",
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),
                  Text(
                    "· 复习注意事项",
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 125, left: 16, right: 95, bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "645 名同学已报名",
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),
                  Text(
                    "开讲时间：2020.12.10 19:00",
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 18.0,
              bottom: 18.0,
              child: Container(
                alignment: Alignment(0, 0),
                height: 28,
                width: 76,
                //边框设置
                decoration: new BoxDecoration(
                  //背景
                  color: Colors.blue,
                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  //设置四周边框
                  // border: new Border.all(width: 1, color: Colors.blue),
                ),
                child: Text(
                  "免费报名",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              height: 68,
              width: 50,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image(
                      width: 50,
                      height: 50,
                      image: NetworkImage(
                          "http://bpic.588ku.com/element_origin_min_pic/01/49/81/695744871999d35.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("data"),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // if (groupID == 0) {
    //   CourseListModel groupModel = _dataList.first;

    //   switch (groupModel.type) {
    //     case 1:
    //       // CourseFreeClassModel classModel = groupModel.course[idx];
    //       // return ListTile(title: Text(classModel.name));
    //       return new Container(
    //         alignment: Alignment.center,
    //         padding: const EdgeInsets.only(
    //             left: 24.0, right: 24.0, top: 6.0, bottom: 6.0),
    //         color: Colors.white,
    //         child: new Text('list item $idx'),
    //       );
    //     case 2:
    //       // CourseVipClassModel classModel = groupModel.course[idx];
    //       // return ListTile(title: Text(classModel.name));

    //       return new Container(
    //         alignment: Alignment.center,
    //         padding: const EdgeInsets.only(
    //             left: 24.0, right: 24.0, top: 6.0, bottom: 6.0),
    //         color: Colors.white,
    //         // height: 184.0,
    //         child: new Text('list item $idx'),
    //       );
    //     default:
    //       break;
    //   }
    // }
    // return ListTile(title: Text("第 $idx 个条目"));
  }

  // Widget _returnCustomScrollWidget() {
  //   return Material(
  //     child: CustomScrollView(
  //       // SliverPersistentHeader
  //       slivers: <Widget>[
  //         // SliverAppBar
  //         SliverAppBar(
  //           pinned: true,
  //           expandedHeight: 250.0,
  //           flexibleSpace: FlexibleSpaceBar(
  //             title: const Text('Demo'),
  //             background: Image(
  //               image: NetworkImage(
  //                   "http://pic.sc.chinaz.com/files/pic/pic9/202006/bpic20606.jpg"),
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),

  //         // SliverPadding
  //         // SliverPadding(
  //         //   padding: const EdgeInsets.all(8.0),
  //         //   sliver: new SliverGrid(
  //         //     //Grid
  //         //     gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
  //         //       crossAxisCount: 2, //Grid按两列显示
  //         //       mainAxisSpacing: 10.0,
  //         //       crossAxisSpacing: 10.0,
  //         //       childAspectRatio: 4.0,
  //         //     ),
  //         //     delegate: new SliverChildBuilderDelegate(
  //         //       (BuildContext context, int index) {
  //         //         //创建子widget
  //         //         return new Container(
  //         //           alignment: Alignment.center,
  //         //           color: Colors.cyan[100 * (index % 9)],
  //         //           child: new Text('grid item $index'),
  //         //         );
  //         //       },
  //         //       childCount: 20,
  //         //     ),
  //         //   ),
  //         // ),

  //         // SliverFixedExtentList
  //         new SliverFixedExtentList(
  //           itemExtent: 50.0,
  //           delegate: new SliverChildBuilderDelegate(
  //               (BuildContext context, int index) {
  //             //创建列表项
  //             return new Container(
  //               alignment: Alignment.center,
  //               color: Colors.lightBlue[100 * (index % 9)],
  //               child: new Text('list item $index'),
  //             );
  //           }, childCount: 50 //50个列��项
  //               ),
  //         ),
  //       ],
  //     ),
  //   );
  //   // return ListView(
  //   //   children: _dataList
  //   //       .map((e) => ListTile(
  //   //             title: Text(e.name),
  //   //           ))
  //   //       .toList(),
  //   // );
  // }
}
