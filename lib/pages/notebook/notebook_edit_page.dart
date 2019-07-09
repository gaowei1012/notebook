import 'package:flutter/material.dart';
// import 'package:auto_size_text/auto_size_text.dart';

class NotebookEditPage extends StatefulWidget {
  @override
  _NotebookEditPageState createState() => _NotebookEditPageState();
}

class _NotebookEditPageState extends State<NotebookEditPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _value;

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
      body: Container(
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
        ),
      ),
    );
  }
}
