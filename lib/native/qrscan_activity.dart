import 'package:flutter/services.dart';

/// 用于打开ScanActivity
class MyFlutterQrScanPlugin {
  static const MethodChannel _channel =
  const MethodChannel('top.dzou.flutter_wechat/qrscan');

  /// 打开原生页面
  static Future<String> openNativePage(String target,{ Map paramsMap}) async {
    if(paramsMap == null){
      paramsMap = Map();
    }
    return await _channel.invokeMethod(target , { "params" : paramsMap});
  }
}

