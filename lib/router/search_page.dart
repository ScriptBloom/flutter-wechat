import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/common/constant.dart';
import 'package:flutter_wechat/language/my_locale.dart';
import 'package:flutter_wechat/widget/search_bar.dart';

/// 搜索页面
const List<String> CONTENT = [
  "moments",
  "article",
  "official account",
  "mini",
  "music",
  "sticker",
];
const int LINE_COUNT = 3;

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateSearchPage();
  }
}

class StateSearchPage extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(BG_COLOR),
      body: Column(
        children: <Widget>[
          _searchBar(),
          _buildSearchContentBar(),
          _buildSearchContents(),
        ],
      ),
    );
  }

  /// 搜索栏
  _searchBar() {
    return SearchBar(
      searchBarType: SearchBarType.search_page,
      hint: MyLocalization.of(context).search,
    );
  }

  /// 搜索指定内容 bar
  _buildSearchContentBar() {
    return Container(
      margin: EdgeInsets.only(top: 35, bottom: 30),
      child: Center(
        child: Text(
          MyLocalization.of(context).specialContent,
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ),
    );
  }

  /// 构建两行搜索内容 通过每行三个队list进行切分
  /// 支持传入更多内容来构建够多行数据
  _buildSearchContents() {
    /// 分三个一组
    List<List<String>> list = [];
    int i = 0;
    List<String> subList = [];
    CONTENT.forEach((o) {
      if (i % 3 == 0) {
        list.add(subList);
        subList = new List()..add(o);
      } else {
        subList.add(o);
      }
      i++;
    });
    list.removeAt(0);
    list.add(subList);
    return Column(
        children: list
            .map((list) => Container(
          padding: EdgeInsets.only(bottom: 20),
            child: Row(
                  children: list
                      .map((str) =>
                          _buildSearchContentItem(str, list.indexOf(str)))
                      .toList(),
                )))
            .toList());
  }

  /// 构建一个搜索内容 比如"朋友圈"
  /// 关键在于如何对Divider进行定位并让字符根据这个Divider进行padding进行显示
  Widget _buildSearchContentItem(String str, int index) {
    return index != 2
        ? Expanded(
      flex: index==1?3:4,
            child: Stack(children: <Widget>[
              Positioned(right: 0,
                  child: _buildDivider()),
              Center(
                child: Text(
                  MyLocalization.of(context).getSearchContentKey(str),
                  style: TextStyle(fontSize: 15, color: Colors.blue[900]),
                ),
              )
            ]),
          )
        : Expanded(
      flex: 4,
      child: Stack(children: <Widget>[
        Center(
          child: Text(
            str,
            style: TextStyle(fontSize: 15, color: Colors.blue[900]),
          ),
        )
      ]),
    );
  }

  /// 构建Divider
  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.only(left: 30),
      color: Colors.grey,
      height: 15,
      width: 1,
    );
  }
}
