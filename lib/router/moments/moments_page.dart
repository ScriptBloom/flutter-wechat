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

  @override
  void initState() {
    super.initState();
    _loadData();
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
      body: SingleChildScrollView(
        child: Column(
          children: widgets,
        ),
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
                  width: 70,height: 70,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,left: 20,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,),
            ),
          ),
          Positioned(
            top: 50,right: 20,
            child: GestureDetector(
              onTap: (){
                //todo 朋友圈照相页
              },
              child: Icon(Icons.camera_enhance,color: Colors.white,size: 20,),
            ),
          )
        ],
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    if (_datas != null) {
      _datas.clear();
    }
  }
}
