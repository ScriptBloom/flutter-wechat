import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'common/global.dart';
import 'language/my_locale.dart';
import 'model/language_model.dart';
import 'navigator/tab_navigator.dart';

void main() => Global.init().then((e) => runApp(ChangeNotifierProvider.value(value: new LocaleModel(), child: MyApp()),));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleModel>(
        builder: (BuildContext context, LocaleModel localeModel, Widget child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.green,
              platform: TargetPlatform.iOS,
            ),
            onGenerateTitle: (BuildContext context) {
              return MyLocalization
                  .of(context)
                  .taskTitle;
            },
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              MyLocalizationsDelegate.delegate,
            ],
            locale: localeModel.getLocale(),
            supportedLocales: [
              const Locale('zh', 'CN'),
              const Locale('en', 'US'),
            ],

            ///只有以这样的形式才可以不把title暴露在MaterialApp中
            home: TabNavigator(),
          );
        },
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
  Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler()
      .requestPermissions([PermissionGroup.camera, PermissionGroup.phone]);
  //校验权限
  if (permissions[PermissionGroup.camera] != PermissionStatus.granted) {
    print("无照相权限");
  }
  if (permissions[PermissionGroup.phone] != PermissionStatus.granted) {
    print("无定位权限");
  }
}
