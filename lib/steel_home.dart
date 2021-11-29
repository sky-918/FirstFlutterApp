import 'package:first_flutter_app/app_string.dart';
import 'package:first_flutter_app/mybanner/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oktoast/oktoast.dart';


import 'mybanner/page.dart';
import 'steel_title_list.dart';
import 'steel_top_gridview.dart';

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
          // getSingleChildScrollView(),
          // getRefreshIndicator(),
          TitleList(list: AppString.titleArray),
          SteelBanner(imgList: AppString.imgList,),
          SizedBox(height: 5,),
          GridViewMenu(color: Colors.transparent,data:  AppString.menuTitle,icons:  AppString.menuTitleIcon,onItemClick: (inedex){
            showToast( AppString.menuTitle[inedex]);
          },),
        ],
      ),
    );
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
