import 'package:first_flutter_app/bean/aritical_bean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'article_edit.dart';

/// @auter Created by tyy on 2021/12/8
/// desc   :
/// version:
///
class ArticleDetail extends StatefulWidget {
  const ArticleDetail({Key key, this.infobeanLinks}) : super(key: key);
  final Result infobeanLinks;

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '文章详情',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>ArticleEdit()));
            },
            child: Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 15,
              right: 10,
              left: 10,
            ),
            child: Text(
              widget.infobeanLinks.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              widget.infobeanLinks.passtime,
              style: TextStyle(color: Colors.black38, fontSize: 10),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: ClipRRect(
              child: Image.network(
                widget.infobeanLinks.image,
                width: MediaQuery.of(context).size.width,
                height: 300,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
         Expanded(child:   Padding(
           padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
           child: Text('文章正文'),
         ))

        ],
      ),
    );
  }
}
