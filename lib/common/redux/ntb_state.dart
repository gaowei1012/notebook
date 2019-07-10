import 'package:flutter/material.dart';
import './user_redux.dart';
import './notebook_state.dart';
import '../../model/User.dart';


class NTState {
  User userInfo;

  ThemeData themeData;

  NTState({this.userInfo, this.themeData});
}

NTState appReducer(NTState state, action) {
  return NTState(
    userInfo: UserReducer(state.userInfo, action),

    themeData: ThemeDataReducer(state.themeData, action),
  );
}
