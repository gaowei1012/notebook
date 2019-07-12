import 'package:flutter/material.dart';
import 'dart:async';

import 'package:notebook/pages/index_page.dart';
import 'package:notebook/pages/login/login_page.dart';

/// 导航
class NavgiatorUtils {
  /// 替换Navgiator.pushReplacementNamed()
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  /// 首页
  static getHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, IndexPage.sIndex);
  }

  // static getHome(BuildContext context) {
  //   Navigator.pushAndRemoveUntil(context, IndexPage.sIndex, (route) => route == null);
  // }

  /// 登录页
  static getLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, LoginPage.sLogin);
  }

  /// page页面容器
  static Widget pageContainer(widget) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: widget,
    );
  }

}