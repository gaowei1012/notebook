import 'package:flutter/material.dart';

import 'package:notebook/pages/login/login_page.dart';

class ForgetPasdPage extends StatefulWidget {
  @override
  _ForgetPasdPageState createState() => _ForgetPasdPageState();
}

class _ForgetPasdPageState extends State<ForgetPasdPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _password;
  String _nextPassword;

  void _formSubmitted() {
    var _form = _formKey.currentState;

    // 这里判断两次密码是否一样
    //if(_password != _nextPassword) {
    //  AlertDialog(
    //     title: Text('两次输入的密码不一致'),
    //   );
    //}

  // 重置密码操作
    if(_form.validate()) {
      _form.save();

      // if (_password != _nextPassword) {
      //   AlertDialog(
      //     title: Text('两次输入的密码不一致'),
      //   );
      // }
      // print(_name);
      // print(_password);
      // print(_nextPassword);

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));

    }
  }


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
                decoration: InputDecoration(
                  hintText: '请输入您的用户名'
                ),
                onSaved: (val) {
                  _name = val;
                },
                validator: (v) {
                  return v.trim().length > 0 ? null : '用户名不存在';
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '请输入您的密码'
                ),
                onSaved: (val) {
                  _password = val;
                },
                validator: (v) {
                  return v.trim().length > 8 ? null : '密码必须大于8个字符';
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '请再次输入您的密码'
                ),
                onSaved: (val) {
                  _nextPassword = val;
                },
                validator: (v) {
                  return v.trim().length > 8 ? null : '密码必须大于8个字符';
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
        )
      ),
    );
  }
}