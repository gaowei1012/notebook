import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './register_page.dart';
import './forget_pasd_page.dart';

class LoginPage extends StatefulWidget {

  static final String sLogin = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _password;

  void _formSubmitted() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
      print(_name);
      print(_password);
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
          autovalidate: false,// 自动对焦
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '请输入用户名',
                  //icon: Icon(CupertinoIcons.person)
                ),
                onSaved: (val) {
                  _name = val;
                },
                validator: (v) {
                  return v.trim().length > 0 ? null: '用户名不存在';
                }
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码',
                  //icon: Icon(CupertinoIcons.padlock),
                ),
                obscureText: true,
                validator: (v) {
                  return v.trim().length > 7 ? null : '密码不能少于8位';
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
                        child: Text('注册', textAlign: TextAlign.left,),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                        },
                      )
                    ),
                    Container(
                      width: ScreenUtil().setWidth(320.0),
                      child: InkWell(
                        child: Text('忘记密码', textAlign: TextAlign.right),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPasdPage()));
                        },
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}
