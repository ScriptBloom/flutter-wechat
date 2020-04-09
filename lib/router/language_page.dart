
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wechat/language/my_locale.dart';
import 'package:flutter_wechat/model/language_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/constant.dart';

class LanguagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StateLocaleRouter();
  }

}
class StateLocaleRouter extends State<LanguagePage>{
  var color;
  var localeModel;
  var ml;
  var value;
  @override
  Widget build(BuildContext context) {
//   color = Theme.of(context).primaryColor;
   localeModel = Provider.of<LocaleModel>(context);
   ml = MyLocalization.of(context);
    Widget _buildLanguageItem(String lan, value) {
      return ListTile(
        title: Text(
          lan,
          // 对APP当前语言进行高亮显示
          style: TextStyle(color: this.value == value ? Colors.blue : null),
        ),
        trailing: this.value == value ? Icon(Icons.done, color: Colors.blue) : null,
        onTap: (){
          setState(() {
            this.value = value;
          });
        },
      );
    }
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _titleBar(),
          _buildLanguageItem("中文简体", "zh_CN"),
          _buildLanguageItem("English", "en_US"),
          _buildLanguageItem(ml.auto, null),
        ],
      ),
    );
  }

  /// 标题栏
  _titleBar() {
    return Container(
        height: 55,
        color: Color(BG_COLOR),
        child: Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      MyLocalization.of(context).cancel,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    MyLocalization.of(context).langSetting,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    localeModel.locale = value;
                    setLanguage(value);
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(
                      MyLocalization.of(context).finish,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            )));
  }


  setLanguage(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("language", value);
  }
}
