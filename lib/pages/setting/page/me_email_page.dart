import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:notebook/utils/show_dailog.dart';
import 'package:notebook/pages/setting/setting_page.dart';

class EmailPage extends StatefulWidget {
  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;

  void showDailogTip() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new CupertinoAlertDialog(
          title: new Text('提示'),
          content: new Text('邮箱修改成功'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: new Text('确定'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingPage()));
              },
            )
          ],
        );
      }
    );
  }

  void _formSubmitted() {
    var _form = _formKey.currentState;
    if (_form.validate()) {
      print(_email);
      showDailogTip();
    } else {
      print('邮箱更改失败');
    }
    /// 修改成功,跳转到设置页面
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
            _email = val;
          },
          validator: (v) {
            return v.trim().length > 6 ? null : '请输入正确的邮箱';
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