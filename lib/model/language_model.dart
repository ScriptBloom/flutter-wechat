import 'package:flutter/material.dart';
import 'package:flutter_wechat/common/global.dart';
import 'package:flutter_wechat/common/profile.dart';

/// 多语言Model
Profile get _profile => Global.profile;

class LocaleModel extends ChangeNotifier{

  Locale getLocale() {
    if (_profile.locale == null) return null;
    var t = _profile.locale.split("_");
    return Locale(t[0], t[1]);
  }

  // 获取当前Locale的字符串表示
  String get locale => _profile.locale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set locale(String locale) {
    if (locale != _profile.locale) {
      _profile.locale = locale;
      notifyListeners();
    }
  }

  @override
  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners();
  }
}
