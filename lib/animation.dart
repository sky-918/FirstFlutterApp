import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset("./images/ic_launcher.png",
          width: animation.value, height: animation.value),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value, width: animation.value, child: child);
          },
          child: child),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      //动画状态进行监听
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: Column(
        children: <Widget>[
          // AnimatedImage(animation: animation,),

          AnimatedBuilder(
            animation: animation,
            child: Image.asset("./images/ic_launcher.png"),
            builder: (BuildContext ctx, Widget child) {
              return new Center(
                child: Container(
                  height: animation.value,
                  width: animation.value,
                  child: child,
                ),
              );
            },
          ),
          GrowTransition(
            child: Image.asset("./images/ic_launcher.png"),
            animation: animation,
          )
        ],
      ),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}

// 路由A  Hero动画
class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hero动画'),
        ),
        body: Column(children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: InkWell(
              child: Hero(
                tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
                child: ClipOval(
                  child: Image.asset(
                    "./images/ic_launcher.png",
                    width: 50.0,
                  ),
                ),
              ),
              onTap: () {
                //打开B路由
                Navigator.push(context, PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                  return new FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text("原图"),
                      ),
                      body: HeroAnimationRouteB(),
                    ),
                  );
                }));
              },
            ),
          )
        ]));
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset("./images/ic_launcher.png"),
      ),
    );
  }
}

///交织动画
class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller}) : super(key: key) {
    //高度动画
    height = Tween<double>(
      begin: .0,
      end: 300.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: .0),
      end: EdgeInsets.only(left: 100.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 1.0, //间隔，后40%的动画时间
          curve: Curves.ease,
        ),
      ),
    );
  }

  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class StaggerRoute extends StatefulWidget {
  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  Future<Null> _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('交织动画'),
        ),
        body: Column(children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _playAnimation();
            },
            child: Center(
              child: Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                //调用我们定义的交织动画Widget
                child: StaggerAnimation(controller: _controller),
              ),
            ),
          )
        ]));
  }
}
// return Scaffold(
// appBar: AppBar(
// title: Text('交织动画'),
// ),
// body: Column(children: <Widget>[])
// );

// 通用“动画切换”组件（AnimatedSwitcher）
class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;
  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('动画切换'),
        ),
        body: Column(children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    //执行缩放动画
                    // return ScaleTransition(child: child, scale: animation);
                    //右进左出动画
                    var tween =
                        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                    // return MySlideTransition(
                    //   child: child,
                    //   position: tween.animate(animation),
                    // );
                    return SlideTransitionX(
                      child: child,
                      direction: AxisDirection.down,
                      position: animation,
                    );
                  },
                  child: Text(
                    '$_count',
                    //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                    key: ValueKey<int>(_count),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                RaisedButton(
                  child: const Text(
                    '+1',
                  ),
                  onPressed: () {
                    setState(() {
                      _count += 1;
                    });
                  },
                ),
                AnimatedDecoratedBox1(
                  duration: duration,
                  decoration: BoxDecoration(color: _decorationColor),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _decorationColor = Colors.red;
                      });
                    },
                    child: Text(
                      "AnimatedDecoratedBox",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                AnimatedDecoratedBox(
                  duration: duration,
                  decoration: BoxDecoration(color: _decorationColor),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _decorationColor = Colors.red;
                      });
                    },
                    child: Text(
                      "AnimatedDecoratedBox",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                AnimatedDecoratedBox(
                  duration: Duration(
                      milliseconds:
                          _decorationColor == Colors.red ? 400 : 2000),
                  decoration: BoxDecoration(color: _decorationColor),
                  child: Builder(builder: (context) {
                    return FlatButton(
                      onPressed: () {
                        setState(() {
                          _decorationColor = _decorationColor == Colors.blue
                              ? Colors.red
                              : Colors.blue;
                        });
                      },
                      child: Text(
                        "AnimatedDecoratedBox toggle",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }),
                )
              ],
            ),
          )
        ]));
  }
}

class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position);

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    //动画反向执行时，调整x偏移，实现“从左边滑出隐藏”
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

//不同方向的过渡动画
class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX({
    Key key,
    @required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position) {
    // 偏移在内部处理
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }

  Animation<double> get position => listenable;

  final bool transformHitTests;

  final Widget child;

  //退场（出）方向
  final AxisDirection direction;

  Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

//过渡组件的动画

class AnimatedDecoratedBox1 extends StatefulWidget {
  AnimatedDecoratedBox1({
    Key key,
    @required this.decoration,
    this.child,
    this.curve = Curves.linear,
    @required this.duration,
    this.reverseDuration,
  });

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;

  @override
  _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
}

class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1>
    with SingleTickerProviderStateMixin {
  @protected
  AnimationController get controller => _controller;
  AnimationController _controller;

  Animation<double> get animation => _animation;
  Animation<double> _animation;

  DecorationTween _tween;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: _tween.animate(_animation).value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  void _updateCurve() {
    if (widget.curve != null)
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    else
      _animation = _controller;
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve) _updateCurve();
    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;
    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween
        ..begin = _tween.evaluate(_animation)
        ..end = widget.decoration;
      _controller
        ..value = 0.0
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//过渡组件优化
class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear, //动画曲线
    @required Duration duration, // 正向动画执行时长
    Duration reverseDuration, // 反向动画执行时长
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );
  final BoxDecoration decoration;
  final Widget child;

  @override
  _AnimatedDecoratedBoxState createState() {
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _decoration; //定义一个Tween

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    // 在需要更新Tween时，基类会调用此方法
    _decoration = visitor(_decoration, widget.decoration,
        (value) => DecorationTween(begin: value));
  }
}

//预设动画
class AnimatedWidgetsTest extends StatefulWidget {
  @override
  _AnimatedWidgetsTestState createState() => _AnimatedWidgetsTestState();
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 5);
    return Scaffold(
        appBar: AppBar(
          title: Text('预置动画组建'),
        ),
        body: Column(children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _padding = 20;
                    });
                  },
                  child: AnimatedPadding(
                    duration: duration,
                    padding: EdgeInsets.all(_padding),
                    child: Text("AnimatedPadding"),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: duration,
                        left: _left,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              _left = 100;
                            });
                          },
                          child: Text("AnimatedPositioned"),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  color: Colors.grey,
                  child: AnimatedAlign(
                    duration: duration,
                    alignment: _align,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _align = Alignment.center;
                        });
                      },
                      child: Text("AnimatedAlign"),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: duration,
                  height: _height,
                  color: _color,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _height = 150;
                        _color = Colors.blue;
                      });
                    },
                    child: Text(
                      "AnimatedContainer",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                AnimatedDefaultTextStyle(
                  child: GestureDetector(
                    child: Text("hello world"),
                    onTap: () {
                      setState(() {
                        _style = TextStyle(
                          color: Colors.blue,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationColor: Colors.blue,
                        );
                      });
                    },
                  ),
                  style: _style,
                  duration: duration,
                ),
                AnimatedDecoratedBox(
                  duration: duration,
                  decoration: BoxDecoration(color: _decorationColor),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _decorationColor = Colors.red;
                      });
                    },
                    child: Text(
                      "AnimatedDecoratedBox",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ].map((e) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: e,
                );
              }).toList(),
            ),
          )
        ]));
  }
}
