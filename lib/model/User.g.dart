// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['username'] as String, json['avatar'] as String,
      json['nickname'] as String, json['isLogin'] as bool)
    ..login = json['login'] as String
    ..password = json['password'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'login': instance.login,
      'username': instance.username,
      'password': instance.password,
      'avatar': instance.avatar,
      'nickname': instance.nickname,
      'isLogin': instance.isLogin
    };
