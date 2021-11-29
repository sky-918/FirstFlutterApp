import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'indicator.dart';

/// @auter Created by tyy on 2021/11/25
/// desc   ：展示图片的viewpage
/// version:

///tab 页面
class PageHome extends StatefulWidget {
  const PageHome({Key key, @required this.text}) : super(key: key);
  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<PageHome> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: ClipRRect(
        child: Image.network(
          widget.text,
          fit: BoxFit.fill,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  ///设置数据缓存
  @override
  bool get wantKeepAlive => true;
}
///显示banner和指示器
class SteelBanner extends StatefulWidget {
  const SteelBanner({Key key, this.imgList}) : super(key: key);
  final List<String> imgList;

  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<SteelBanner> {
  var select = 0;
  var _pageControl = PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: SizedBox(
          height: 100,
          child: getViewPage(widget.imgList),
        )),
        Positioned(
          top: 80,
            left: 0,
            right: 0,
            child: SizedBox(
                height: 20, child: getIndicator(widget.imgList.length, select)))
      ],
    );
  }

  getViewPage(List<String> imgPath) {
    var childern = <Widget>[];
    for (int i = 0; i < imgPath.length; i++) {
      childern.add(PageHome(text: imgPath[i]));
    }
    return PageView(
      children: childern,
      onPageChanged: _onPageChang,
      controller: _pageControl,
    );
  }

  _onPageChang(int index) {
    print("选择的哪一个：$index");
    select = index;
    setState(() {});
  }
}
