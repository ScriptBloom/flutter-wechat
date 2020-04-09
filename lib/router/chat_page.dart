import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/common/constant.dart';

/// 聊天页
class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(BG_COLOR),
        body: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              titleBar(context),
              _chatContainer(),
              _msgBottomBar(),
            ],
          ),
        ));
  }

  /// 底部发送消息的部分
  _msgBottomBar() {
    return Container(
      height: 60,
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.fromBorderSide(BorderSide(width: 2)),
                ),
                child: Icon(
                  Icons.keyboard_voice,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            Expanded(
              flex: 7,
                child: Container(
              height: 40,
              padding: EdgeInsets.only(top: 5, bottom: 5,),
              margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
              child: TextField(
                autofocus: false,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 13),
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 15,
                    )),
              ),
            )),
            Expanded(
              flex:1,
              child: Container(
                margin: EdgeInsets.only(left: 5),
                child: Image.asset(
                  "images/ic_emotions.png",
                  height: 40,
                  width: 34,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 5,right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.fromBorderSide(BorderSide(width: 2)),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 中间的聊天部分
  _chatContainer() {
    return Expanded(child: Container(width: double.maxFinite,child: Image.asset("images/chat_bg.png",fit: BoxFit.cover,),));
  }

  /// 标题栏
  titleBar(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 15),
                child: Row(children: <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black87,
                    size: 17,
                  ),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Text(
                      "458",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  )
                ]),
              ),
            ),
            Container(
              child: Text(
                "biao",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
