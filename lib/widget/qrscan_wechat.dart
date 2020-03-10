import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wechat/main.dart';
import 'package:flutter_wechat/native/qrscan_android_view.dart';

/// 使用前需已经获取相关权限
/// Relevant privileges must be obtained before use
class WxQrScanView extends StatefulWidget {
//  final Widget headerWidget;
//  final Future Function(String) onScan;
//  final double scanBoxRatio;
//  final Color boxLineColor;
//  final Widget helpWidget;
  WxQrScanView({
    Key key,
//    @required this.onScan,
//    this.headerWidget,
//    this.boxLineColor = Colors.cyanAccent,
//    this.helpWidget,
//    this.scanBoxRatio = 0.85,
  }) : super(key: key);

  @override
  StateWxQrScanView createState() => new StateWxQrScanView();
}

class StateWxQrScanView extends State<WxQrScanView> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      _buildNativeView(context),
      Positioned(
          top: 20,
          left: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(13)),
              child: Icon(
                Icons.close,
                size: 26,
                color: Colors.black,
              ),
            ),
          )),
      Positioned(
        bottom: 70,
        left: MediaQuery.of(context).size.width / 2 - 35,
        child: _buildFlash(),
      ),
      Positioned(
        bottom: 100,
        left: 25,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.5),
              color: Colors.grey[800]),
          child: Container(
            width: 45,height: 45,
              padding: EdgeInsets.all(8),
              child: Image.asset(
            "images/qrcode.png",
            width: 30,
            height: 30,
            color: Colors.white,
          )),
        ),
      ),
      Positioned(
        bottom: 100,
        right: 25,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.5),
              color: Colors.grey[800]),
          child: Container(
              width: 45,
              height: 45,
              child: Icon(
                Icons.photo,
                size: 30,
                color: Colors.white,
              )),
        ),
      ),
      Positioned(
        bottom: 10,
        left: MediaQuery.of(context).size.width / 2 - 20,
        child: Center(
          child: Text(
            "扫码",
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    ]));
  }

  /// native的扫描二维码view
  _buildNativeView(BuildContext context) {
    return Container(
        child: defaultTargetPlatform == TargetPlatform.android
            ? AndroidView(
                viewType: "top.dzou.wechat_qrscan",
//        creationParamsCodec: const StandardMessageCodec(),
//        creationParams: {'method_text_str': 'Method Channel Params!!'},
                onPlatformViewCreated: (id) async {
                  MyFlutterQrScanAndroidViewPlugin.startQrScan();
//          MethodChannel _channel = const MethodChannel('ace_method_text_view');
//          _channel..invokeMethod('method_set_text', 'Method_Channel')..setMethodCallHandler((call) {
//            if (call.method == 'method_click') {
//              _toast('Method Text FlutterToast!', context);
//            }
//          }
//          );
                },
              )
            : UiKitView());
  }

  /// 手电筒
  _buildFlash() {
    return Container(
        height: 90,
        width: 70,
        child: Container(
            child: Column(children: <Widget>[
          Image.asset(
            "images/flash.png",
            color: Colors.white,
            width: 50,
            height: 60,
          ),
          Text(
            "轻触照亮",
            style: TextStyle(fontSize: 14, color: Colors.white),
            maxLines: 1,
          )
        ])));
  }
}
