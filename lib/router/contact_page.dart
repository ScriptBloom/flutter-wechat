import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/api/contact_api.dart';
import 'package:flutter_wechat/language/my_locale.dart';
import 'package:flutter_wechat/model/contact_model.dart';
import 'package:flutter_wechat/router/search_page.dart';
import 'package:flutter_wechat/widget/search_bar.dart';

import '../common/constant.dart';

/// 通讯录页面

const INDEX_LETTERS = [
  "↑",
  "☆",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z",
  "#"
];
const int ITEM_HEIGHT = 57;

/// 每个ListTile高度
const int BASE_CONTACT_COUNT = 4;
const int SEARCH_BAR_HEIGHT = 45;

/// 四个基础通讯录 微信官方的几个通讯录
const double LETTER_ITEM_BAR_HEIGHT = 30.0;

class ContactPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateContactPage();
  }
}

class StateContactPage extends State<ContactPage> {
  /// 接收的数据
  List<ContactModel> _starFriendsList = [];
  List<ContactModel> _letterList = [];
  List<ContactModel> _baseContactList = [];
  ScrollController _scrollController = ScrollController();
  bool _showLetterHintBar = false;
  String _letterHintBarLt = "";

  /// 用于控制字母对应位置
  Map<String, double> _letterPositions = {};
  int _length = 0;
  double _lastPosition = 0;
  double topFixHeight = 0;

