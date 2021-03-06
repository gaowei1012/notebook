import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:notebook/pages/login/forget_pasd_page.dart';
import 'package:notebook/pages/login/register_page.dart';
import 'package:notebook/pages/index_page.dart';

class LoginPage extends StatefulWidget {
  static final String sLogin = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  RegExp expUserName = new RegExp(
      r'^([\u4e00-\u9fa5]{2,4})|([A-Za-z0-9_]{4,16})|([a-zA-Z0-9_\u4e00-\u9fa5]{3,16})$;');
  RegExp expPassword = new RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,10}');

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '执念';
  String password = '*Gao129231wei*';
  String _name;
  String _password;

  /// 提示
  void showDialogIos() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('提示'),
            content: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Align(
                  child: new Text('用户名或密码错误'),
                  alignment: Alignment.center,
                ),
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: new Text('取消'),
                onPressed: () {
                  Navigator.pop(context);
                  print('取消');
                },
              ),
              CupertinoDialogAction(
                child: new Text('确定'),
                onPressed: () {
                  Navigator.pop(context);
                  print('确定');
                },
              )
            ],
          );
        });
  }

  void _formSubmitted() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();

      if (_name == username && _password == password) {
        // 登录成功，跳转到home页面
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => HomePage()));
        Navigator.pushAndRemoveUntil(
            context,
            new MaterialPageRoute(builder: (context) => new IndexPage()),
            (route) => route == null);
        print('---登录成功---');
      } else {
        print('登录失败');
        // 登录失败，封装一个弹窗，用于提示
        showDialogIos();
      }
      //print(_name);
      //print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('登录'),
        ),
        body: Container(
            padding: EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              autovalidate: false, // 自动对焦
              child: Column(
                children: <Widget>[
                  TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: '用户名',
                        hintText: '请输入用户名: [执念]',
                        //icon: Icon(CupertinoIcons.person)
                      ),
                      onSaved: (val) {
                        _name = val;
                      },
                      validator: (v) {
                        /// 用户名必须是字母、数字，不能以下划线开头或结尾
                        if (expUserName.hasMatch(v.trim())) {
                          // 匹配成功
                          return null;
                        } else {
                          return '用户名必须是字母或数字，不能以下划线开头或结尾';
                        }

                        ///return v.trim().length > 0 ? null : '用户名不存在';
                      }),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '请输入密码: [*Gao129231wei*]',
                      //icon: Icon(CupertinoIcons.padlock),
                    ),
                    obscureText: true,
                    validator: (v) {
                      if (expPassword.hasMatch(v.trim())) {
                        // 匹配成功
                        return null;
                      } else {
                        return '密码必须是字母数字必须大于八位，必须有一位是大写';
                      }
                      // return v.trim().length > 7 ? null : '密码不能少于8位';
                    },
                    onSaved: (val) {
                      _password = val;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 28.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            child: Text('登录'),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: _formSubmitted,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: ScreenUtil().setWidth(320.0),
                            child: InkWell(
                              child: Text(
                                '注册',
                                textAlign: TextAlign.left,
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                              },
                            )),
                        Container(
                            width: ScreenUtil().setWidth(320.0),
                            child: InkWell(
                              child: Text('忘记密码', textAlign: TextAlign.right),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ForgetPasdPage()));
                              },
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
