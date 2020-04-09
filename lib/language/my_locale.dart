import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyLocalization {
  final Locale locale;

  MyLocalization(this.locale);

  //此处
  static MyLocalization of(BuildContext context) {
    return Localizations.of<MyLocalization>(context, MyLocalization);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Wechat',
      'icon1': 'Chats',
      'icon2': 'Contacts',
      'icon3': 'Discover',
      'icon4': 'Me',
      'home_title': 'WeChat',
      'contact_title': 'Contacts',
      'discover_title': 'Discover',
      'new_friend': 'New Friends',
      'group_chats': 'Group Chats',
      'tags': 'Tags',
      'moments': 'Moments',
      'channel': 'Channels',
      'scan': 'Scan',
      'shake': 'Shake',
      'top stories': 'Top Stories',
      'search': 'Search',
      'peopel near': 'People Nearby',
      'game': 'Games',
      'mini program': 'Mini Programs',
      'official accounts': 'Official Accounts',
      'auto': 'Auto',
      'pay': 'Wehcat Pay',
      'favo': 'Favorites',
      'post': 'My Posts',
      'card&offers': 'Card & Offers',
      'sticker gallery': 'Sticker Gallery',
      'setting': 'Settings',
      'language': 'Language',
      'look': 'look',
      'shopping': 'shoping',
      'wxid': 'WeChat ID',
      'cancel': 'Cancel',
      'music': 'Music',
      'article': 'Article',
      'setting language': 'Language Setting',
      'finish': 'Finish',
      'search special content': 'Search special content',
    },
    'zh': {
      'title': '微信',
      'icon1': '微信',
      'icon2': '通讯录',
      'icon3': '发现',
      'icon4': '我',
      'home_title': '微信',
      'contact_title': '通讯录',
      'discover_title': '发现',
      'new_friend': '新的朋友',
      'group_chats': '群聊',
      'tags': '标签',
      'moments': '朋友圈',
      'channel': '视频号',
      'scan': '扫一扫',
      'shake': '摇一摇',
      'top stories': '热搜',
      'search': '搜一搜',
      'peopel near': '附近的人',
      'game': '游戏',
      'mini program': '小程序',
      'official accounts': '公众号',
      'auto': '跟随设置',
      'pay': '支付',
      'favo': '收藏',
      'post': '相册',
      'card&offers': '卡包',
      'sticker gallery': '表情',
      'setting': '设置',
      'language': '多语言',
      'look': '看一看',
      'shopping': '购物',
      'wxid': '微信号',
      'cancel': '取消',
      'music': '音乐',
      'article': '文章',
      'setting language': '语言设置',
      'finish': '完成',
      'search special content': '搜索指定内容',
    }
  };

  get taskTitle {
    return _localizedValues[locale.languageCode]['search'];
  }

  get specialContent{
    return _localizedValues[locale.languageCode]['search special content'];
  }

  get peopleNear {
    return _localizedValues[locale.languageCode]['peopel near'];
  }

  get setting {
    return _localizedValues[locale.languageCode]['setting'];
  }

  get language {
    return _localizedValues[locale.languageCode]['language'];
  }

  get game {
    return _localizedValues[locale.languageCode]['game'];
  }

  get miniProgram {
    return _localizedValues[locale.languageCode]['mini program'];
  }

  get officialAccounts {
    return _localizedValues[locale.languageCode]['official accounts'];
  }

  get pay {
    return _localizedValues[locale.languageCode]['pay'];
  }

  get favo {
    return _localizedValues[locale.languageCode]['favo'];
  }

  get post {
    return _localizedValues[locale.languageCode]['post'];
  }

  get card {
    return _localizedValues[locale.languageCode]['card&offers'];
  }

  get stickerGallery {
    return _localizedValues[locale.languageCode]['sticker gallery'];
  }

  get newFriend {
    return _localizedValues[locale.languageCode]['new_friend'];
  }

  get groupChats {
    return _localizedValues[locale.languageCode]['group_chats'];
  }

  get tags {
    return _localizedValues[locale.languageCode]['tags'];
  }

  get moments {
    return _localizedValues[locale.languageCode]['moments'];
  }

  get channel {
    return _localizedValues[locale.languageCode]['channel'];
  }

  get scan {
    return _localizedValues[locale.languageCode]['scan'];
  }

  get shake {
    return _localizedValues[locale.languageCode]['shake'];
  }

  get topStories {
    return _localizedValues[locale.languageCode]['top stories'];
  }

  get auto {
    return _localizedValues[locale.languageCode]['auto'];
  }

  get icon1 {
    return _localizedValues[locale.languageCode]['icon1'];
  }

  get icon2 {
    return _localizedValues[locale.languageCode]['icon2'];
  }

  get icon3 {
    return _localizedValues[locale.languageCode]['icon3'];
  }

  get icon4 {
    return _localizedValues[locale.languageCode]['icon4'];
  }

  get homeTitle {
    return _localizedValues[locale.languageCode]['home_title'];
  }

  get disTitle {
    return _localizedValues[locale.languageCode]['discover_title'];
  }

  get conTitle {
    return _localizedValues[locale.languageCode]['contact_title'];
  }

  get search {
    return _localizedValues[locale.languageCode]['search'];
  }

  get look {
    return _localizedValues[locale.languageCode]['look'];
  }

  get shopping {
    return _localizedValues[locale.languageCode]['shopping'];
  }

  get wxId {
    return _localizedValues[locale.languageCode]['wxid'];
  }

  get cancel {
    return _localizedValues[locale.languageCode]['cancel'];
  }

  get music {
    return _localizedValues[locale.languageCode]['music'];
  }

  get article {
    return _localizedValues[locale.languageCode]['article'];
  }
  get finish {
    return _localizedValues[locale.languageCode]['finish'];
  }

  get langSetting {
    return _localizedValues[locale.languageCode]['setting language'];
  }

  String getCont(String item) {
    switch (item) {
      case "tags":
        return tags;
      case "group":
        return groupChats;
      case "new friend":
        return newFriend;
      case "official account":
        return officialAccounts;
    }
    return "";
  }

  String getMineItem(String item) {
    switch (item) {
      case "pay":
        return pay;
      case "favo":
        return favo;
      case "post":
        return post;
      case "card":
        return card;
      case "sticker":
        return stickerGallery;
      case "setting":
        return setting;
      case "language":
        return language;
    }
    return "";
  }

  String getDicover(String item) {
    switch (item) {
      case "moments":
        return moments;
      case "channels":
        return channel;
      case "scan":
        return scan;
      case "shake":
        return shake;
      case "game":
        return game;
      case "near":
        return peopleNear;
      case "mini":
        return miniProgram;
      case "search":
        return search;
      case "shopping":
        return shopping;
      case "look":
        return look;
    }
    return "";
  }

  String getSearchContentKey(String item) {
    switch (item) {
      case "channels":
        return channel;
      case "moments":
        return moments;
      case "article":
        return article;
      case "official account":
        return officialAccounts;
      case "mini":
        return miniProgram;
      case "music":
        return music;
      case "sticker":
        return stickerGallery;
    }
    return "";
  }
}


  class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalization>{

  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
  return ['en','zh'].contains(locale.languageCode);
  }

  @override
  Future<MyLocalization> load(Locale locale) {
  return new SynchronousFuture<MyLocalization>(new MyLocalization(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<MyLocalization> old) {
  return false;
  }

  static MyLocalizationsDelegate delegate = const MyLocalizationsDelegate();
  }
