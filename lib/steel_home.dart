import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'app_string.dart';
import 'bean/aritical_bean.dart';
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
  List<Result> beanList = [];
  ValueNotifier _valueNotifier;
  int page = 1;

  @override
  void initState() {
    super.initState();
    print("sdasdasd");
    _valueNotifier = ValueNotifier(this.beanList);
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
            getRefreshIndicator(getValueListenableBuilder())
          ],
        ),
      ),
    );
  }

  Widget getRefreshIndicator(Widget widget) {
    return RefreshIndicator(
      onRefresh: () async {
        page = 1;
        getHttp();
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

  getParentView(List<Result> beanList) {
    if (beanList.isEmpty) {
      print("sdasdasd");
      getHttp();
    }
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
                color: Colors.black12,
              );
            }
          },
          itemCount: beanList.length + 1),
    );
  }

  getHttp() async {

    var response = await Dio()
        .get("https://api.apiopen.top/getWangYiNews?page=$page&count=10");
    AriticalBean baseBeanEntity = AriticalBean.fromJson(response.data);
    int code = baseBeanEntity.code;
    print("121212=$code");
    if (code == 200) {
      // Loading.hideLoading(context);
      beanList = baseBeanEntity.result;
      _valueNotifier.value=beanList;
      // setState(() {
      //   beanList = baseBeanEntity.result;
      // });
    }
  }



  getValueListenableBuilder(){
    return ValueListenableBuilder(valueListenable: _valueNotifier, builder: (context,value,child){
      print("sssssssssss");
      return  getParentView(value);
    });
  }
}