  /// 第一个字母开始的位置
  /// 按下时的标志
  String _onTap = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      _searBar(),
    ];
    list.addAll(_contactsItems());
    return Scaffold(
      body: Column(children: <Widget>[
        _titleBar(),
        MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Expanded(
                child: Stack(children: <Widget>[
              ListView(
//                itemExtent: 57,
                controller: _scrollController,
                children: list,
              ),
              _letterIndexView(),
              _showLetterHintBar
                  ? Center(child: _letterHintBar())
                  : Container(),
            ]))),
      ]),
    );
  }

  @override
  void initState() {
    super.initState();

    /// 模拟接收到的数据
    List<ContactModel> commonList = ContactApi.mock();
    _starFriendsList.addAll(commonList);
    _baseContactList.addAll([
      ContactModel(type: 0, url: "images/ic_new_friend.png", name: "new friend"),
      ContactModel(type: 0, url: "images/ic_group_chat.png", name: "group"),
      ContactModel(type: 0, url: "images/ic_tag.png", name: "tags"),
      ContactModel(type: 0, url: "images/ic_public_account.png", name: "official account")
    ]);
    _letterList.addAll(commonList);
    _letterList.addAll(commonList);
    _letterList.addAll(commonList);

    /// 计算第一个字母开始位置
    topFixHeight = ITEM_HEIGHT * BASE_CONTACT_COUNT +
        LETTER_ITEM_BAR_HEIGHT +
        ITEM_HEIGHT * _starFriendsList.length +
        SEARCH_BAR_HEIGHT;

    /// 起点
    _letterPositions[INDEX_LETTERS[0]] = 0;

    /// 星标朋友height
    _letterPositions[INDEX_LETTERS[1]] =
        ITEM_HEIGHT * BASE_CONTACT_COUNT.toDouble();

    /// 初始化监听滑动 触发字母表改变ui
    _scrollController.addListener(() {
      _letterPositions.forEach((k, v) {
        if (v > _scrollController.offset &&
            INDEX_LETTERS.indexOf(k) > 2 &&
            _letterPositions[INDEX_LETTERS[INDEX_LETTERS.indexOf(k) - 1]] <
                _scrollController.offset) {
          setState(() {
            _onTap = INDEX_LETTERS[INDEX_LETTERS.indexOf(k) - 1];
          });
        }
      });
    });
  }

  /// contacts items
  List<Widget> _contactsItems() {
    List<Widget> widgets = [];
    widgets.addAll(_basicContactItems());
    widgets.addAll(_starFriendsItems().isEmpty ? [] : _starFriendsItems());
    INDEX_LETTERS.map((f) => _letterItems(f)).forEach((o) => widgets.addAll(o));
    return widgets;
  }

  /// 字母items
  List<Widget> _letterItems(String letter) {
    /// 如果是顶部和星号 则不用进行
    if (letter == INDEX_LETTERS[0] || letter == INDEX_LETTERS[1]) return [];
    List list = [];
    _letterList.forEach((o) {
      if (o.startLetter == letter) {
        list.add(o);
      }
    });

    /// 统计contact item个数 用于定位letter所在的position 一个item height = 44
    if (INDEX_LETTERS.indexOf(letter) > 2) {
      _letterPositions[letter] =
          _lastPosition + _length * 57.0 + (_length == 0 ? 0 : 30);
    } else {
      _letterPositions[letter] = topFixHeight;
    }
    _length = list.length;
    _lastPosition = _letterPositions[letter];

    /// 添加item widget
    if (list.isEmpty) return [];
    List<Widget> widgets = [_itemsTitleBar(name: letter)];
    widgets.addAll(
        list.map((o) => _commonItem(type: o.type, url: o.url, name: o.name)));
    return widgets;
  }

  /// 星标朋友
  List<Widget> _starFriendsItems() {
    if (_starFriendsList.isEmpty) return [];
    List<Widget> list = [
      _itemsTitleBar(name: "☆ 星标朋友"),
    ];
    list.addAll(_starFriendsList
        .map((o) => _commonItem(type: o.type, url: o.url, name: o.name)));
    return list;
  }

  /// 公共账号items 新的朋友 群聊 标签 公众号
  List<Widget> _basicContactItems() {
    List<Widget> list = [];
    list.addAll(_baseContactList
        .map((o) => _commonItem(type: o.type, url: o.url, name: MyLocalization.of(context).getCont(o.name))));
    return list;
  }

  /// 每个字母的标题栏
  _itemsTitleBar({@required String name}) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      width: double.maxFinite,
      height: 30,
      color: Color(THEME_COLOR),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          )
        ],
      ),
    );
  }

  /// 标题栏
  _titleBar() {
    return Container(
        height: 70,
        color: Color(BG_COLOR),
        child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 30),
                ),
                Container(
                  child: Text(
                    MyLocalization.of(context).conTitle,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Container(
                      child: Icon(
                        Icons.group_add,
                        size: 19,
                        color: Colors.black87,
                      ),
                    ))
              ],
            )));
  }

  /// 搜索栏
  _searBar() {
    return Container(
      height: 45,
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

  /// 公共item 每一个contact
  /// type 0:本地图片 1:网络图片
  Widget _commonItem(
      {@required int type, @required String url, @required String name}) {
    return Column(children: <Widget>[
      ListTile(
        leading: Container(
          height: 44,
          width: 44,
          child: Stack(children: <Widget>[
            Positioned(
                left: 0,
                bottom: 0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: type == 1
                        ? Image.network(
                            url ??
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcStSJPuGbyKL4NnEPTuyumS9CkheNYQdmpLwHW5VJ1kOCCoUpj9",
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          )
                        : Image.asset(
                            url,
                            fit: BoxFit.cover,
                            width: 40,
                            height: 40,
                          ))),
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
      ),
      Divider(
        height: 1,
        color: Colors.grey,
        indent: 70,
      ),
    ]);
  }

  /// 右边栏的字母表
  _letterIndexView() {
    return Positioned(
      right: 4,
      top: 15,
      width: 11,
      child: Column(
        children: INDEX_LETTERS
            .map((letter) => GestureDetector(
                onTap: () {
                  setState(() {
                    _onTap = letter;
                    _jumpToLetter(letter);
                    _letterHintBarLt = letter;
                    _showLetterHintBar = true;
                  });
                  Future.delayed(Duration(milliseconds: 500), () {
                    setState(() {
                      _showLetterHintBar = false;
                    });
                  });
                },
                onLongPress: () {
                  setState(() {
                    _onTap = letter;
                    _letterHintBarLt = letter;
                    _showLetterHintBar = true;
                  });
                },
                onLongPressEnd: (LongPressEndDetails endDetails) {
                  setState(() {
                    _onTap = letter;
                    _showLetterHintBar = false;
                  });
                  _jumpToLetter(letter);
                },
                child: Padding(
                    padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
                    child: ClipOval(
                        child: Container(
                            width: 12,
                            color: _onTap == letter &&
                                    letter != INDEX_LETTERS[0] &&
                                    letter != INDEX_LETTERS[1]
                                ? Colors.green
                                : Colors.transparent,
                            child: Center(
                                child: Text(
                              letter,
                              style: TextStyle(
                                fontSize: 10,
                                color: _onTap == letter &&
                                        letter != INDEX_LETTERS[0] &&
                                        letter != INDEX_LETTERS[1]
                                    ? Colors.white
                                    : Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            )))))))
            .toList(),
      ),
    );
  }

  /// 点击字母屏幕中心弹窗
  _letterHintBar() {
    return Card(
      color: Colors.black54,
      child: Container(
        alignment: Alignment.center,
        width: 80.0,
        height: 80.0,
        child: Text(
          _letterHintBarLt,
          style: TextStyle(
            fontSize: 32.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// 跳转到指定字母位置
  _jumpToLetter(String letter) {
    if (_letterPositions.isNotEmpty) {
      final _pos = _letterPositions[letter];
      if (_pos != null) {
        _scrollController.animateTo(_pos,
            curve: Curves.easeOut, duration: Duration(milliseconds: 200));
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
