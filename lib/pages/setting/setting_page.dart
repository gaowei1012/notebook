import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
          _feedback(context),
          _about(context),
          _exitLogin(context)
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
      )
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
}

/*
class SettingPage extends StatelessWidget {

  var str = 'https://gaomingwei.xyz/wp-content/uploads/2019/04/2.jpg';

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
          _feedback(context),
          _about(context),
          _exitLogin(context)
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
          'https://gaomingwei.xyz/wp-content/uploads/2019/04/caspar-camille-rubin-224229-unsplash.jpg',
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
      )
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
}
*/