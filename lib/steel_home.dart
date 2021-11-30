import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oktoast/oktoast.dart';

import 'app_string.dart';
import 'steel_home_item.dart';
import 'steelhometop/steel_home_top.dart';
import 'steelhometop/steel_title_list.dart';

/// @auter Created by tyy on 2021/11/18
/// desc   :我的钢铁首页作业
/// version:v1.0.0

class SteelHome extends StatefulWidget {
  @override
  _SteelHomeState createState() => _SteelHomeState();
}

class _SteelHomeState extends State<SteelHome> {
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
          TitleList(list: AppString.titleArray),
          getRefreshIndicator(getParentView())
        ],
      ),
    );
  }

  Widget getRefreshIndicator(Widget widget) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future<void>.delayed(const Duration(seconds: 2));
        setState(()=>showToast("数据刷新"));
      },
      //下拉刷新回调
      displacement: 40,
      //指示器显示时距顶部位置
      color: Colors.amber,
      //指示器颜色，默认ThemeData.accentColor
      backgroundColor: Colors.white70,
      //指示器背景颜色，默认ThemeData.canvasColor
      notificationPredicate: defaultScrollNotificationPredicate,
      //是否应处理滚动通知的检查（是否通知下拉刷新动作）
      child: widget,
    );
  }

  getParentView() {
    return SizedBox(
      height: 500,
      child: ListView.separated(
          itemBuilder: (context, index) {
            if (index == 0) {
              return SteelHomeTop();
            } else {
              return ItemSteelHomeArticle();
            }
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.transparent,
            );
          },
          itemCount: 4),
    );
  }
}
