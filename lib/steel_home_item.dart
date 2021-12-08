import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'bean/aritical_bean.dart';
import 'infobean_entity.dart';
import 'mwidget/loading_widget.dart';

/// @auter Created by tyy on 2021/11/29
/// desc   :
/// version:

// {
// "links": [
// {
// "title": "Google",
// "source": "http://www.google.com",
// "img": "dasads"
// }
// ]
// }

class ItemSteelHomeArticle extends StatefulWidget {
  const ItemSteelHomeArticle({Key key, @required this.infobeanLinks})
      : super(key: key);
  final Result infobeanLinks;

  @override
  _ItemSteelHomeArticleState createState() => _ItemSteelHomeArticleState();
}

class _ItemSteelHomeArticleState extends State<ItemSteelHomeArticle> {
  @override
  Widget build(BuildContext context) {

    return Container(
      // color: Colors.blue,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: Text(
                      widget.infobeanLinks.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.infobeanLinks.passtime,
                      style: TextStyle(color: Colors.black38, fontSize: 10),
                    ),
                  )
                ],
              )),
          Visibility(
            visible: getVisibility(widget.infobeanLinks.image),
            //是否占位
            maintainState: getVisibility(widget.infobeanLinks.image),
            child: Padding(
                padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
                child:  ClipRRect(child: Image.network(widget.infobeanLinks.image,width: 100,height: 80,  fit: BoxFit.cover,),borderRadius: BorderRadius.circular(10.0),)),
          )
        ],
      ),
    );
  }

  @override
  void initState() {

  }

  getVisibility(String img) {
    if (img.isEmpty) {
      return false;
    } else {
      return true;
    }
  }



}
