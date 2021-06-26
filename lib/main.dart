import 'dart:async';
import 'dart:ui';

import 'package:first_flutter_app/layout.dart';
import 'package:first_flutter_app/window.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'animation.dart';
import 'event_notice.dart';

void collectLog(ZoneDelegate parent, Zone zone, String line) {
  //收集日志
  // print("收集的日志：$line");
  parent.print(zone, "Intercepted: $line");
}

void reportErrorAndLog(FlutterErrorDetails details) {
  //上报错误和日志逻辑
  print("上报错误：${details.toString()}");
}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
// 构建错误信息
  print("构建错误消息");
}

void main() {
  // runZoned(()=>runApp(MyApp()));
  runApp(MyApp());
  // runZoned(
  //   () => runApp(MyApp()),
  //   zoneSpecification: new ZoneSpecification(
  //       print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
  //     parent.print(zone, "Intercepted: $line");
  //   }),
  // );
}
// void main() {
//   FlutterError.onError = (FlutterErrorDetails details) {
//     reportErrorAndLog(details);
//   };
//   runZoned(
//     () => runApp(MyApp()),
//     zoneSpecification: ZoneSpecification(
//       print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
//         collectLog(parent, zone, line); // 收集日志
//       },
//     ),
//     onError: (Object obj, StackTrace stack) {
//       var details = makeDetails(obj, stack);
//       reportErrorAndLog(details);
//     },
//   );
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_page": (context) => NewRoute(),
        "old_home": (context) => MyHomePage(
              title: 'Flutter Demo Home Page',
            ),
        "/": (context) => CustomScrollViewTestRoute(),
        "tip": (context) {
          //这样让原来必须传值才能创建的页面，不需要进行传值。
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        },
        "counter": (context) {
          return CounterWidget();
        },
        "TapboxA": (context) {
          return TapboxA();
        },
        "ParentWidget": (context) {
          return ParentWidget();
        },
        "ParentWidgetC": (context) {
          return ParentWidgetC();
        },
        "BaseView": (context) {
          return BaseView();
        },
        "window_FocusTestRoute": (context) {
          return FocusTestRoute();
        },
        "RowPage": (context) {
          return RowPage();
        },
        "RowPage1": (context) {
          return CustomScrollViewTestRoute();
        },
        "ButtonStatelessWidget": (context) {
          return ButtonStatelessWidget();
        },
        "ScrollControllerTestRoute": (context) {
          return ScrollControllerTestRoute();
        },
        "ScrollNotificationTestRoute": (context) {
          return ScrollNotificationTestRoute();
        },
        'WillPopScopeTestRoute': (context) {
          return WillPopScopeTestRoute();
        },
        "InheritedWidgetTestRoute": (context) {
          return InheritedWidgetTestRoute();
        },
        'ProviderRoute': (context) {
          return ProviderRoute();
        },
        'ColorAndThem': (context) {
          return ColorAndThem();
        },
        'FuturePage': (context) {
          return FuturePage();
        },
        'PointerEvent1': (context) {
          return PointerEvent1();
        },
        'GestureDetectorTestRoute': (context) {
          return GestureDetectorTestRoute();
        },
        '_Drag': (context) {
          return Drag();
        },
        '_ScaleTestRoute': (context) {
          return ScaleTestRoute();
        },
        'GestureRecognizerTestRoute': (context) {
          return GestureRecognizerTestRoute();
        },
        "NotificationRoute": (context) {
          return NotificationRoute();
        },
        "ScaleAnimationRoute": (context) {
          return ScaleAnimationRoute();
        },
        "HeroAnimationRoute": (context) {
          return HeroAnimationRoute();
        },
        "StaggerRoute": (context) {
          return StaggerRoute();
        },
        "AnimatedSwitcherCounterRoute": (context) {
          return AnimatedSwitcherCounterRoute();
        },
        "AnimatedWidgetsTest": (context) {
          return AnimatedWidgetsTest();
        },
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      print("count值：$_counter");
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              onPressed: () {
                //跳转新的页面
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return NewRoute();
                // }));
                //通过注册路由名字进行跳转页面
                // Navigator.pushNamed(context, "new_page");
                Navigator.of(context)
                    .pushNamed("new_page", arguments: "hi,这是传值");
              },
              child: Text("Open new page"),
              textColor: Colors.blue,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("counter");
                },
                child: Text("生命周期1")),
            ElevatedButton(
              onPressed: () async {
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return TipRoute(
                      text: "我是提示页面",
                    );
                  }),
                );
                print("路由返回值：$result");
              },
              child: Text("打开提示页面", style: TextStyle(fontSize: 10.0)),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("TapboxA");
                },
                child: Text(
                  "测试Widget状态",
                  style: TextStyle(fontSize: 10.0),
                )),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("ParentWidget");
                },
                child:
                    Text("测试父管理子的Widget状态", style: TextStyle(fontSize: 10.0))),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("ParentWidgetC");
                },
                child:
                    Text("测试混合管理Widget状态", style: TextStyle(fontSize: 10.0))),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("BaseView");
              },
              child: Text("基础view", style: TextStyle(fontSize: 10.0)),
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("window_FocusTestRoute");
                },
                child: Text("TextField", style: TextStyle(fontSize: 10.0))),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("RowPage");
              },
              child: Text("布局学习", style: TextStyle(fontSize: 10.0)),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("RowPage1");
              },
              child: Text("CustomScrollViewTestRoute",
                  style: TextStyle(fontSize: 10.0)),
            ),
            RandomWordsWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    print("收到的值$args");
    return Scaffold(
      appBar: AppBar(
        title: Text("NewRoute"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    //初始化状态
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          //点击后计数器自增
          onPressed: () => setState(
            () => ++_counter,
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class TapboxA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TapboxAState();
  }
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightBlue[700] : Colors.green[600],
        ),
      ),
    );
  }
}

// ParentWidget 为 TapboxB 管理状态.

//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

//---------------------------- ParentWidget ----------------------------

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return new GestureDetector(
      onTapDown: _handleTapDown,
      // 处理按下事件
      onTapUp: _handleTapUp,
      // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}

class BaseView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImageStates();
  }
}

class ImageStates extends State {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  //定义一个controller
  TextEditingController _unameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return Scaffold(
      appBar: AppBar(
        title: Text("基础控件"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _unameController,
              autofocus: true,
              onChanged: (v) {
                print("onchange:$v ${_unameController.text} ");
              },
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.person)),
              obscureText: true,
            ),
            Image.asset(
              "images/ic_launcher.png",
              width: 100.0,
              fit: BoxFit.fitWidth,
            ),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
            ),
            Image(
              image: AssetImage("images/ic_launcher.png"),
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),
            Text(
              icons,
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green),
            ),
            Switch(
              value: _switchSelected, //当前状态
              onChanged: (value) {
                //重新构建页面
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
