import 'package:flutter/material.dart';
import 'home_page.dart';

/// @description application主入口
///
/// @author 燕文强
///
/// @date 2020/6/3

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stream',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Stream Demo'),
    );
  }
}
