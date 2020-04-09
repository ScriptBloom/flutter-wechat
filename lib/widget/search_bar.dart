import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/common/constant.dart';
import 'package:flutter_wechat/language/my_locale.dart';

import '../common/common.dart';

/// 自定义微信搜索栏
/// 两种样式
/// 1. 搜索在中间
/// 2. 搜索在左边 并且 focus
enum SearchBarType { normal_page, search_page }

class SearchBar extends StatefulWidget {
  final bool enable;
  final SearchBarType searchBarType;
  final String hint;
  final String defaultText;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  SearchBar({
    Key key,
    this.enable = true,
    this.searchBarType = SearchBarType.normal_page,
    this.hint,
    this.defaultText,
    this.inputBoxClick,
    this.onChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StateSearchBar();
  }
}

class StateSearchBar extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _searchBar();
  }

  _searchBar() {
    return Container(
      child: _inputBox(),
    );
  }

  _inputBox() {
    return widget.searchBarType == SearchBarType.search_page
        ? _searchPageBar()
        : _nomalPageBar();
  }

  void _onChanged(String value) {
    if (value.length > 0) {
      setState(() {
        showClear = true;
      });
    } else
      setState(() {
        showClear = false;
      });
    if (widget.onChanged != null) widget.onChanged(value);
  }

  _buildClearIcon() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey),
      child: GestureDetector(
          onTap: () {
            _controller.clear();
          },
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 16,
          )),
    );
  }

  _searchPageBar() {
    return Container(
        margin: EdgeInsets.only(left: 5, top: 30),
        child: Row(children: <Widget>[
          Expanded(
              flex: 7,
              child: Container(
//        width: 300,
                  margin: EdgeInsets.only(right: 10),
                  height: 34,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                      child: Stack(children: <Widget>[
                    TextField(
                      maxLines: 1,
                      controller: _controller,
                      onChanged: _onChanged,
                      autofocus: true,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                          icon: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.search,
                                  size: 23, color: Colors.grey[400])),
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 13),
                          border: InputBorder.none,
                          hintText: widget.hint,
                          hintStyle: TextStyle(
                            fontSize: 15,
                          )),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: showClear ? _buildClearIcon() : Container(),
                    )
                  ])))),
          Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.only(right: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      MyLocalization.of(context).cancel,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          color: Colors.blue[900]),
                    ),
                  )))
        ]));
  }

  _nomalPageBar() {
    return wrapCallback(Container(
        margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        height: 34,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(
                    Icons.search,
                    size: 23,
                    color: Color(THEME_COLOR),
                  )),
              Container(
                child: Container(
                  child: Text(
                    widget.hint,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
              )
            ]),
    ),
        widget.inputBoxClick);
  }
}
