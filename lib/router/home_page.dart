import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/api/home_api.dart';
import 'package:flutter_wechat/language/my_locale.dart';
import 'package:flutter_wechat/main.dart';
import 'package:flutter_wechat/model/chat_model.dart';
import 'package:flutter_wechat/native/qrscan_activity.dart';
import 'package:flutter_wechat/navigator/tab_navigator.dart';
import 'package:flutter_wechat/router/chat_page.dart';
import 'package:flutter_wechat/router/search_page.dart';
import 'package:flutter_wechat/widget/qrscan_wechat.dart';
import 'package:flutter_wechat/widget/search_bar.dart';

import '../common/common.dart';
import '../common/constant.dart';

/// 首页 聊天页面
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateHomePage();
  }
}

class StateHomePage extends State<HomePage> {
  List<ChatModel> _chatModels = [];

  @override
  void initState() {
    super.initState();

    /// 模拟数据
    _chatModels.addAll(HomeApi.mock());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    list.add(
      _searBar(),
    );
    _chatModels.forEach((o) {
      list.add(_chatItem(o.avatar, o.name, o.lastMsg, o.time,
          isBadge: Random().nextBool()));
    });
    return Scaffold(
      body: Column(
        children: <Widget>[
          _titleBar(),
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Expanded(
                  child: ListView(
                children: list,
              )))
        ],
      ),
    );
  }

  /// 标题栏
  _titleBar() {
    return Container(
        color: Color(BG_COLOR),
        height: 70,
        child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 70),
                ),
                Container(
                  child: Text(
                    MyLocalization.of(context).homeTitle+" (325)",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: PopupMenuButton(
                      offset: Offset(0, 70),
                      color: Color(0xff4c4c4c),
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: wrapCallback(_popupItem(0xe69e, 0), () {
                              MyFlutterQrScanPlugin.openNativePage(
                                  "qrscan_page");
                            }),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: _popupItem(0xe638, 1),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: wrapCallback(_popupItem(0xe61b, 2), () {
                              requestPermiss();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WxQrScanView()));
                            }),
                            value: 2,
                          ),
                          PopupMenuItem(
                            child: _popupItem(0xe62a, 3),
                            value: 3,
                          ),
                          PopupMenuItem(
                            child: _popupItem(0xe63d, 4),
                            value: 4,
                          ),
                        ];
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.fromBorderSide(BorderSide(
                                color: Colors.black87,
                                style: BorderStyle.solid))),
                        child: Icon(
                          Icons.add,
                          size: 19,
                          color: Colors.black87,
                        ),
                      )),
                ),
              ],
            )));
  }

  /// 搜索栏
  _searBar() {
    return Container(
      color: Color(THEME_COLOR),
      child: SearchBar(
        enable: false,
        searchBarType: SearchBarType.normal_page,
        hint: MyLocalization.of(context).search,
        inputBoxClick: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
      ),
    );
  }

  /// 多个ListTile组成聊天页ListView
  _chatItem(String imgUrl, String name, String lastMsg, String time,
      {bool isBadge = false}) {
    return Column(children: <Widget>[
      ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatPage()));
        },
        leading: Container(
          height: 43,
          width: 43,
          child: Stack(children: <Widget>[
            Positioned(
                left: 0,
                bottom: 0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      imgUrl ??
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcStSJPuGbyKL4NnEPTuyumS9CkheNYQdmpLwHW5VJ1kOCCoUpj9",
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ))),
            isBadge == true
                ? Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.fromBorderSide(
                              BorderSide(width: 1, color: Colors.red[600]))),
                      child: Container(
                        color: Colors.red[600],
                        height: 6,
                        width: 6,
                      ),
                    ),
                  )
                : Container()
          ]),
        ),
        title: Container(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            maxLines: 1,
          ),
        ),
        subtitle: Container(
          child: Text(
            lastMsg,
            style: TextStyle(color: Colors.grey, fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: Container(
          child: Text(
            time,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ),
      Divider(
        height: 1,
        color: Colors.grey[400],
        indent: 70,
      ),
    ]);
  }

  /// 右上角弹窗
  _popupItem(int iconData, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
            IconData(
              iconData,
              fontFamily: IconFont,
            ),
            size: 22,
            color: Color(0xffffffff)),
        Container(width: 12.0),
        Text(POPUP_ITEM_STRING[index],
            style: TextStyle(color: Color(0xffffffff))),
      ],
    );
  }
}
