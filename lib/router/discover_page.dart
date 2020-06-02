import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/api/discover_api.dart';
import 'package:flutter_wechat/language/my_locale.dart';
import 'package:flutter_wechat/model/discover_model.dart';
import 'package:flutter_wechat/router/moments/moments_page.dart';

import '../common/constant.dart';

/// 发现页面
class DiscoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateHomePage();
  }
}

class StateHomePage extends State<DiscoverPage> {
  String _imgUrl = "";

  /// 新消息的头像缩略图
  List<DiscoverModel> _discoverModel = [];

  @override
  void initState() {
    super.initState();
    /// 模拟请求数据
    _discoverModel.addAll(DiscoverApi.mock());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    list.add(
      _titleBar(),
    );
    _discoverModel.forEach((o) {
      list.add(_discoverItem(assets: o.assets, title: o.title, imgUrl: o.imgUrl));
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
//      backgroundColor: Color(THEME_COLOR),
      body: SingleChildScrollView(
        child: Column(
          children: list,
        ),
      ),
    );
  }

  /// 每一个发现导航Item
  Widget _discoverItem(
      {String assets, String title, String imgUrl, bool isBadge = true}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (title == "moments") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MomentsPage()));
        }
      },
      child: Container(
        height: 50,
        width: double.maxFinite,
        padding: EdgeInsets.only(bottom: 7, top: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15, right: 20),
                  child: Image.asset(
                    assets,
                    height: 28,
                    width: 28,
                  ),
                ),
                Container(
                  child: Text(
                    MyLocalization.of(context).getDicover(title),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black87),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                imgUrl != null
                    ? Container(
                        height: 43,
                        width: 40,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                imgUrl,
                                width: 35,
                                height: 35,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: ClipOval(
                                child: Container(
                                  width: 7,
                                  height: 7,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.only(right: 10, left: 8),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 15,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  /// 标题栏
  _titleBar() {
    return Container(
        color: Color(THEME_COLOR),
        child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    MyLocalization.of(context).disTitle,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )));
  }
}
