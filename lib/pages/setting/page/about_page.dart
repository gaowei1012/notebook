import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text('关于我notebook'),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                '我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文我是正文',
                textAlign: TextAlign.justify,
              ),
            ),
          )
        ],
      )
    );
  }
}