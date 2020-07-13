import 'package:flutter/material.dart';
import 'package:flutter_miniapp/models/CourseListModel.dart';
import '../../models/CourseListModel.dart';
import '../../network/FTNetManager.dart';
import '../../models/CourseEntModel.dart';
import 'dart:convert';
//import 'package:json_annotation/json_annotation.dart';

class FTCoursePage extends StatefulWidget {
  @override
  _FTCoursePageState createState() => _FTCoursePageState();
}

class _FTCoursePageState extends State<FTCoursePage>
    with SingleTickerProviderStateMixin {
  bool _isLoading;
  List _dataList;
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
//      print(resDic);

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

      List<CourseListModel> _courseModelList = courseDataList.map((e) {
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

      List _resultList = [];
      for (var item in _courseModelList) {
        if (item.course.length > 0) {
          CourseListModel _sectionModel =
              CourseListModel(item.name, item.type, []);
          _resultList.add(_sectionModel);
          _resultList.addAll(item.course);
        }
      }

      setState(() {
        _isLoading = false;
        _dataList = _resultList;
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
            backgroundColor: Colors.grey[100],
            pinned: true,
            floating: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                height: double.infinity,
                color: Colors.grey[100],
                child: Container(
                  margin: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 20.0, bottom: 45),
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
                Text(
                  "推荐",
                  style: TextStyle(height: 2.5),
                ),
                Text(
                  "专业课",
                  style: TextStyle(height: 2.5),
                ),
                Text(
                  "英语",
                  style: TextStyle(height: 2.5),
                ),
                Text(
                  "政治",
                  style: TextStyle(height: 2.5),
                ),
                Text(
                  "复试",
                  style: TextStyle(height: 2.5),
                ),
              ],
              indicatorWeight: 1,
              indicatorColor: Colors.blue,
              indicatorPadding: EdgeInsets.only(left: 10, right: 10),
              labelPadding: EdgeInsets.symmetric(horizontal: 16),
              isScrollable: true,
              labelColor: Colors.blue,
              labelStyle: TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelColor: Color(0xffAAAAAA),
              unselectedLabelStyle: TextStyle(
                fontSize: 16.0,
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
      itemCount: _dataList.length > 0 ? _dataList.length : 0,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.grey[100],
          child: _buildListItem(groupID, index),
        );
      },
    );
  }

  Widget _buildListItem(int groupID, int idx) {
    dynamic model = _dataList[idx];
    if (model is CourseListModel) {
      return _buildListTitleItem(model, groupID, idx);
    } else if (model is CourseFreeClassModel) {
      return _buildListFreeItem(model, groupID, idx);
    } else if (model is CourseVipClassModel) {
      return _buildListVipItem(model, groupID, idx);
    } else {
      return ListTile(title: Text("$groupID,$idx"));
    }
  }

  Widget _buildListTitleItem(CourseListModel model, int groupID, int idx) {
    return new Container(
      height: 56,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(
          left: 24.0, right: 24.0, top: 24.0, bottom: 6.0),
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 4,
            height: 12,
            color: Colors.blue,
          ),
          Container(
            width: 6,
            height: 12,
          ),
          Container(
            child: Text(
              model.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListFreeItem(CourseFreeClassModel model, int groupID, int idx) {
    var subTitle1 = "";
    if (model.subtitle1.length > 0) {
      subTitle1 = "· " + model.subtitle1;
    }
    var subTitle2 = "";
    if (model.subtitle2.length > 0) {
      subTitle2 = "· " + model.subtitle2;
    }

    return new Container(
      height: 196,
      alignment: Alignment.topLeft,
      padding:
          const EdgeInsets.only(left: 24.0, right: 24.0, top: 6.0, bottom: 6.0),
      color: Colors.grey[100],
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white, Colors.white]),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 16, right: 78, bottom: 78),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      model.name,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subTitle1,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, height: 1.3),
                    ),
                    Text(
                      subTitle2,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, height: 1.3),
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
                      model.enrollPeople + " 名同学已报名",
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, height: 1.4),
                    ),
                    Text(
                      "开讲时间: " + model.startTime,
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
                width: 60,
                height: 70,
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image(
                        width: 50,
                        height: 50,
                        image: NetworkImage(model.teacherPic),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(model.teacherName),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListVipItem(CourseVipClassModel model, int groupID, int idx) {
    if (model.tList.length > 0) {
      print(model.tList);
    }

    return new Container(
      height: 160,
      alignment: Alignment.topLeft,
      padding:
          const EdgeInsets.only(left: 24.0, right: 24.0, top: 6.0, bottom: 6.0),
      color: Colors.grey[100],
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white, Colors.white]),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 16, right: 16, bottom: 84),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
//                    Positioned(
//                      top: 0,
//                      right: 0,
//                      width: 36,
//                      height: 21,
//                      child: Image(
//                        image: NetworkImage(model.tagUrl),
//                        fit: BoxFit.cover,
//                      ),
//                    ),
                    Text(
                      model.name,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 4,
                    ),
                    Text(
                      model.subtitle,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 16,
                bottom: 16,
                width: 114,
                height: 48,
                child: Row(
                  children: _buildTeacherList(model.tList),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 85, left: 150, right: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Container(
                      color: Colors.grey,
                    ),
                    Text(
                      "¥ " + model.price,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 22,
                        height: 1.18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      model.uNums + " 名同学已报名",
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTeacherList(List tList) {
    List<Widget> _teacherList = [];
    if (tList.length < 1) {
      return _teacherList;
    }

    for (var i = 0; i < tList.length; i++) {
      Map map = tList[i];
      if (i == 0) {
        _teacherList.add(_buildTeacherCell(map));
      } else {
        _teacherList.add(_buildTeacherSpace());
        _teacherList.add(_buildTeacherCell(map));
      }
      if (i == 2) {
        break;
      }
    }
    return _teacherList;
  }

  Widget _buildTeacherCell(Map map) {
    return Container(
      width: 30,
      height: 48,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              width: 30,
              height: 30,
              image: NetworkImage(
                // "http://bpic.588ku.com/element_origin_min_pic/01/49/81/695744871999d35.jpg",
                map["img"],
              ),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 30,
            height: 4,
          ),
          Text(
            // "Teacher",
            map["name"],
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherSpace() {
    return Container(
      width: 12,
      height: 48,
    );
  }
}
