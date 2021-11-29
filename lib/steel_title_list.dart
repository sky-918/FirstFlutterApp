import 'package:flutter/material.dart';

/// @auter Created by tyy on 2021/11/29
/// desc   :
/// version:
///
///

class TitleList extends StatefulWidget {
  const TitleList({Key key, this.list}) : super(key: key);
  final List<String> list;

  @override
  _TitleListState createState() => _TitleListState();
}

class _TitleListState extends State<TitleList> {
  var _position = 0;

  @override
  Widget build(BuildContext context) {
    return getListView(widget.list);
  }

  ///使用[ListView]实现
  Widget getListView(List<String> list) {
    return Container(
      height: 30,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // itemExtent: 50.0,
        //强制高度为50.0
        itemCount: list.length,

        itemBuilder: (context, index) {
          return getItem(list, index);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 10,
          );
        },
      ),
    );
  }

  Widget getItem(List<String> list, int index) {
    return GestureDetector(
      child: getChildeView(list, index),
      onTap: () {
        print("点击理$index");
        _position = index;
        //刷新布局的回调
        setState(() {

        });
      },
    );
  }

  Widget getChildeView(List<String> list, int index) {
    if (index == 0) {
      return Container(
        child: Text(
          list[index],
          style: getTextStyle(index),
        ),
        padding: EdgeInsets.only(left: 10),
      );
    }
    if (index == list.length - 1) {
      return Container(
        child: Text(
          list[index],
          style: getTextStyle(index),
        ),
        padding: EdgeInsets.only(right: 10),
      );
    }
    return Container(
      child: Text(
        list[index],
        style: getTextStyle(index),
      ),
    );
  }

  TextStyle getTextStyle(int index) {
    var _selectColor = Colors.amber;
    if (index == _position) {
      return TextStyle(color: _selectColor);
    } else {
      return TextStyle(color: Colors.blue);
    }
  }
}
