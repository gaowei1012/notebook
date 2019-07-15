import 'package:flutter/material.dart';
import 'package:notebook/common/redux/user_redux.dart';
import 'package:notebook/model/User.dart';
import 'package:notebook/common/redux/notebook_state.dart';

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
