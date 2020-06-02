import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/api/moment_api.dart';
import 'package:flutter_wechat/model/moments/moment_model.dart';
import 'package:flutter_wechat/router/moments/moment_item.dart';

class MomentsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateMomentPage();
  }
}

class StateMomentPage extends State<MomentsPage> {
  List<MomentModel> _datas = [];
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _onScroll(offset) {
    double alpha = offset / 350;
    print(alpha);
    if (alpha < 0)
      alpha = 0;
    else if (alpha > 1) alpha = 1;
    setState(() {
      _opacity = alpha;
    });
  }

  _loadData() {
    _datas.addAll(MoMentsApi.mock());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(_buildBackGroundView());
    widgets.addAll(_datas.map((o) => MomentItem(o)).toList());
    return Scaffold(
      body: NotificationListener(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification &&
              scrollNotification.depth == 0) {
            _onScroll(scrollNotification.metrics.pixels);
          }
          return false;
        },
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: widgets,
              ),
            ),
            Positioned(
              child: _buildTitleBar(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitleBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      padding: EdgeInsets.only(top: 40, bottom: 8, left: 10),
      decoration: BoxDecoration(
          color: Color.fromARGB((_opacity * 255).toInt(), 220, 220, 220)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: _opacity >= 1?Colors.black:Colors.white,
                  size: 22,
                ),
              ),
              _opacity >= 1
                  ? Container(
                      padding: EdgeInsets.only(left: 10,bottom: 5),
                      child: Text(
                        "朋友圈",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : SizedBox()
            ],
          ),
          GestureDetector(
              onTap: () {
                //todo 朋友圈照相页
              },
              child: Container(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.camera_enhance,
                  color: _opacity >= 1?Colors.black:Colors.white,
                  size: 20,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildBackGroundView() {
    return Container(
      width: double.maxFinite,
      height: 470,
      child: Stack(
        children: <Widget>[
          Container(
            child: Image.asset(
              "images/avatar.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 20,
            top: 370,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  "images/avatar.png",
                  width: 70,
                  height: 70,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_datas != null) {
      _datas.clear();
    }
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
