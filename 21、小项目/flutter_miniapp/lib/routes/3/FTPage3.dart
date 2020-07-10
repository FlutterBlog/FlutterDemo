import 'package:flutter/material.dart';
import 'FTStudyPage.dart';
import 'FTCoursePage.dart';

class FTPage3 extends StatefulWidget {
  @override
  _FTPage3State createState() => _FTPage3State();
}

class _FTPage3State extends State<FTPage3> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;
  TabBarView _tabBarView;
  AppBar _appBar;
  List tabs = ["学习", "课堂"];
  List<Widget> pages = [
    FTStudyPage(),
    FTCoursePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabBarView = TabBarView(controller: _tabController, children: pages);
    _appBar = AppBar(
      backgroundColor: Colors.grey[50],
      elevation: 0,
      titleSpacing: 120.0,
      title: TabBar(
        controller: _tabController,
        tabs: tabs.map((e) => Tab(text: e)).toList(),
        onTap: _onItemTapped,
        indicatorWeight: 2,
        indicatorPadding: EdgeInsets.only(left: 10, right: 10),
        labelPadding: EdgeInsets.symmetric(horizontal: 10),
        isScrollable: true,
        indicatorColor: Colors.blue,
        labelColor: Colors.blue,
        labelStyle: TextStyle(
          fontSize: 20.0,
          color: Colors.blue,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelColor: Color(0xffAAAAAA),
        unselectedLabelStyle: TextStyle(
          fontSize: 20.0,
          color: Color(0xffAAAAAA),
        ),
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _tabBarView,
    );
  }
}
