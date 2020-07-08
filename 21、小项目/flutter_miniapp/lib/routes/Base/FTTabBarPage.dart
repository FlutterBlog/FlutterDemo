import 'package:flutter/material.dart';
import '../1/FTPage1.dart';
import '../2/FTPage2.dart';
import '../3/FTPage3.dart';
import '../4/FTPage4.dart';

// 实现一个简单的主页
class FTTabBarPage extends StatefulWidget {
  @override
  _FTTabBarPageState createState() => _FTTabBarPageState();
}

class _FTTabBarPageState extends State<FTTabBarPage>
    with SingleTickerProviderStateMixin {
  //
  int _selectedIndex = 0;

  List tabs = ["日历", "院校", "课程", "个人"];
  List<Widget> pages = [FTPage1(), FTPage2(), FTPage3(), FTPage4()];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('日历')),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text('院校')),
          BottomNavigationBarItem(icon: Icon(Icons.camera), title: Text('课堂')),
          BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('个人')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black26,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      body: pages[_selectedIndex],
    );
  }
}
