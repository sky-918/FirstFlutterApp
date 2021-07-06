import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

class LocaleProvider extends ChangeNotifier {

  Locale get locale {
    final String locale = SpUtil.getString("locale") ?? '';
    switch(locale) {
      case 'zh':
        return const Locale('zh', 'CN');
      case 'en':
        return const Locale('en', 'US');
      default:
        return null;
    }
  }

  void setLocale(String locale) {
    SpUtil.putString("locale", locale);
    notifyListeners();
  }

}