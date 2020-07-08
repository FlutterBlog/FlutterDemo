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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('课堂'),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
          onTap: _onItemTapped,
        ),
      ),
      body: _tabBarView,
    );
  }
}
