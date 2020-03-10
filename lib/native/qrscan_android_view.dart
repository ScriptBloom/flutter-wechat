import 'package:flutter/services.dart';

/// 用于打开AndroidView
class MyFlutterQrScanAndroidViewPlugin {
  static const MethodChannel _channel =
  const MethodChannel('top.dzou.qrscan.double_direction');
  static const String METHOD_START = "startQrScan";
  static const String METHOD_STOP = "stopQrScan";
  static const String METHOD_FLASH = "openFlash";

  /// 开始识别
  static Future<String> startQrScan({ Map paramsMap}) async {
    if(paramsMap == null){
      paramsMap = Map();
    }
    return await _channel.invokeMethod(METHOD_START , { "params" : paramsMap});
  }

  /// 停止识别
  static Future<String> stopQrScan({ Map paramsMap}) async {
    if(paramsMap == null){
      paramsMap = Map();
    }
    return await _channel.invokeMethod(METHOD_STOP , { "params" : paramsMap});
  }

  /// 打开闪关灯
  static Future<String> openFlash({ Map paramsMap}) async {
    if(paramsMap == null){
      paramsMap = Map();
    }
    return await _channel.invokeMethod(METHOD_FLASH , { "params" : paramsMap});
  }
}

