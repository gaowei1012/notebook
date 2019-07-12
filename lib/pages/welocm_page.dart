import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notebook/common/redux/ntb_state.dart';
import 'package:notebook/common/dao/user_dao.dart';
import 'package:notebook/utils/navgiator_utils.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:redux/redux.dart';
import 'package:notebook/pages/index_page.dart';
import 'package:notebook/pages/login/login_page.dart';

/// 启动页面
class WelcomePage extends StatefulWidget {
  static final String sName = '/';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;
  String username = "执念";
  String password = "Gao129231wei";
  String _username = '执念';
  String _password = '*Gao129231wei*';

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    // Store<NTState> store = StoreProvider.of(context);
    // new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
    //   UserDao.initUserInfo(store).then((res) {
    //     if(res != null && res.result) {
    //       NavgiatorUtils.getHome(context); // 条涨到home页面
    //     } else {
    //       NavgiatorUtils.getLogin(context); // 登录
    //     }
    //     return true;
    //   });
    // });
    /// 防止跳转
    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      if(username != password) { // true
        Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context) => new IndexPage()), (route) => route == null);
      } else {
        Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context) => new LoginPage()), (route) => route == null);
      }
      return true;
    });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // 当应用启动，首先看当前用户是否登录(toekn)，如果登录了，则直接跳转到indexPage页，没有则需要登录
  //   if (username == _username && password == _password) {
  //     // 登录成功
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         new MaterialPageRoute(builder: (context) => new IndexPage()),
  //         (route) => route == null);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<NTState>(
      builder: (context, store) {
        return new Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Stack(
            children: <Widget>[
              new Center(
                child: new Image(
                  image: new AssetImage("static/images/welcome.png"),
                ),
              ),
              new Align(
                alignment: Alignment.bottomCenter,
                child: new Container(
                  width: 200,
                  height: 200,
                  child: new FlareActor(
                    "static/file/flare_flutter_logo_.flr",
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fill,
                    animation: "Placeholder",
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('welcome'),
    //   ),
    //   body: Container(
    //     child: Text('欢迎访问'),
    //   ),
    // );
  }
}
