import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  User(
    this.username,
    this.avatar,
    this.nickname,
    this.isLogin
  );

  String login;
  String username;
  String password;
  String avatar;
  String nickname;
  bool isLogin;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User.empty();
}