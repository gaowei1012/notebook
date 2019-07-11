import 'package:flutter/material.dart';

class TopBarPage extends StatefulWidget {
  @override
  _TopBarPageState createState() => _TopBarPageState();
}


class _TopBarPageState extends State<TopBarPage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  /// PageController _pageController;

  /// List _tabs = ['新闻', '日报', '今日'];
  /// List _tabViews = ['今日新闻', '今日日报', '今日今日'];

  _title() {
    return Text(
      'app bar',
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    );
  }

  _drawer() {}

  _floatingActionButton() {}

  _tabViews() {
    return Column(
      children: <Widget>[
        Text('1'),
        Text('2'),
        Text('3')
      ],
    );
  }

  _tabs() {
    return Column(
      children: <Widget>[
        Icon(Icons.arrow_right),
        Icon(Icons.arrow_right),
        Icon(Icons.arrow_right),
      ],
    );
  }

  @override
  void initState() {
    /// TODO: implement initState
    /// 需要混入 SingleTickerProviderStateMixin
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    /// TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
  

  final _backgroundColor = Colors.blue;
  final _indicationColor = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      floatingActionButton: _floatingActionButton(),
      appBar: AppBar(
        title: _title(),
        backgroundColor: _backgroundColor,
        bottom: new TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: <Widget>[
            Text('1'),
            Text('2'),
            Text('3')
          ],
          // indicatorColor: _indicationColor,
        ),
      ),
      // body: new PageView(
      //   controller: _pageController,
      //   children: <Widget>[
      //     Text('1'),
      //     Text('2'),
      //     Text('3')
      //   ],
      //   onPageChanged: (index) {
      //     _tabController.animateTo(index);
      //   },
      // ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text('1'),
          Text('2'),
          Text('3')
        ],
      ),
    );
  }
}