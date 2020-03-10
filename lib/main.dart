import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'navigator/tab_navigator.dart';

void main() {
  runApp(
      MyApp()
  );
}

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
/// flutter实现的导航页 暂不使用 使用android工程添加的方式
//class SplashPage extends StatefulWidget{
//
//  @override
//  State<StatefulWidget> createState() {
//    return StateSplashPage();
//  }
//}
//class StateSplashPage extends State<SplashPage>{
//  Widget _body;
//  @override
//  void initState() {
//    _body = Scaffold(
//      body: Image.asset("images/wechat_splash.png",fit: BoxFit.cover,),
//    );
//    super.initState();
//    toHomePage();
//  }
//  @override
//  Widget build(BuildContext context) {
//    return _body;
//  }
//  toHomePage() async{
//    Future.delayed(Duration(seconds: 2),(){
//      setState(() {
//        _body = TabNavigator();
//      });
//    });
//  }
//}



requestPermiss() async {
//请求权限
  Map<PermissionGroup, PermissionStatus> permissions =
  await PermissionHandler()
      .requestPermissions([PermissionGroup.camera,PermissionGroup.phone]);
//校验权限
  if (permissions[PermissionGroup.camera] != PermissionStatus.granted) {
    print("无照相权限");
  }
  if (permissions[PermissionGroup.phone] != PermissionStatus.granted) {
    print("无定位权限");
  }
}