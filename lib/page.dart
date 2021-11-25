import 'package:flutter/widgets.dart';

/// @auter Created by tyy on 2021/11/25
/// desc   :
/// version:
///
///


///tab 页面
class Page extends StatefulWidget {
  const Page({Key key, @required this.text}) : super(key: key);
  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "${widget.text}",
        textScaleFactor: 5,
      ),
    );
  }
}


class PageViewHome extends StatefulWidget {
  const PageViewHome({Key key}) : super(key: key);

  @override
  _PageViewHomeState createState() => _PageViewHomeState();
}

class _PageViewHomeState extends State<PageViewHome> {
  @override
  Widget build(BuildContext context) {
    var childern=<Widget>[];
    for(int i=0;i<6;i++){
      childern.add(Page(text: '$i'));
    }
    return PageView(children: childern,);
  }
}

