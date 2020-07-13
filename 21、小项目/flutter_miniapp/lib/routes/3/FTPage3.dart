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
      backgroundColor: Colors.grey[100],
      elevation: 0,
      titleSpacing: 120.0,
      title: TabBar(
        controller: _tabController,
        tabs: tabs.map((e) => Tab(text: e)).toList(),
        onTap: _onItemTapped,
        indicator: const BoxDecoration(),
        // indicatorWeight: 2,
        // indicatorColor: Colors.grey[100],
        // indicatorPadding: EdgeInsets.only(left: 10, right: 10),
        labelPadding: EdgeInsets.symmetric(horizontal: 10),
        isScrollable: true,
        labelColor: Color(0xff2D3133),
        labelStyle: TextStyle(
          fontSize: 24.0,
          color: Color(0xff2D3133),
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: Color(0xff8A9499),
        unselectedLabelStyle: TextStyle(
          fontSize: 18.0,
          color: Color(0xff8A9499),
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
