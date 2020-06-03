import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_bloc.dart';

/// @description 首页UI
///
/// @author 燕文强
///
/// @date 2020/6/3
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 把一些相关的数据请求，实体类变换抽到CounterBLoC这个类里
  // 实例化CounterBLoC
  final _bloc = new HomeBLoC();

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        // 监听流,当流中的数据发生变化(调用过sink.add时，此处会接收到数据的变化并且刷新UI)
        stream: _bloc.stream,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Center(
            child: Text(
              snapshot.data.toString(),
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
            ),
          );
        },
      ),
      floatingActionButton: _getButton(),
    );
  }

  Widget _getButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      // 点击添加；其实也是发布一个流事件
      onPressed: () => _bloc.addCount(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // 关闭流
    _bloc.dispose();
  }
}
