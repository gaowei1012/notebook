import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './page/about_page.dart';
import '../login/login_page.dart';
import './page/feed_back_page.dart';
import './page/me_page.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

// 弹出选择框
  onTapOpenAlert() {
    showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('主题更换'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('data1'),
                Text('data1')
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    ).then((val) {
      print(val);
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
        child: Image.network(
          'https://gaomingwei.xyz/wp-content/uploads/2019/04/2.jpg',
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
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
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
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
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
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
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
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('退出登录'),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPage()));
        },
      ),
    );
  }

  Widget _themeData() {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: ListTile(
        leading: Icon(Icons.school),
        title: Text('更换主题色'),
        trailing: Icon(Icons.arrow_right),
        // onTap: onTapOpenAlert()
        // onLongPress: onTapOpenAlert(),
      ),
    );
  }
}
