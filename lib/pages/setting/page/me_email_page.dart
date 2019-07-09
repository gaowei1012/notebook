import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget {
  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _formSubmitted() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('更换邮箱'),),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: _emailText(),
        ),
      ),
    );
  }

  Widget _emailText() {
    return Column(
      children: <Widget>[
        TextFormField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: '请输入新的邮箱📮'
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