import 'package:flutter/material.dart';

// 实现一个简单的主页
class FTScaffoldPage extends StatefulWidget {
  @override
  _FTScaffoldPageState createState() => _FTScaffoldPageState();
}

class _FTScaffoldPageState extends State<FTScaffoldPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  TabController _tabController;
  List tabs = ["直播", "回放", "录播"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        // 设置右侧控件
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print("Icons.share");
            },
          ),
        ],
        // 设置左侧控件
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
            onPressed: () {
              print("Icons.dashboard");
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        // 设置导航栏底部的工具栏
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      // 设置抽屉 默认会将左侧按钮设置为菜单按钮
      drawer: new MyDrawer(),
      // 底部导航栏
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.white,
      //   shape: CircularNotchedRectangle(),
      //   child: Row(
      //     children: <Widget>[
      //       IconButton(
      //         icon: Icon(Icons.home),
      //         onPressed: () {},
      //       ),
      //       SizedBox(),
      //       IconButton(
      //         icon: Icon(Icons.business),
      //         onPressed: () {},
      //       ),
      //     ],
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   ),
      // ),
      // 设置悬浮按钮位置
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 底部悬浮按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),

      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
          BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('Mine')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black26,
        onTap: _onItemTapped,
      ),

      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 3),
          );
        }).toList(),
      ),
      // body: Column(
      //   children: <Widget>[
      //     // Text("你好", style: TextStyle(color: Colors.red, fontSize: 20.0)),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Text("你好", style: TextStyle(color: Colors.purple, fontSize: 20.0))
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: ClipOval(
                      child: Image(
                        image: AssetImage("testPic/my_icon.png"),
                        width: 88,
                      ),
                    ),
                  ),
                  Text("data", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text("add"),
                ),
                ListTile(
                  leading: const Icon(Icons.local_gas_station),
                  title: const Text("gas"),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("settings"),
                ),
                ListTile(
                  leading: const Icon(Icons.youtube_searched_for),
                  title: const Text("searched"),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
