import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wechat/model/moments/moment_model.dart';
import 'package:flutter_wechat/widget/cl_flow.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class MomentItem extends StatefulWidget {
  final MomentModel data;

  MomentItem(this.data);

  @override
  State<StatefulWidget> createState() {
    return StateMomentItem();
  }
}

class StateMomentItem extends State<MomentItem> {
  @override
  Widget build(BuildContext context) {
    Widget item;
    switch (widget.data.type) {
      case MomentItemType.prue_link:
        item = _buildPureLink();
        break;
      case MomentItemType.pure_text:
        item = _buildPureText();
        break;
      case MomentItemType.pure_video:
        item = _buildPureVideo();
        break;
      case MomentItemType.text_with_link:
        item = _buildTextWithLink();
        break;
      case MomentItemType.text_with_one_pic:
        item = _buildTextWithOnePic();
        break;
      case MomentItemType.text_with_more_pic:
        item = _buildTextWithMorePic();
        break;
      case MomentItemType.text_with_video:
        item = _buildTextWithVideo();
        break;
      case MomentItemType.ad:
        item = _buildAd();
        break;
      case MomentItemType.pure_one_pic:
        item = _buildPureOnePic();
        break;
      case MomentItemType.pure_more_pics:
        item = _buildPureMorePics();
        break;
    }
    return item;
  }

  Widget _buildPureLink() {
    return _buildWithContent(Container(
      margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
      padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Image.asset(
            widget.data.authorAvatar ?? "images/avatar.png",
            width: 50,
            height: 50,
          )),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "合肥工业大学欢迎你合肥肥工业大学欢迎你你合肥工业大学欢迎你合肥工业",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget _buildPureText() {
    return _buildWithContent(
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Text(
          widget.data.content ??
              "合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你你合肥工业大学欢迎你合肥工业",
          softWrap: true,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildPureVideo() {}

  Widget _buildPureOnePic() {
    return _buildWithContent(
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context)=>Container(
              child: PhotoView(
                imageProvider: AssetImage(widget.data.authorAvatar ?? "images/avatar.png"),
              ),
            )
          ));
        },
        child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 15, bottom: 15),
            child: Image.asset(
              widget.data.authorAvatar ?? "images/avatar.png",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget _buildPureMorePics() {
    List<Container> list = [];
    for (var i = 0; i < widget.data.picList.length ?? 0; i++) {
      list.add(Container(
        child: Image.asset(
          widget.data.authorAvatar ?? "images/avatar.png",
        ),
      ));
    }
    return _buildWithContent(Container(
        margin: EdgeInsets.only(left: 10, top: 15, bottom: 15),
        child: CLFlow(count: widget.data.picList.length ?? 0, children: list)));
  }

  Widget _buildTextWithOnePic() {
    return _buildWithContent(
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              widget.data.content ??
                  "合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你你合肥工业大学欢迎你合肥工业",
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: Image.asset(
                widget.data.authorAvatar ?? "images/avatar.png",
                width: 200,
                height: 200,
                fit: BoxFit.scaleDown,
              )),
        ],
      ),
    );
  }

  Widget _buildTextWithMorePic() {
    List<Container> list = [];
    for (var i = 0; i < widget.data.picList.length ?? 0; i++) {
      list.add(Container(
        child: Image.asset(
          widget.data.authorAvatar ?? "images/avatar.png",
        ),
      ));
    }
    return _buildWithContent(
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              widget.data.content ??
                  "合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你你合肥工业大学欢迎你合肥工业",
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child: CLFlow(
                  count: widget.data.picList.length ?? 0, children: list))
        ],
      ),
    );
  }

  Widget _buildTextWithLink() {
    return _buildWithContent(Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            widget.data.content ??
                "合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你合肥工业大学欢迎你你合肥工业大学欢迎你合肥工业",
            softWrap: true,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
          padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Image.asset(
                widget.data.authorAvatar ?? "images/avatar.png",
                width: 50,
                height: 50,
              )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "合肥工业大学欢迎你合肥肥工业大学欢迎你你合肥工业大学欢迎你合肥工业",
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }

  Widget _buildTextWithVideo() {}

  Widget _buildAd() {}

  ///朋友圈basis item widget
  ///usage:wrap a child to contain
  Widget _buildWithContent(Widget content) {
    return Column(
      children: <Widget>[
        Container(
          width: double.maxFinite,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.data.authorAvatar ?? "images/avatar.png",
                      width: 50,
                      height: 50,
                    )),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        widget.data.authorName ?? "hello",
                        style: TextStyle(fontSize: 18, color: Colors.blue[900]),
                      ),
                    ),
                    content,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            widget.data.time ?? "昨天",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20, top: 10),
                          child: Icon(Icons.more_horiz),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          height: 1,
          color: Colors.grey[100],
        )
      ],
    );
  }
}
