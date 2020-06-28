import 'package:flutter/material.dart';

class FTWrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTWrapPage"),
      ),
      
    //   body: Column(
    //    children: <Widget>[
         
    //      Wrap(
    //       spacing: 8,
    //       runSpacing: 5,
    //       alignment: WrapAlignment.center,
    //       children: <Widget>[

    //         new Chip(
    //           avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
    //           label: new Text('Hamilton'),
    //         ),
    //         new Chip(
    //           avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
    //           label: new Text('Lafayette'),
    //         ),
    //         new Chip(
    //           avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
    //           label: new Text('Mulligan'),
    //         ),
    //         new Chip(
    //           avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
    //           label: new Text('Laurens'),
    //         ),

    //       ],
    //      ),

    //    ],
    //  ),
    
    
    body: Column(
       children: <Widget>[
         
        Flow(
          delegate: TestFlowDelegate(margin: EdgeInsets.all(20)),
          children: <Widget>[
            new Container(width: 80.0, height:80.0, color: Colors.red,),
            new Container(width: 80.0, height:80.0, color: Colors.yellow,),
            new Container(width: 80.0, height:80.0, color: Colors.blue,),
            new Container(width: 80.0, height:80.0,  color: Colors.green,),
            new Container(width: 80.0, height:80.0, color: Colors.brown,),
            new Container(width: 80.0, height:80.0,  color: Colors.purple,),
          ],
        ),

       ],
     ),
    
    );
  }
}


class TestFlowDelegate extends FlowDelegate{
  
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置  
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)  
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
         x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }
  
  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小  
    return Size(double.infinity,240.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}