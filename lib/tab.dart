import 'package:first_flutter_app/bottom_tab_bar_item.dart';
import 'package:flutter/material.dart';

import 'custom_view.dart';
import 'http_u.dart';
import 'bottom_tab_bar_main.dart';
class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
// 可以理解为视图
  List _pageList=[
    HttpTestRoute(),
    CustomPaintRoute(),
    TurnBoxRoute(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter Demo',),
      ),
      body:this._pageList[this._currentIndex],
      bottomNavigationBar: BottomTabBar(
        currentIndex: this._currentIndex,
        // 点击效果
        onTap: (int index){
          setState(() {
            this._currentIndex = index;
          });
          print(index);
        },
        //  相当于设置tabbaritem
        items: [
          BottomTabBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
            badge: Container(
              margin: EdgeInsetsDirectional.zero,
              width: 24,
              padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                '99+',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
            backgroundColor: Colors.teal

          ),

          BottomTabBarItem(
            icon: Icon(Icons.category),
            title: Text('分类'),
          ),

          BottomTabBarItem(
            icon: Icon(Icons.settings),
            title: Text('设置'),
          ),
        ],
      ),
    );
  }
}



class Tabs1 extends StatefulWidget {
  Tabs1({Key key}) : super(key: key);

  @override
  _TabsState1 createState() => _TabsState1();
}

class _TabsState1 extends State<Tabs1> {
  int _currentIndex = 0;
// 可以理解为视图
  List _pageList=[
    HttpTestRoute(),
    CustomPaintRoute(),
    TurnBoxRoute(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter Demo',),
      ),
      body:this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        // 点击效果
        onTap: (int index){
          setState(() {
            this._currentIndex = index;
          });
          print(index);
        },
        //  相当于设置tabbaritem
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页'),

              backgroundColor: Colors.teal

          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('分类'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('设置'),
          ),
        ],
      ),
    );
  }
}