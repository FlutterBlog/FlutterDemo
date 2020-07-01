import 'package:flutter/material.dart';

// GridView Build
class FTGridViewBuildPage extends StatefulWidget {
  @override
  _FTGridViewBuildPageState createState() => _FTGridViewBuildPageState();
}

class _FTGridViewBuildPageState extends State<FTGridViewBuildPage> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    requestData();
  }

  void requestData() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // 构造器
    return Scaffold(
      appBar: AppBar(
        title: Text("FTGridViewBuildPage"),
      ),
      body: Scrollbar(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
          ),
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            //
            if (index == _icons.length - 1 && _icons.length < 50) {
              requestData();
            }
            return Icon(_icons[index]);
          },
        ),
      ),
    );
  }
}

// GridView
class FTGridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 构造器
    return Scaffold(
      appBar: AppBar(
        title: Text("FTGridViewPage"),
      ),

      // body: Column(
      //   children: <Widget>[
      //     Text("data"),
      //     Expanded(
      //       child: GridView(
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 4,
      //           childAspectRatio: 1.0,
      //         ),
      //         children: <Widget>[
      //           Icon(Icons.ac_unit),
      //           Icon(Icons.airport_shuttle),
      //           Icon(Icons.all_inclusive),
      //           Icon(Icons.beach_access),
      //           Icon(Icons.cake),
      //           Icon(Icons.free_breakfast),
      //         ],
      //       ),
      //     ),
      //     Text("data"),
      //   ],
      // ),

      // SliverGridDelegateWithFixedCrossAxisCount
      // body: Scrollbar(
      //   child: GridView(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 4,
      //       childAspectRatio: 1.0,
      //     ),
      //     children: <Widget>[
      //       Icon(Icons.ac_unit),
      //       Icon(Icons.airport_shuttle),
      //       Icon(Icons.all_inclusive),
      //       Icon(Icons.beach_access),
      //       Icon(Icons.cake),
      //       Icon(Icons.free_breakfast),
      //     ],
      //   ),
      // ),

      // GridView.count
      // body: Scrollbar(
      //   child: GridView.count(
      //     crossAxisCount: 4,
      //     childAspectRatio: 2.0,
      //     children: <Widget>[
      //       Icon(Icons.ac_unit),
      //       Icon(Icons.airport_shuttle),
      //       Icon(Icons.all_inclusive),
      //       Icon(Icons.beach_access),
      //       Icon(Icons.cake),
      //       Icon(Icons.free_breakfast),
      //     ],
      //   ),
      // ),

      // SliverGridDelegateWithMaxCrossAxisExtent
      // body: Scrollbar(
      //   child: GridView(
      //     padding: EdgeInsets.zero,
      //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //       maxCrossAxisExtent: 88.0,
      //       childAspectRatio: 2.0, //宽高比
      //     ),
      //     children: <Widget>[
      //       Icon(Icons.ac_unit),
      //       Icon(Icons.airport_shuttle),
      //       Icon(Icons.all_inclusive),
      //       Icon(Icons.beach_access),
      //       Icon(Icons.cake),
      //       Icon(Icons.free_breakfast),
      //     ],
      //   ),
      // ),

      // GridView.extent
      body: Scrollbar(
        child: GridView.extent(
          maxCrossAxisExtent: 88,
          childAspectRatio: 2,
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ],
        ),
      ),

      //
    );
  }
}
