import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'infobean_entity.dart';

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
  final InfobeanLinks infobeanLinks;

  @override
  _ItemSteelHomeArticleState createState() => _ItemSteelHomeArticleState();
}

class _ItemSteelHomeArticleState extends State<ItemSteelHomeArticle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.infobeanLinks.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(widget.infobeanLinks.xSource)
                  ],
                ),
              )),
          Visibility(
            visible: true,
            //是否占位
            maintainState: true,
            child: Padding(
                padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
                child: SizedBox(
                    width: 100,
                    height: 80,
                    child: Image.network(widget.infobeanLinks.img))),
          )
        ],
      ),
    );
  }
}
