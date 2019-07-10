// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
      json['username'] as String,
      json['password'] as String,
      json['email'] as String,
      json['code'] as String,
      json['avatar'] as String);
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'code': instance.code,
      'avatar': instance.avatar
    };
