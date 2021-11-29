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
  var _color = Colors.black;
  var _position = 0;
  final List<String> _menuTitle = ['头条', '咨询', '短信', "供求",'期货'];
  final List<String> _menuTitleIcon = ['https://img2.baidu.com/it/u=3432174479,1450323813&fm=26&fmt=auto',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2F6e%2F25%2F98%2F6e25987277d05dae9643dcee6ec020ec.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640764418&t=f14f7a54c86a41ec076bb852fc04c199',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic_source%2Fc5%2Fdb%2Fa1%2Fc5dba1440ec61c8041cdfb16bbbc0de2.jpeg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640764418&t=341c192bad1927960234787c4a35dedb',
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2F78%2Fe0%2Fe4%2F78e0e4db3a3a679fc5647ae2ef4379c7.jpeg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640764418&t=8f6ab8758c691d32c574c46ab0dffab1",
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2Ffd%2Ff1%2Fda%2Ffdf1dacb8ff0b8f13ed29bcbee42f328.jpeg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640764418&t=3369e059377b0795831069671e89fa35'];
  var _titleArray = [
    "头条",
    "黑色金属",
    "镍铬不锈钢",
    "建筑材料",
    "有色金属",
    "农产品",
    "黑色金属",
    "能源化工"
  ];
  var _imgList = [
    'https://file02.16sucai.com/d/file/2014/0829/b871e1addf5f8e96f3b390ece2b2da0d.jpg',
    'https://file02.16sucai.com/d/file/2014/0829/b871e1addf5f8e96f3b390ece2b2da0d.jpg',
    'https://file02.16sucai.com/d/file/2014/0829/b871e1addf5f8e96f3b390ece2b2da0d.jpg',
    'https://file02.16sucai.com/d/file/2014/0829/b871e1addf5f8e96f3b390ece2b2da0d.jpg',
    'https://file02.16sucai.com/d/file/2014/0829/b871e1addf5f8e96f3b390ece2b2da0d.jpg'
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
          TitleList(list: _titleArray),
          SteelBanner(imgList: _imgList,),
          SizedBox(height: 5,),
          GridViewMenu(color: Colors.transparent,data: _menuTitle,icons: _menuTitleIcon,onItemClick: (inedex){
            showToast(_menuTitle[inedex]);
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
