import 'dart:async';
import 'dart:convert';
import 'package:notebook/common/net/api.dart';
import 'package:notebook/local/local_storge.dart';
import 'package:notebook/common/net/config/config.dart';
import 'package:notebook/model/User.dart';
import 'package:redux/redux.dart';


class UserDao {
  static login(username, password) async {
    // TODO
    String type = username + ":" + password;
    var bytes = utf8.encode(type);
    var base64Str = base64.encode(bytes);
    if(Config.DEBUG) {
      print('base64Str login' + base64Str);
    }

    await LocalStorage.save(Config.USER_BASIC_CODE, username);
    await LocalStorage.save(Config.USER_NAME_KEY, base64Str);

    Map requestParams = {
      'scopes': ['user', 'repo', 'git', 'notifcation'],
      'note': 'admin_script'
    };
    httpManager.clearAuthorization();
    
    return true;
  }

  static initUserInfo(Store store) async {
    /// TODO
    var token = LocalStorage.get(Config.TOKEN_KEY);
    var res = await getUserInfoLocal();
    if(res != null && res.result && token != null) {
      /// store.dispatch(UpdateUserAction(res.data));
      return true;
    }
  }

/// 获取本地登录用户信息
  static getUserInfoLocal() async {
    // var userToken = await LocalStorage.get(Config.USER_BASIC_CODE);
    // if(userToken != null) {
    //   var userMap = json.decode(userToken);
    //   User user = User.fromJson(userMap);
    //   return new DataResult(user, true);
    // }
    return true;
  }

  /// 获取用户详细信息
  static getUserInfo(userName, {needDb = false}) async {
    /// TODO
    return true;
  }
}
