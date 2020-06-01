
class MomentModel{
  MomentItemType type;
  String authorAvatar;//作者头像url
  String authorName;//作者name
  List<String> picList;//图片url list
  String link;//链接
  String linkPic;//链接图片
  String content;//文字内容
  String time;//时间
  List<String> starList;

  MomentModel(this.type, this.authorAvatar, this.authorName, this.time, this.starList, {this.picList, this.link,
    this.linkPic, this.content}); //点赞人

}

enum MomentItemType {
  pure_text,
  pure_video,
  prue_link,
  pure_one_pic,
  pure_more_pics,
  text_with_link,
  text_with_one_pic,
  text_with_more_pic,
  text_with_video,
  ad
}
