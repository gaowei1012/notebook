import 'package:flutter/material.dart';
import './timeline.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    // 监听
    _scrollController.addListener(() {

    });
    super.initState();
  }

  _getListCount() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: TimelinePage(),
    );
  }
}