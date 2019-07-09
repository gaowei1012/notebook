import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './me_aratar_page.dart';
import './me_nickname_page.dart';
import './me_email_page.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: <Widget>[
          _avatar(context),
          _nickname(context),
          _email(context)
        ],
      ),
    );
  }

  Widget _avatar(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1
          )
        )
      ),
      child: ListTile(
        title: Text('头像'),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AratarPage()));
        },
      ),
    );
  }

  Widget _nickname(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        ),
      ),
      child: ListTile(
        title: Text('昵称'),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NicknamePage()));
        },
      ),
    );
  }

  Widget _email(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: ListTile(
        title: Text('邮箱'),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => EmailPage()));
        },
      ),
    );
  }
}