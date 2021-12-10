import 'dart:async';

import 'package:first_flutter_app/bean/aritical_bean.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

/// @auter Created by tyy on 2021/12/8
/// desc   :
/// version:
///
class ArticleEdit extends StatefulWidget {
  const ArticleEdit({Key key, this.infobeanLinks}) : super(key: key);
  final Result infobeanLinks;

  @override
  _ArticleEditState createState() => _ArticleEditState();
}

class _ArticleEditState extends State<ArticleEdit> {
  Future<bool> getonWillPop() {
    // await
    // FocusScope.of(context).requestFocus(FocusNode());
    //返回
    Navigator.of(context).pop(this);
    return new Future.value(true);
  }

  var textLength = 0;
  String tip="Sdsd";

  ///创建文本控制器实例
  final TextEditingController _editingController = new TextEditingController();
  StreamController _streamController;

  @override
  void initState() {
    _streamController = StreamController<int>();
   String content= widget.infobeanLinks.content??"";
    _editingController.value = _editingController.value.copyWith(
      text: content,
      selection:
      TextSelection(baseOffset: content.length, extentOffset: content.length),
      composing: TextRange.empty,
    );
    _editingController.addListener(() {
      String text = _editingController.text?? widget.infobeanLinks.content;


      textLength = text.length;
      _streamController.add(textLength);

       tip = textLength == 20 ? "有最大字数限制" : "1";
    });

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
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
                onPressed: () {
                  showToast('保存');
                  FocusScope.of(context).requestFocus(FocusNode());
                 widget.infobeanLinks.scontent= _editingController.text.toString();
                },
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
                padding:
                    EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  decoration: BoxDecoration(
                    border: new Border.all(color: Colors.amber, width: 2),
                    borderRadius:
                        BorderRadius.all(Radius.circular(10)), // 也可控件一边圆角大小
                  ),
                  child: TextField(
                    controller: _editingController,
                    cursorColor: Colors.amber,
                    cursorRadius: Radius.circular(10.0),
                    cursorHeight: 20,
                    cursorWidth: 2,
                    maxLines: 6,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: '请输入文章正文',
                        hintStyle:
                            TextStyle( fontSize: 12),
                        counterText: getTextWidget(),
                        counterStyle:
                            TextStyle( fontSize: 10),
                        border: InputBorder.none,
                        errorStyle: TextStyle(fontSize: 10)),
                    maxLength: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        onWillPop: getonWillPop);
  }

  @override
  void dispose() {
    _editingController.dispose();
    _streamController.close();
    super.dispose();
  }

  getTextWidget() {
    StreamBuilder(
      initialData: 0,
      stream: _streamController.stream,
      builder: (context, snapshot) {
        return snapshot.data;
      },
    );
  }

}
