
import 'package:flutter/material.dart';
import 'FlutterHomePage.dart';
import 'FlutterSecondPage.dart';
import 'FlutterValuePage.dart';

// import 'package:flutter/semantics.dart';

//变量
dynamic d;
Object o;

//常量
final str1 = "abcd"; // final  第一次使用时初始化
const str2 = "abcd"; // const 编译时常量


// 应用主函数
void main() => runApp(MyApp());

//void main() {
//  runApp(MyApp());
//}

//void main() {
//
//  var tmp = 1000;
//  print(tmp);
//
//  d = "1000";
//  o = "2000";
//
//  printLength();
//
//  say('Bob', 'Howdy');
//
//  enableFlags(bold: true, hidden: false);
//
//   futureMethod1();
//   futureMethod2();
//   futureMethod3();
//   futureMethod4();
//
//  runApp(MyApp());
//}

printLength() {
  print(d);
  print(o);
}

void enableFlags({bool bold, bool hidden}) {
  //...

}

String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

void futureMethod1() {
  
  // 普通延迟
  Future.delayed(new Duration(seconds: 2), (){
    return "123";
  }).then((data){
    print(data);
  });


  //延迟
  //1、捕获异常 throw catchError
  Future.delayed(new Duration(seconds: 2),(){
   throw AssertionError("Error");  
  }).then((data){
    //执行成功会走到这里  
    print("success");
  }).catchError((e){
   //执行失败会走到这里  
   print(e);
  });

  //2、捕获异常 throw onError
  Future.delayed(new Duration(seconds: 2), (){
   throw AssertionError("Error");  
  }).then((data){
    print("success");
  }, onError: (e){
   print(e);
  });

  //Future 的 complete
  Future.delayed(new Duration(seconds: 2), (){
   throw AssertionError("Error");  
  }).then((data){
    print("success");
  }, onError: (e){
    print("onError");
    print(e);
  }).whenComplete((){
    // 无论成功失败，最终都会执行 whenComplete
    print("Complete");
  });


}

void futureMethod2() {
  //等待
  Future.wait([
    //异步1
    Future.delayed(new Duration(seconds: 2), (){
      return "123456";
    }),

    //异步2
    Future.delayed(new Duration(seconds: 4), (){
      return "78910JQKA";
    }),
  ]).then((results){
    print(results[0]+results[1]);
  }).catchError((e){
    print(e);
  });

}

void futureMethod3() {
  // CallBack Hell
  
  //先分别定义各个异步任务
//  Future<String> login(String userName, String pwd){
//    // 用户登录
//    // print(userName + pwd);
//  };
//
//  Future<String> getUserInfo(String id){
//    // 获取用户信息
//    // print(id);
//  };
//
//  Future saveUserInfo(String userInfo){
//    // 保存用户信息
//    // print(userInfo);
//  };

//  login("userName", "pwd").then((id){
//    getUserInfo(id).then((userInfo){
//      saveUserInfo(userInfo).then((value){
//        print("CallBack Hell Finished");
//      });
//    });
//  });
//
//  login("alice","******").then((id){
//    return getUserInfo(id);
//  }).then((userInfo){
//    return saveUserInfo(userInfo);
//  }).then((e){
//    //执行接下来的操作
//    print(e);
//  }).catchError((e){
//    //错误处理
//    print(e);
//  });
//
//  // 定义一个异步函数
//  task() async {
//    try{
//      String id = await login("alice","******");
//      String userInfo = await getUserInfo(id);
//      // await跟随一个Future，等待异步任务完成才能执行后续任务
//      // await必须出现在async函数内部
//      await saveUserInfo(userInfo);
//      //执行接下来的操作
//    } catch(e){
//      //错误处理
//      print(e);
//    }
//  }

}

void futureMethod4() {
  // Fix CallBack Hell

  // Stream
  // 
  Stream.fromFutures([
    //1、
    Future.delayed(new Duration(seconds: 1), (){
      return "delay111";
    }),

    //2、
    Future.delayed(new Duration(seconds: 1), (){
      return "delay222";
    }),

    //3、
    Future.delayed(new Duration(seconds: 1), (){
      return "delay333";
    })

  ]).listen((event) {
    print(event);
  }, onError: (e){
    print(e);
  }, onDone: (){
    print("success");
  });
  
}

// 应用入库
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    print("MaterialPageRoute:name");

    return MaterialApp(
      title: 'Flutter Demo',//App名称
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,//App主题
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "/": (context) => FlutterHomePage(title: 'Home'),//注册首页路由 默认加载 不用再次设置首页路由
        "TALSecondPage1": (context) => FlutterSecondPage(),
        "TALSecondPage2": (context){
          return FlutterWidgetPage(text: ModalRoute.of(context).settings.arguments);
        },
        "TALValuePage": (context){
          return FlutterValuePage(text: ModalRoute.of(context).settings.arguments);
        },
      },
//      home: FlutterHomePage(title: 'FlutterHome'),//设置首页路由
      onGenerateRoute: (RouteSettings settings){
        // ignore: missing_return
        return MaterialPageRoute(builder: (context){
          print("MaterialPageRoute:$settings.name");
        });
      },
    );
  }
}
