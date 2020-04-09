import 'package:flutter_wechat/model/mine_model.dart';

class MineApi{
  static List<MineModel> mock(){
    List<MineModel> _mineModels = [];
    _mineModels.add(MineModel(
        assets: "images/ic_wallet.png", title: "pay", isDownDivider: true));
    _mineModels.add(MineModel(assets: "images/ic_collections.png",
        title: "favo",
        isDownDivider: false));
    _mineModels.add(MineModel(
        assets: "images/ic_album.png", title: "post", isDownDivider: false));
    _mineModels.add(MineModel(assets: "images/ic_cards_wallet.png",
        title: "card",
        isDownDivider: false));
    _mineModels.add(MineModel(
        assets: "images/ic_emotions.png", title: "sticker", isDownDivider: true));
    _mineModels.add(MineModel(assets: "images/ic_settings.png",
        title: "setting",
        rightText: "账号未保护",
        isDownDivider: false));
    _mineModels.add(MineModel(assets: "images/ic_settings.png",
        title: "language",
        isDownDivider: false));
    return _mineModels;
  }
}
