import 'dart:async';

/// @description 首页对应的BLoC
///
/// @author 燕文强
///
/// @date 2020/6/3
class HomeBLoC {
  int _counter = 0;

  // 流控制
  final _counterStreamController = new StreamController<int>();

  // 流
  Stream<int> get stream => _counterStreamController.stream;

  // 通过sink.add发布一个流事件
  void addCount() {
    _counterStreamController.sink.add(++_counter);
  }

  // 释放流
  void dispose() {
    _counterStreamController.close();
  }
}
