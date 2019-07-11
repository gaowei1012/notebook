import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// 私密日记
class PrivacyPage extends StatefulWidget {
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {

  List<String> dataList = new List();

  final int pageSize = 20;

  bool disposed = false;

  final ScrollController _scrollController = new ScrollController();
  final GlobalKey<RefreshIndicatorState> refreshKey = new GlobalKey();
  /// 下拉刷新数据
  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    for(int i = 0; i < pageSize; i++) {
      dataList.add('refresh');
    }
    if(disposed) {
      return;
    }
    setState((){});
  }

  /// 加载更多
  Future<void> loadMore() async {
    await Future.delayed(Duration(seconds: 2));
    for (var i = 0; i < pageSize; i++) {
      dataList.add('loadmore');
    }
    if(disposed) {
      return;
    }
    setState(() { });
  }

  @override
  void initState() { 
    super.initState();
    /// 滚动监听
    _scrollController.addListener(() {
      /// 滚动局
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
    Future.delayed(Duration(seconds: 0), () {
      refreshKey.currentState.show();
    });
  }

  @override
  void dispose() { 
    disposed = true;
    super.dispose();
  }

  /// 标题
  _title() {
    return Text('私密日记');
  }
  /// 下拉加载更多
  /*
  Widget _buildProgressIndicator() {
    Widget bottomWidget = (control.needLoadMore) ? new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      new SpinKitFadingCircle(color: Colors.red),
      new Container(
        width: 5.0,
      ),
      new Text('加载中...')
    ],) : new Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: bottomWidget,
      )
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        /// 刷新
        child: new RefreshIndicator(
          key: refreshKey,
          onRefresh: onRefresh,
          child: new ListView.builder(
            /// 保持ListView能滚动，解决refsh兼容性问题
            physics: const AlwaysScrollableScrollPhysics(),

            itemBuilder: (context, index) {
              if(index == dataList.length) {
                return new Container(
                  margin: EdgeInsets.all(10),
                  child: Align(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return Card(
                child: new Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: new Text('我是私密日记')
                )
              );
            },

            //itemCount: (dataList.length >= pageSize) : dataList.lenght + 1 ? datalist.length,
            itemCount: (dataList.length >= pageSize)
              ? dataList.length + 1
              : dataList.length,
              /// 滑动监听
            controller: _scrollController,
          ),
        ),
      ),
    );
  }
}