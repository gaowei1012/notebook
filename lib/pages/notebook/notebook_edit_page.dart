import 'package:flutter/material.dart';
// import 'package:auto_size_text/auto_size_text.dart';

class NotebookEditPage extends StatefulWidget {
  @override
  _NotebookEditPageState createState() => _NotebookEditPageState();
}

class _NotebookEditPageState extends State<NotebookEditPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _value;

// 返回提示对话框
  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('是否退出'),
        actions: <Widget>[
          FlatButton(onPressed: () => Navigator.of(context).pop(false), child: Text('取消'),),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('确定'),
          )
        ],
      )
    );
  }

  void _formSubmitted() {
    var _form = _formKey.currentState;
    if(_form.validate()) {
      _form.save();
      print(_value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('写日记'),
      ),
      body: WillPopScope( // 返回功能
        onWillPop: () {
          return _dialogExitApp(context);
        },
        child: _notebookContainer(),
      )
    );
  }

  Widget _notebookContainer() {
    return Container(
      padding: EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: '写日记',
                  enabled: false,
                ),
                maxLines: 10,
                onSaved: (val) {
                  _value = val;
                },
                validator: (v) {

                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text('发布'),
                        color: Theme.of(context).primaryColor,
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
    );
  }
}
