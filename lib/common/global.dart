
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile.dart';

class Global {
  static SharedPreferences _prefs;
  static Profile profile = Profile();

  // 可选的主题列表
//  static List<MaterialColor> get themes => _themes;

  // 是否为release版
//  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }

    // 如果没有缓存策略，设置默认缓存策略
//    profile.cache = profile.cache ?? CacheConfig()
//      ..enable = true
//      ..maxAge = 3600
//      ..maxCount = 100;

//    初始化网络请求相关配置
//    Git.init();
  }

  // 持久化Profile信息
  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));
}
