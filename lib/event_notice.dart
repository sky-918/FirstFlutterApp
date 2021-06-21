import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///事件处理与通知

class PointerEvent1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PointerEvent();
  }
}

class _PointerEvent extends State<PointerEvent1> {
  @override
  Widget build(BuildContext context) {
    //定义一个状态，保存当前指针位置
    String _event;
    return Scaffold(
      appBar: AppBar(
        title: Text("事件处理与通知"),
      ),
      body: Column(
        children: <Widget>[
          Listener(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 300.0,
              height: 150.0,
              child: Text(_event?.toString() ?? "",
                  style: TextStyle(color: Colors.black)),
            ),
            onPointerDown: (PointerDownEvent event) =>
                setState(() =>
                {
                  _event = event.toString(),
                  print("hahahahah" + event.toString())
                }),
            onPointerMove: (PointerMoveEvent event) =>
                setState(() => _event = event.toString()),
            onPointerUp: (PointerUpEvent event) =>
                setState(() => _event = event.toString()),
          ),
          Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                child: Center(child: Text("Box A")),
              ),
              // behavior: HitTestBehavior.opaque,
              onPointerDown: (event) => print("down A")),
          Stack(
            children: <Widget>[
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blue)),
                ),
                onPointerDown: (event) => print("down0"),
              ),
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                  child: Center(
                      child: Text(
                        "左上角200*100范围内非文本区域点击",
                        style: TextStyle(backgroundColor: Colors.teal),
                      )),
                ),
                onPointerDown: (event) => print("down1"),
                behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
              )
            ],
          ),
          Text("hahahah" + _event.toString()),
          Listener(
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 100.0,
                ),
                onPointerDown: (event) => print("in"),
              ),
            ),
            onPointerDown: (event) => print("up"),
          )
        ],
      ),
    );
  }
}

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() =>
      new _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势识别'),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(
              _operation,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => updateText("Tap"), //点击
          onDoubleTap: () => updateText("DoubleTap"), //双击
          onLongPress: () => updateText("LongPress"), //长按
        ),
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

class Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拖动'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //手指按下时会触发此回调
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
              },
              //手指滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails e) {
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              //垂直和水平滑动
              // onVerticalDragUpdate: ,
              // onHorizontalDragUpdate: ,
              onPanEnd: (DragEndDetails e) {
                //打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _ScaleTestRouteState extends State<ScaleTestRoute> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('缩放'),
        ),
        body: Center(
          child: GestureDetector(
            //指定宽度，高度自适应
            child: Image.asset("./images/ic_launcher.png", width: _width),
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                //缩放倍数在0.8到10倍之间
                _width = 200 * details.scale.clamp(.8, 10.0);
              });
            },
          ),
        ));
  }
}

class ScaleTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaleTestRouteState();
  }
}

class _GestureRecognizerTestRouteState
    extends State<GestureRecognizerTestRoute> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('拖动'),
        ),
        body: Center(
          child:
          Text.rich(
              TextSpan(
                  children: [
                    TextSpan(text: "你好世界"),
                    TextSpan(
                      text: "点我变色",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: _toggle ? Colors.blue : Colors.red
                      ),
                      recognizer: _tapGestureRecognizer
                        ..onTap = () {
                          setState(() {
                            _toggle = !_toggle;
                          });
                        },
                    ),
                    TextSpan(text: "你好世界"),
                  ]
              )
          ),
        ));
  }
}

class GestureRecognizerTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureRecognizerTestRouteState();
  }
}

