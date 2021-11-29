import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @auter Created by tyy on 2021/11/26
/// desc   : 指示器
/// version:
///
class IndicatorView extends StatelessWidget {
  const IndicatorView({Key key, @required this.num, @required this.select})
      : super(key: key);
  final int num;
  final int select;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _getIndicatorNum(num, select),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  int select = 0;

  MyPainter({this.select}) : super();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill

      ..invertColors = false;
    if (select == 0) {
      paint.color=Colors.white;
    } else {
      paint.color=Colors.white70;

    }
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 6, paint);
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

_getIndicatorNum(int num, int select) {
  var childern = <Widget>[];
  final double colorSize=15;
  for (int i = 0; i < num; i++) {
    if (i == select) {
      childern.add(CustomPaint(
        size: Size(colorSize, colorSize),
        painter: MyPainter(select: 1),
      ));
    } else {
      childern.add(CustomPaint(
        size: Size(colorSize, colorSize),
        painter: MyPainter(select: 0),
      ));
    }
  }
  return childern;
}

getIndicator(int num, int select) {
  return IndicatorView(
    num: num,
    select: select,
  );
}
