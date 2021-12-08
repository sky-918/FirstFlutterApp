import 'package:flutter/material.dart';

/// @auter Created by tyy on 2021/12/8
/// desc   :
/// version:
///
class ArticleEdit extends StatefulWidget {
  const ArticleEdit({Key key}) : super(key: key);

  @override
  _ArticleEditState createState() => _ArticleEditState();
}

class _ArticleEditState extends State<ArticleEdit> {
  Future<bool> getonWillPop (){
    // await
    // FocusScope.of(context).requestFocus(FocusNode());
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child:  Scaffold(
      appBar: AppBar(
        title: Text(
          '添加文章正文',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Icon(
              Icons.save,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10,top: 20),
            child: TextField(autofocus:false ,),
          )
        ],
      ),
    ), onWillPop: getonWillPop)

     ;
  }

}
