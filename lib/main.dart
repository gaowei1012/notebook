import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import './model/User.dart';
import './common/redux/ntb_state.dart';
import './pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // 创建 store
  final store = new Store<NTState>(
    appReducer,
    initialState: NTState(userInfo: User.empty())
  );

  @override
  Widget build(BuildContext context) {

    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: store.state.themeData,
        title: 'notebook',
        home: IndexPage(),
      ),
    );

    // return MaterialApp(
    //   theme: ThemeData.light(),
    //   title: 'notbooks',
    //   home: StoreProvider(
    //     store: store,
    //     child: IndexPage(),
    //   ),
    // );
  }
}