import 'package:flutter_wechat/model/mine_model.dart';

class MineApi{
  static List<MineModel> mock(){
    List<MineModel> _mineModels = [];
    _mineModels.add(MineModel(
        assets: "images/ic_wallet.png", title: "支付", isDownDivider: true));
    _mineModels.add(MineModel(assets: "images/ic_collections.png",
        title: "收藏",
        isDownDivider: false));
    _mineModels.add(MineModel(
        assets: "images/ic_album.png", title: "相册", isDownDivider: false));
    _mineModels.add(MineModel(assets: "images/ic_cards_wallet.png",
        title: "卡包",
        isDownDivider: false));
    _mineModels.add(MineModel(
        assets: "images/ic_emotions.png", title: "表情", isDownDivider: true));
    _mineModels.add(MineModel(assets: "images/ic_settings.png",
        title: "设置",
        rightText: "账号未保护",
        isDownDivider: false));
    return _mineModels;
  }
}