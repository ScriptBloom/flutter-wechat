import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/api/mine_api.dart';
import 'package:flutter_wechat/language/my_locale.dart';
import 'package:flutter_wechat/model/mine_model.dart';

import '../common/constant.dart';
import 'language_page.dart';

/// 我的页面
class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateMinePage();
  }
}

class StateMinePage extends State<MinePage> {
  /// 存储数据
  List<MineModel> _mineModels = [];

  @override
  void initState() {
    /// 模拟初始化数据
    super.initState();
    _mineModels.addAll(MineApi.mock());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    list.add(_titleBar());
    list.add(_mineAccountItem());
    list.add(Container(
      height: 10,
      color: Color(BG_COLOR),
    ));
    _mineModels.forEach((o) {
      list.add(
          _mineItem(assets: o.assets, title: o.title, rightText: o.rightText));
      if (o.isDownDivider) {
        list.add(Container(
          height: 10,
          color: Color(BG_COLOR),
        ));
      } else {
        list.add(Divider(
          height: 1,
          color: Colors.grey[400],
          indent: 70,
        ));
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: list,
        ),
      ),
    );
  }

  /// 每个我的页面的一个功能导航Item
  Widget _mineItem(
      {String assets, String title, String rightText, bool isArrow = true}) {
    return GestureDetector(
      onTap: () {
        if (title == "language") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LanguagePage()));
        }
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(bottom: 7, top: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 20, bottom: 7, top: 7),
                  child: Image.asset(
                    assets,
                    height: 30,
                    width: 30,
                  ),
                ),
                Container(
                  child: Text(
                    MyLocalization.of(context).getMineItem(title),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black87),
                  ),
                )
              ],
            ),
            rightText != null
                ? Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      rightText,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(right: 10, left: 8),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 15,
                    ),
                  )
          ],
        ),
      ),
    );
  }

  /// 标题栏
  _titleBar() {
    return Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Container(
                      child: Icon(
                        Icons.camera_alt,
                        size: 22,
                        color: Colors.black87,
                      ),
                    ))
              ],
            )));
  }

  /// 我的账号的信息 包括头像 名称 微信号和二维码 那部分
  Widget _mineAccountItem() {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 25, bottom: 40, right: 5),
      width: double.maxFinite,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "images/avatar.png",
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Grow',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 40),
                      child: Text(
                        MyLocalization.of(context).wxId + "： Hello World",
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Image.asset(
                              "images/ic_qrcode_preview_tiny.png",
                              width: 14,
                              height: 14,
                            )),
                        Container(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Colors.grey,
                            )),
                      ],
                    )
                  ]),
            ],
          )
        ],
      ),
    );
  }
}
