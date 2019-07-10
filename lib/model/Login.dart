import 'package:json_annotation/json_annotation.dart';

part 'Login.g.dart';

@JsonSerializable()
class Login {
  Login(
    this.username,
    this.password,
    this.email,
    this.code,
    this.avatar
  );

  String username;
  String password;
  String email;
  String code;
  String avatar;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);

  Login.empty();
}