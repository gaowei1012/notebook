import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:notebook/pages/login/login_page.dart';

class ForgetPasdPage extends StatefulWidget {
  @override
  _ForgetPasdPageState createState() => _ForgetPasdPageState();
}

class _ForgetPasdPageState extends State<ForgetPasdPage> {
  //
  RegExp expUserName = new RegExp(
      r'^([\u4e00-\u9fa5]{2,4})|([A-Za-z0-9_]{4,16})|([a-zA-Z0-9_\u4e00-\u9fa5]{3,16})$;');
  RegExp expPassword = new RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,10}');

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _password;
  String _nextPassword;

  void showDailogTip() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: new Text('提示'),
            content: new Text('密码修改成功'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: new Text('确定'),
                onPressed: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => LoginPage()));
                  Navigator.pushAndRemoveUntil(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new LoginPage()),
                      (route) => route == null);
                },
              )
            ],
          );
        });
  }

  void _formSubmitted() {
    var _form = _formKey.currentState;

    // 这里判断两次密码是否一样
    //if(_password != _nextPassword) {
    //  AlertDialog(
    //     title: Text('两次输入的密码不一致'),
    //   );
    //}

    // 重置密码操作
    if (_form.validate()) {
      _form.save();

      // if (_password != _nextPassword) {
      //   AlertDialog(
      //     title: Text('两次输入的密码不一致'),
      //   );
      // }
      // print(_name);
      // print(_password);
      // print(_nextPassword);
      showDailogTip();
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));

    }
  }

  /// 校验用户名
  _validatorUsername(dynamic v) {}

  /// 校验密码
  _validatorPassword(v) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('忘记密码'),
      ),
      body: Container(
          padding: EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: '请输入您的用户名'),
                  onSaved: (val) {
                    _name = val;
                  },
                  validator: (v) {
                    if (expUserName.hasMatch(v.trim())) {
                      return null;
                    } else {
                      return '用户名必须是字母或数字，不能以下划线开头或结尾';
                    }
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: '请输入您的密码'),
                  onSaved: (val) {
                    _password = val;
                  },
                  validator: (v) {
                    if (expPassword.hasMatch(v.trim())) {
                      return null;
                    } else {
                      return '密码必须是字母数字必须大于八位，必须有一位是大写';
                    }
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: '请再次输入您的密码'),
                  onSaved: (val) {
                    _nextPassword = val;
                  },
                  validator: (v) {
                    if (expPassword.hasMatch(v.trim())) {
                      return null;
                    } else {
                      return '密码必须是字母数字必须大于八位，必须有一位是大写';
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text('提交'),
                          color: Theme.of(context).primaryColor,
                          // color: Colors.black12,
                          textColor: Colors.white,
                          onPressed: _formSubmitted,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
