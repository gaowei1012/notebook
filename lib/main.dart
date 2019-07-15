import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:notebook/pages/login/login_page.dart';
import 'package:notebook/pages/welocm_page.dart';
import 'package:redux/redux.dart';
import 'package:notebook/model/User.dart';
import 'package:notebook/common/redux/ntb_state.dart';
import 'package:notebook/pages/index_page.dart';
import 'package:notebook/utils/navgiator_utils.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  MyApp() {
    _jpushServce();

  }

  final GlobalKey navgiatorKey = GlobalKey(); 

  // 创建 store
  final store = new Store<NTState>(
    appReducer,
    initialState: NTState(userInfo: User.empty())
  );

  /// 极光推送
  void _jpushServce() {
    final JPush jpush = new JPush();

    /// 配置 appkey chanel 
    jpush.setup(
      appKey: '',
      channel: '',
      production: false,
      debug: true
    );

    /// 申请推送权限
    jpush.applyPushAuthority(new NotificationSettingsIOS(
      sound: true,
      alert: true,
      badge: true
    ));
  }

  

  @override
  Widget build(BuildContext context) {

    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        theme: store.state.themeData,
        title: 'notebook',
        navigatorKey: navgiatorKey,
        routes: {
          /// 在这里做登录路由跳转
          WelcomePage.sName: (context) {// ==> '/'
            return new WelcomePage();
            // return new NotebookLocalization(
            //   child: NavgiatorUtils.pageContainer(new WelcomePage()),
            // );
          },
          IndexPage.sIndex: (context) {// ==> 'index'
            return new NotebookLocalization(
              child: NavgiatorUtils.pageContainer(new IndexPage()),
            );
          },
          LoginPage.sLogin: (context) {// ==> 'login'
            return new NotebookLocalization(
              child: NavgiatorUtils.pageContainer(new LoginPage()),
            );
          }
        },
        // home: IndexPage(),
      ),
    );
  }
}

class NotebookLocalization extends StatefulWidget {

  final Widget child;

  const NotebookLocalization({Key key, this.child}) : super(key: key);

  @override
  _NotebookLocalizationState createState() => _NotebookLocalizationState();
}

class _NotebookLocalizationState extends State<NotebookLocalization> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<NTState>(builder: (context, store) {
      return new Localizations.override(
        context: context,
        //locale: store.state.locale,
        locale: null,
        child: widget.child,
      );
    },);
  }
}