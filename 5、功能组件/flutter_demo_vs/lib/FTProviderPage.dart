import 'package:flutter/material.dart';
import 'dart:collection';

/*
 * 主题色
*/
class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => new _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  Color _themeColor = Colors.teal; //当前路由主题色

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
          iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
          ),
      child: Scaffold(
        appBar: AppBar(title: Text("主题测试")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //第一行Icon使用主题中的iconTheme
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Icon(Icons.favorite),
              Icon(Icons.airport_shuttle),
              Text("  颜色跟随主题")
            ]),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("  颜色固定黑色")
                  ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => //切换主题
                setState(() => _themeColor =
                    _themeColor == Colors.teal ? Colors.blue : Colors.teal),
            child: Icon(Icons.palette)),
      ),
    );
  }
}

/*
 * 跨组件的状态共享
*/
class FTProviderPage extends StatefulWidget {
  @override
  _FTProviderPageState createState() => _FTProviderPageState();
}

class _FTProviderPageState extends State<FTProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FTProviderPage"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(""),
            // Consumer<CartModel>(
            //   builder: (BuildContext context, cart) =>
            //       Text("总价: ${cart.totalPrice}"),
            // ),
            // Builder(builder: (context) {
            //   return Text(
            //       "总价: ${ChangeNotifierProvider.of<CartModel>(context).totalPrice}");
            //   // return Text("总价: ${0}");
            // }),
            Builder(builder: (context) {
              print("RaisedButton build"); //在后面优化部分会用到
              return RaisedButton(
                child: Text("添加商品"),
                onPressed: () {
                  //给购物车中添加商品，添加后总价会更新
                  // listen 设为false，不建立依赖关系
                  ChangeNotifierProvider.of<CartModel>(context, listen: false)
                      .add(Item(20.0, 1));
                  // ChangeNotifierProvider.of<CartModel>(context).add(Item(20.0, 1));
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

//
// 这是一个便捷类，会获得当前context和指定数据类型的Provider
class Consumer<T> extends StatelessWidget {
  Consumer({
    Key key,
    @required this.builder,
    this.child,
  })  : assert(builder != null),
        super(key: key);

  final Widget child;

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context), //自动获取Model
    );
  }
}

// 商品信息的模型类
class Item {
  Item(this.price, this.count);
  double price;
  int count;
}

// 购物车内数据的模型类
class CartModel extends ChangeNotifier {
  // 用于保存购物车中商品列表
  final List<Item> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(Item item) {
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}

/*
 * 监听共享状态 并重新构建Widget树
*/
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({
    Key key,
    this.data,
    this.child,
  });

  final Widget child;
  final T data;

  // static Type _typeOf<T>() => T;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context, {bool listen = true}) {
    // final type = _typeOf<InheritedProvider<T>>();
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context
            .getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()
            ?.widget as InheritedProvider<T>;
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}

/*
 * 通用的订阅者模式
*/
class ChangeNotifier implements Listenable {
  List _listeners = [];

  void notifyListeners() {
    // 通知所有的监听 触发回调
    _listeners.forEach((element) => element());
  }

  @override
  void addListener(listener) {
    //添加监听器
    _listeners.add(listener);
  }

  @override
  void removeListener(listener) {
    // 移除监听器
    _listeners.remove(listener);
  }
}

/*
 * 通用的Provider 保存需要跨组件共享的状态
*/
class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({
    @required this.data,
    Widget child,
  }) : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
