
import 'package:flutter_wechat/model/moments/moment_model.dart';

class MoMentsApi{
  static List<MomentModel> mock(){
    List<MomentModel> _momentModels = [];
    _momentModels.add(MomentModel(MomentItemType.pure_text,null,"Grow","昨天",null));
    _momentModels.add(MomentModel(MomentItemType.pure_one_pic,null,"Grow","昨天",null));
//    _momentModels.add(MomentModel(MomentItemType.pure_video,null,"Grow","昨天",null));
    _momentModels.add(MomentModel(MomentItemType.pure_more_pics,null,"Grow","昨天",null,picList: ["1","1","1","1","2"]));
    _momentModels.add(MomentModel(MomentItemType.text_with_one_pic,null,"Grow","昨天",null));
    _momentModels.add(MomentModel(MomentItemType.text_with_link,null,"Grow","昨天",null));
    _momentModels.add(MomentModel(MomentItemType.prue_link,null,"Grow","昨天",null));
    _momentModels.add(MomentModel(MomentItemType.text_with_more_pic,null,"Grow","昨天",null,picList: ["1","1","1","1","2"]));
//    _momentModels.add(MomentModel(MomentItemType.text_with_video,null,"Grow","昨天",null));
//    _momentModels.add(MomentModel(MomentItemType.ad,null,"Grow","昨天",null));
    return _momentModels;
  }
}
