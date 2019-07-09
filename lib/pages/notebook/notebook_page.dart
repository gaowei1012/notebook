import 'package:flutter/material.dart';

import './notebook_edit_page.dart';
// import './notebook_markown.dart';

class NotebookPage extends StatefulWidget {
  @override
  _NotebookPageState createState() => _NotebookPageState();
}

class _NotebookPageState extends State<NotebookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('写日记'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.edit),
        onPressed: () {
          // 跳转到编辑页
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotebookPage()));
        },
      ),
      body: Container(
        child: Center(
          child: Text('暂时没有笔记📒'),
        ),
      ),
    );
  }
}