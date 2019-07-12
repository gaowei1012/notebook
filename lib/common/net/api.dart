import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:collection';

import 'package:notebook/common/net/interceptor/token_Interceptor.dart';


/// 封装请求方法
class HttpManager {

  static const CONTENT_TYPE_JSON = 'application/json';
  static const CONTENT_TYPE_FROM = 'application/x-www-form-urlencoded';

  Dio _dio = new Dio();

  final TokenInterceptors _tokenInterceptors = new TokenInterceptors();
  
  /// 拦截器
  HttpManager() {

    _dio.interceptors.add(_tokenInterceptors);
  }

  /// 发起网络请求
  netFetch(url, parmas, Map<String, dynamic> header, Options option) async {
    Map<String, dynamic> headers = new HashMap();
    /// 添加请求头
    if (header != null) {
      headers.addAll(header);
    }
    if(option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: 'GET');
      option.headers = headers; 
    }

    Response response;
    try {
      response = await _dio.request(url, data: parmas, options: option);
    } catch(e) {
      print(e);
    }
    return response.data;
  }

/// 获取token
  getAuthorization() async {
    return _tokenInterceptors.getAuthorization();
  }

  /// 清除登录信息
  clearAuthorization() async {
    return true;
  }
}

final HttpManager httpManager = new HttpManager();