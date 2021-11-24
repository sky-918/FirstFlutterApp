import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// @auter Created by tyy on 2021/11/18
/// desc   :我的钢铁首页作业
/// version:v1.0.0

class SteelHome extends StatefulWidget {
  @override
  _SteelHomeState createState() => _SteelHomeState();
}

class _SteelHomeState extends State<SteelHome> {
  var _color = Colors.black;
  var _position = 0;
  var _selectColor = Colors.amber;
  var titleArray = [
    "头条",
    "黑色金属",
    "镍铬不锈钢",
    "建筑材料",
    "有色金属",
    "农产品",
    "黑色金属",
    "能源化工"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '练习',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.amber,
        centerTitle: true,
        // toolbarHeight: 100,
      ),
      body: Column(
        children: [
          // getSingleChildScrollView(),
          // getRefreshIndicator(),
          getListView(),
        ],
      ),
    );
  }

  ///使用[SingleChildScrollView]实现可滑动的布局
  Widget getSingleChildScrollView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Row(
            // List.generate(titleArray.length, (index) => titleArray[index])
            children: titleArray
                .map(
                  (e) => GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0),
                      height: 40,
                      child: Align(
                        child: Text(
                          e,
                          style: TextStyle(color: _color),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    onTap: () => {
                      setState(() {
                        if (_color == Colors.black) {
                          print("点击事件");
                          _color = Colors.amber;
                        } else {
                          _color = Colors.black;
                        }
                      })
                    },
                  ),
                )
                .toList(),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  ///使用[ListView]实现
  Widget getListView() {
    return Container(
      height: 50,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // itemExtent: 50.0,
        //强制高度为50.0
        itemCount: titleArray.length,

        itemBuilder: (context, index) {
          return getItem(index);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 10,
          );
        },
      ),
    );
  }

  Widget getItem(int index) {
    return GestureDetector(
      child: getChildeView(index),
      onTap: () {
        print("点击理$index");
        _position = index;
        setState(() {});
      },
    );
  }

  Widget getChildeView(int index) {
    if (index == 0) {
      return Container(
        child: Text(
          titleArray[index],
          style: getTextStyle(index),
        ),
        padding: EdgeInsets.only(left: 10),
      );
    }
    if (index == titleArray.length - 1) {
      return Container(
        child: Text(
          titleArray[index],
          style: getTextStyle(index),
        ),
        padding: EdgeInsets.only(right: 10),
      );
    }
    return Container(
      child: Text(
        titleArray[index],
        style: getTextStyle(index),
      ),
    );
  }

  TextStyle getTextStyle(int index) {
    if (index == _position) {
      return TextStyle(color: _selectColor);
    } else {
      return TextStyle(color: Colors.blue);
    }
  }

  Widget getRefreshIndicator(Widget widget) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      //下拉刷新回调
      displacement: 40,
      //指示器显示时距顶部位置
      color: Colors.red,
      //指示器颜色，默认ThemeData.accentColor
      backgroundColor: Colors.blue,
      //指示器背景颜色，默认ThemeData.canvasColor
      notificationPredicate: defaultScrollNotificationPredicate,
      //是否应处理滚动通知的检查（是否通知下拉刷新动作）
      child: widget,
    );
  }

  Future<void> _onRefresh() {
    print("下拉刷新object");
  }

  Widget getParentView() {
    return ListView.separated(
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              break;
            case 1:
              break;
          }
        },
        separatorBuilder: (context, index) {},
        itemCount: 2);
  }
}
