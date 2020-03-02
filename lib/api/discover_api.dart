import 'package:flutter_wechat/model/discover_model.dart';

class DiscoverApi{
  static List<DiscoverModel> mock(){
    List<DiscoverModel> _discoverModel = [];
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_social_circle.png",
        title: "朋友圈",
        imgUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcStSJPuGbyKL4NnEPTuyumS9CkheNYQdmpLwHW5VJ1kOCCoUpj9",
        isDownDivider: true));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_bottle_msg.png",
        title: "视频号",
        isDownDivider: true));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_quick_scan.png",
        title: "扫一扫",
        isDownDivider: false));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_shake_phone.png",
        title: "摇一摇",
        isDownDivider: true));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_feeds.png", title: "看一看", isDownDivider: false));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_quick_search.png",
        title: "搜一搜",
        isDownDivider: true));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_people_nearby.png",
        title: "附近的人",
        isDownDivider: true));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_shopping.png", title: "购物", isDownDivider: false));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_game_entry.png", title: "游戏", isDownDivider: true));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_mini_program.png",
        title: "小程序",
        isDownDivider: true));
    return _discoverModel;
  }
}