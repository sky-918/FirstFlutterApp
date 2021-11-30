import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  const ItemSteelHomeArticle({Key key}) : super(key: key);

  @override
  _ItemSteelHomeArticleState createState() => _ItemSteelHomeArticleState();
}

class _ItemSteelHomeArticleState extends State<ItemSteelHomeArticle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child:
      Row(
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
                      "有子曰：其为人也孝弟，而好犯上者，鲜矣；不",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text("来源")
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
                    child: Image.network(
                        "https://img2.baidu.com/it/u=3432174479,1450323813&fm=26&fmt=auto"))),
          )
        ],
      ),
    );
  }
}
