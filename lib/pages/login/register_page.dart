import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _password;
  //String _email;

  void _formSubmitted() {
    var _form = _formKey.currentState;

    if(_form.validate()) {
      print(_name);
      print(_password);
      //print(_email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Form(
          autovalidate: false,// 自动获取焦点
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: '请输入用户名'
                ),
                onSaved: (val) {
                  _name = val;
                },
                validator: (v) {
                  return v.trim().length > 0 ? null : '请输入昵称';
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
                  return v.trim().length > 8 ? null : '密码不能小于8个字符';
                },
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     hintText: '请输入您的邮箱'
              //   ),
              //   onSaved: (val) {
              //     _email=val;
              //   },
              //   validator: (v) {
              //     return v.trim().length > 8 ? null : '邮箱不能小于8个字符';
              //   },
              // ),
              Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(12.0),
                        color: Theme.of(context).primaryColor,// 当前主题色
                        textColor: Colors.white,
                        onPressed: _formSubmitted,
                        child: Text('注册'),
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