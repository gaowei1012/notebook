import 'package:dio/dio.dart';

import 'package:notebook/local/local_storge.dart';
import 'package:notebook/common/net/config/config.dart';

class TokenInterceptors extends InterceptorsWrapper {
  String _token;

  @override
  onRequest(RequestOptions options) async {
    // token
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null){
        _token = authorizationCode;
      }
    }
    options.headers['Authorization'] = _token;
    return options;
  }

  @override
  onResponse(Response response) async {
    try {
      var result = response.data;
      if (result.statusCode == 201 && result['token'] != null ) {
        _token = 'token' + result['token'];
        await LocalStorage.save(Config.TOKEN_KEY, _token);
      }
    } catch(e) {
      print(e);
    }

    return response;
  }

  /// 退出登录
  clearToken() {
    this._token = null;
    LocalStorage.remove(Config.TOKEN_KEY);
  }

  /// 获取token
  getAuthorization() async {
    /// 从本地储存中拿到token
    String token = await LocalStorage.get(Config.TOKEN_KEY);
    /// 看本地是否有token
    if (token == null) {
      String basic = await LocalStorage.get(Config.USER_BASIC_CODE);
      if (basic == null) {
        // 提示输入账号密码
      } else {
        return 'basic $token';
      }
    } else {
      this._token = token;
      return token;
    }
  }
}