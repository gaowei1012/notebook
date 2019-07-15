import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './page/gliv_page.dart';
import './page/about_page.dart';
import '../login/login_page.dart';
import './page/feed_back_page.dart';
import './page/me_page.dart';
import './page/tabbar_page.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
// 弹出主题选择框
  void showDailogTip() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: new Text('更换主题😻'),
            content: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Align(
                  child: Column(
                    children: <Widget>[
                      // new Text('主题色1'),
                      // new Text('主题色2'),
                      // new Text('主题色3'),
                      new Container(
                        padding: EdgeInsets.all(10),
                        child: new Card(
                          child: new Text('主题色1'),
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.all(10),
                        child: new Card(
                          child: new Text('主题色2'),
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.all(10),
                        child: new Card(
                          child: new Text('主题色3'),
                        ),
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                )
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: new Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop(context);
                  print('取消');
                },
              ),
              CupertinoDialogAction(
                child: new Text('确定'),
                onPressed: () {
                  Navigator.of(context).pop(context);
                  print('确实');
                },
              )
            ],
          );
        });
  }

  // 退出功能
  void onExit() {
    // 提示用户是否退出
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: new Text('是否退出'),
            content: new Column(
              children: <Widget>[new Text('确认是否退出？')],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: new Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
              ),
              CupertinoDialogAction(
                child: new Text('确定'),
                onPressed: () {
                  /// 退出
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                  Navigator.pushAndRemoveUntil(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new LoginPage()),
                      (route) => route == null); /// 跳转并关闭当前页面
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: <Widget>[
          _topHeaderImg(),
          _orderTitle(context),
          _themeData(),
          _feedback(context),
          _about(context),
          _exitLogin(context),

          _topBar()
        ],
      ),
    );
  }

  Widget _topHeaderImg() {
    return Container(
      height: ScreenUtil().setHeight(320),
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(0),
      color: CupertinoColors.inactiveGray,
      child: Container(
        // child: Image.network(
        //   'https://gaomingwei.xyz/wp-content/uploads/2019/04/2.jpg',
        //   fit: BoxFit.cover,
        // ),
        child: new Image(
          image: new AssetImage("static/images/avatar.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _orderTitle(context) {
    return Container(
      // margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(Icons.settings),
        title: Text('设置'),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MePage()));
        },
      ),
    );
  }

  Widget _feedback(context) {
    return Container(
      // margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(Icons.feedback),
        title: Text('意见反馈'),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FeedbackPage()));
        },
      ),
    );
  }

  Widget _about(context) {
    return Container(
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(Icons.ac_unit),
        title: Text('关于'),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AboutPage()));
        },
      ),
    );
  }

  Widget _exitLogin(context) {
    return Container(
      // margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('退出登录'),
        trailing: Icon(Icons.arrow_right),
        onTap: onExit,
        //() {
        //  Navigator.of(context)
        //    .push(MaterialPageRoute(builder: (context) => LoginPage()));
        //},
      ),
    );
  }

  Widget _themeData() {
    return Container(
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(Icons.school),
        title: Text('更换主题色'),
        trailing: Icon(Icons.arrow_right),
        onTap: showDailogTip,
      ),
    );
  }

  Widget _topBar() {
    return Container(
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(Icons.games),
        title: Text('顶部导航'),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          /// 跳转到topbarpage页面
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ViewPage()));
        },
      ),
    );
  }
}
