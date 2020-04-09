import 'package:flutter_wechat/model/discover_model.dart';

class DiscoverApi{
  static List<DiscoverModel> mock(){
    List<DiscoverModel> _discoverModel = [];
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_social_circle.png",
        title: "moments",
        imgUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcStSJPuGbyKL4NnEPTuyumS9CkheNYQdmpLwHW5VJ1kOCCoUpj9",
        isDownDivider: true));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_bottle_msg.png",
        title: "channels",
        isDownDivider: true));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_quick_scan.png",
        title: "scan",
        isDownDivider: false));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_shake_phone.png",
        title: "shake",
        isDownDivider: true));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_feeds.png", title: "look", isDownDivider: false));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_quick_search.png",
        title: "search",
        isDownDivider: true));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_people_nearby.png",
        title: "near",
        isDownDivider: true));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_shopping.png", title: "shopping", isDownDivider: false));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_game_entry.png", title: "game", isDownDivider: true));
    _discoverModel.add(DiscoverModel(
        assets: "images/ic_mini_program.png",
        title: "mini",
        isDownDivider: true));
    return _discoverModel;
  }
}
