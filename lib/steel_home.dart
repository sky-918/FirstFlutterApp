import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'app_string.dart';
import 'infobean_entity.dart';
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
  List<InfobeanLinks> beanList = [];

  @override
  void initState() {
    super.initState();
    beanList = getInfoList();
  }

  List<InfobeanLinks> getInfoList() {
    List<InfobeanLinks> beanList = [];
    InfobeanLinks infobeanEntity = InfobeanLinks();
    infobeanEntity.xSource = '论语摘抄网';
    infobeanEntity.img = "";
    infobeanEntity.title = AppString.infoTitleList[2];
    beanList.add(infobeanEntity);
    for (int i = 0; i < 5; i++) {
      InfobeanLinks infobeanEntity = InfobeanLinks();
      infobeanEntity.xSource = '论语摘抄网';
      infobeanEntity.img = AppString.menuTitleIcon[i];
      infobeanEntity.title = AppString.infoTitleList[i];
      beanList.add(infobeanEntity);
    }
    InfobeanLinks infobeanEntity1 = InfobeanLinks();
    infobeanEntity1.xSource = '论语摘抄网';
    infobeanEntity1.img = "";
    infobeanEntity1.title = AppString.infoTitleList[3];
    beanList.add(infobeanEntity);
    return beanList;
  }

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
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TitleList(list: AppString.titleArray),
            getRefreshIndicator(getParentView())
          ],
        ),
      ),
    );
  }

  Widget getRefreshIndicator(Widget widget) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future<void>.delayed(const Duration(seconds: 2));
        setState(() {
          beanList.addAll(getInfoList());
        });
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
      //Material设计规范中状态栏、导航栏、ListTile高度分别为24、56、56
      height: MediaQuery.of(context).size.height - 24 - 56 - 50,
      child: ListView.separated(
          itemBuilder: (context, index) {
            if (index == 0) {
              return SteelHomeTop();
            } else {
              return ItemSteelHomeArticle(infobeanLinks: beanList[index - 1]);
            }
          },
          separatorBuilder: (context, index) {
            if (index == 0) {
              return Divider(
                height: 1,
                color: Colors.transparent,
              );
            } else {
              return Divider(
                height: 1,
                color:  Colors.black12,
              );
            }
          },
          itemCount: beanList.length + 1),
    );
  }
}
