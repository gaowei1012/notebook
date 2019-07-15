import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('view page'),
        ),
        body: GridView(
          // 表格
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 0.7),
          children: <Widget>[
            new Image.network(
              'http://img5.mtime.cn/mg/2019/03/29/095612.14234221_270X405X4.jpg',
              fit: BoxFit.cover,
            ),
            new Image.network(
              'http://img5.mtime.cn/mg/2018/04/18/184415.72879699_210X210X4.jpg',
              fit: BoxFit.cover,
            ),
            new Image.network(
                'http://img5.mtime.cn/mg/2019/04/19/163308.19659571_210X210X4.jpg',
                fit: BoxFit.cover),
            new Image.network(
                'http://img5.mtime.cn/mg/2019/04/17/113531.40938217_210X210X4.jpg',
                fit: BoxFit.cover),
            new Image.network(
                'http://img5.mtime.cn/mg/2019/04/10/162218.90864648_210X210X4.jpg',
                fit: BoxFit.cover),
            new Image.network(
                'http://img5.mtime.cn/pi/2019/04/29/171438.54208321_100X100.jpg',
                fit: BoxFit.cover),
            new Image.network(
              'http://img5.mtime.cn/mg/2019/03/29/095612.14234221_270X405X4.jpg',
              fit: BoxFit.cover,
            ),
            new Image.network(
              'http://img5.mtime.cn/mg/2018/04/18/184415.72879699_210X210X4.jpg',
              fit: BoxFit.cover,
            ),
            new Image.network(
                'http://img5.mtime.cn/mg/2019/04/19/163308.19659571_210X210X4.jpg',
                fit: BoxFit.cover),
          ],
        ));
  }
}
