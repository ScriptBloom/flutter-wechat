import 'package:flutter/material.dart';

import 'navigator/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TabNavigator(),
    );
  }
}