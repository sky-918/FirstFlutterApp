import 'dart:convert';

import 'package:first_flutter_app/mybanner/page.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../app_string.dart';
import 'steel_top_gridview.dart';

/// @auter Created by tyy on 2021/11/29
/// desc   :
/// version:
///
class SteelHomeTop extends StatefulWidget {
  const SteelHomeTop({Key key}) : super(key: key);

  @override
  _SteelHomeTopState createState() => _SteelHomeTopState();
}

class _SteelHomeTopState extends State<SteelHomeTop> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SteelBanner(
          imgList: AppString.imgList,
        ),
        SizedBox(
          height: 5,
        ),
        GridViewMenu(
          color: Colors.transparent,
          data: AppString.menuTitle,
          icons: AppString.menuTitleIcon,
          onItemClick: (inedex) {
            showToast(AppString.menuTitle[inedex]);
          },
        ),
        Container(
          height: 10,
          color: Colors.black12,
        )
      ],
    );
  }
}
