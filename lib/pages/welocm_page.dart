import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notebook/common/redux/ntb_state.dart';
import 'package:notebook/common/dao/user_dao.dart';
import 'package:notebook/utils/navgiator_utils.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:redux/redux.dart';

/// 启动页面
class WelcomePage extends StatefulWidget {

  static final String sName = '/';
  
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  bool hadInit = false;
  String username = "123";
  String password = "1234";

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(hadInit) {
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
      if (username != password) {
        NavgiatorUtils.getHome(context);
      } else {
        NavgiatorUtils.getLogin(context);
      }
      return true;
    });
  }

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
                  child: new FlareActor("static/file/flare_flutter_logo_.flr",
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