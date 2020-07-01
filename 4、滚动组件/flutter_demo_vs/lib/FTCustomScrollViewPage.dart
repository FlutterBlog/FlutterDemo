import 'package:flutter/material.dart';

class FTCustomScrollViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
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
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),

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
            }, childCount: 50 //50个列表项
                ),
          ),
        ],
      ),
    );

    //   return Scaffold(
    //     appBar: AppBar(
    //       title: Text("FTCustomScrollViewPage"),
    //     ),
    //     body: Scrollbar(
    //       child: GridView.extent(
    //         maxCrossAxisExtent: 88,
    //         childAspectRatio: 2,
    //         children: <Widget>[
    //           Icon(Icons.ac_unit),
    //           Icon(Icons.airport_shuttle),
    //           Icon(Icons.all_inclusive),
    //           Icon(Icons.beach_access),
    //         ],
    //       ),
    //     ),
    //   );
  }
}
