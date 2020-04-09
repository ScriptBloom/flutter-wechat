import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wechat/common/constant.dart';
import 'package:flutter_wechat/language/my_locale.dart';
import 'package:flutter_wechat/router/contact_page.dart';
import 'package:flutter_wechat/router/discover_page.dart';
import 'package:flutter_wechat/router/home_page.dart';
import 'package:flutter_wechat/router/mine_page.dart';

const IconFont = "appIconFont";
enum BadgeType { RED_POINT, COUNT_TEXT }

class TabNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateTabNavigator();
  }
}

class _StateTabNavigator extends State<TabNavigator>
    with AutomaticKeepAliveClientMixin {
  final Color _notColor = Colors.black;
  final Color _onColor = Colors.green;
  int _currentIndex = 0;
  DateTime _lastExitTime;

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: WillPopScope(
          onWillPop: () {
            if (_lastExitTime == null ||
                DateTime.now().difference(_lastExitTime) >
                    Duration(seconds: 1)) {
              _lastExitTime = DateTime.now();
              /*Fluttertoast.showToast(
                  msg: "点击间隔过大或者第一次点击",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
//                  timeInSecForIos: 1,
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  fontSize: 16.0
              );*/
              return Future.value(false);
            }
//            Fluttertoast.showToast(
//                msg: "退出",
//                toastLength: Toast.LENGTH_SHORT,
//                gravity: ToastGravity.BOTTOM,
////                  timeInSecForIos: 1,
//                backgroundColor: Colors.red,
//                textColor: Colors.white,
//                fontSize: 16.0
//            );
            return Future.value(true);
          },
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: <Widget>[
              HomePage(),
              ContactPage(),
              DiscoverPage(),
              MinePage()
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 24,
        backgroundColor: Colors.grey[100],
        type: BottomNavigationBarType.fixed,
        //固定
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _bottomNavItemBadge(0xe608, 0xe603, MyLocalization.of(context).icon1, 0, isBadge: true),
          _bottomNavItemBadge(0xe601, 0xe656, MyLocalization.of(context).icon2, 1, isBadge: true),
          _bottomNavItemBadge(0xe600, 0xe671, MyLocalization.of(context).icon3, 2, isBadge: true),
          _bottomNavItemBadge(0xe6c0, 0xe626, MyLocalization.of(context).icon4, 3, isBadge: true),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _bottomNavItemBadge(
      int onCodePoint, int offCodePoint, String title, int index,
      {bool isBadge = false, int badgeType, int badgeCount}) {
    return BottomNavigationBarItem(
        icon: Container(
            width: 60,
            child: Column(children: <Widget>[
              Stack(children: <Widget>[
                Icon(IconData(onCodePoint, fontFamily: IconFont)),
                isBadge == true
                    ? Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.fromBorderSide(BorderSide(
                                  width: 1, color: Colors.red[600]))),
                          child: Container(
                            color: Colors.red[600],
                            height: 6,
                            width: 6,
                          ),
                        ),
                      )
                    : null
              ]),
              Text(
                title,
                style: TextStyle(
                    color: _currentIndex == index ? _onColor : _notColor,fontSize: 10),
              )
            ])),
        activeIcon: Container(
            width: 60,
            child: Column(children: <Widget>[
              Stack(children: <Widget>[
                Icon(IconData(offCodePoint, fontFamily: IconFont)),
                isBadge == true
                    ? Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.fromBorderSide(BorderSide(
                                  width: 1, color: Colors.red[600]))),
                          child: Container(
                            color: Colors.red[600],
                            height: 6,
                            width: 6,
                          ),
                        ),
                      )
                    : null
              ]),
              Text(
                title,
                style: TextStyle(
                    color: _currentIndex == index ? _onColor : _notColor,fontSize: 10),
              )
            ])),
        title: Text(""));
  }

  @override
  bool get wantKeepAlive => true;
}
