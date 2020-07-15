import 'package:event_bus/event_bus.dart';

/// 创建EventBus
EventBus eventBus = EventBus();

/// Event 修改主题色
class ThemeColorEvent {
  String colorStr;

  ThemeColorEvent(this.colorStr);
}

/// Event 修改登录态
class FTLoginTypeEvent {
  bool loginType;

  FTLoginTypeEvent(this.loginType);
}
// enum Event {
//   login,
//   logout,
// }

// const EventName = {
//   Event.login: "login",
//   Event.logout: "logout",
// };

// typedef void EventCallback(arg);

// class EventBus {
//   //私有构造函数
//   EventBus._internal();

//   //保存单例
//   static EventBus _singleton = new EventBus._internal();

//   //工厂构造函数
//   factory EventBus() => _singleton;

//   //保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者
//   var _emap = new Map<String, EventCallback>();

//   //添加订阅者
//   void on(eventName, EventCallback f) {
//     if (eventName == null || f == null) return;
//     _emap[eventName] = f;
//   }

//   //移除订阅者
//   void off(eventName) {
//     _emap[eventName] = null;
//   }

//   //触发事件，事件触发后该事件所有订阅者会被调用
//   void emit(eventName, [arg]) {
//     var f = _emap[eventName];
//     f(arg);
//   }
// }
