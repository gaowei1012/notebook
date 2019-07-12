import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './home/Home_page.dart';
import './notebook/notebook_page.dart';
import './privacy/privacy_page.dart';
import './setting/setting_page.dart';

class IndexPage extends StatefulWidget {
  static final String sIndex = '/index';
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.info),
      title: Text('笔记')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.lab_flask),
      title: Text('私密')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.settings_solid),
      title: Text('我的')
    )
  ];

  final List<Widget> tabBodis = [
    HomePage(),
    NotebookPage(),
    PrivacyPage(),
    SettingPage()
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    // TODO: implement initState
    currentPage = tabBodis[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabs,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              currentPage = tabBodis[index];
            });
          },
        ),
        body: IndexedStack(
          index: currentIndex,
          children: tabBodis,
        ),
      ),
    );
  }
}