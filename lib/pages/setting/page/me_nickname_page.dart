import 'package:flutter/material.dart';

class NicknamePage extends StatefulWidget {
  @override
  _NicknamePageState createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {

  void _formSubmitted() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('更换昵称'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
          child: _nickNameText()
        ),
      ),
    );
  }

  Widget _nickNameText() {
    return Column(
      children: <Widget>[
        TextFormField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: '请输入新昵称'
          ),
          onSaved: (val) {
            // todo
          },
          validator: (v) {
            // todo
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 28.0),
          child: _paddingButton()
        )
      ],
    );
  }

  Widget _paddingButton() {
    return Row(children: <Widget>[
      Expanded(
        child: RaisedButton(
          padding: EdgeInsets.all(15.0),
          child: Text('提交'),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onPressed: _formSubmitted,
        ),
      )
    ],);
  }
}