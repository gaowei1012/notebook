import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import '../../model/User.dart';

final UserReducer = combineReducers<User>([

  TypedReducer<User, UpdateUserAction>(_updateLocad)
]);

User _updateLocad(User user, action) {
  
  user = action.userInfo;
  return user;
}

class UpdateUserAction {
  final User userInfo;
  UpdateUserAction(this.userInfo);
}
