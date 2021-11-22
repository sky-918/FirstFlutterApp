import 'package:flutter/cupertino.dart';

/// @auter Created by tyy on 2021/11/22
/// desc   :
/// version: 工具类
///
///
///输出[child]的位置信息
class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({
    Key key,
    @required this.child,
    this.tag,
  }) : super(key: key);
  final Widget child;
  final T tag;

  @override
  Widget build(BuildContext context) {
    ///注意！大前提是盒模型布局，如果是Sliver 布局，可以使用 SliverLayoutBuiler 来打印。
    return LayoutBuilder(builder: (_, constraints) {
      // assert在编译release版本时会被去除
      assert(() {
        print('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }
}
