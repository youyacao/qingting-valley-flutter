// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final LoginElement data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    code: json["code"] == null ? null : json["code"],
    msg: json["msg"] == null ? null : json["msg"],
    data: json["data"] == null ? null : LoginElement.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "msg": msg == null ? null : msg,
    "data": data == null ? null : data.toJson(),
  };
}

class LoginElement {
  LoginElement({
    this.token,
    this.expiresIn,
  });

  final String token;
  final int expiresIn;

  factory LoginElement.fromJson(Map<String, dynamic> json) => LoginElement(
    token: json["token"] == null ? null : json["token"],
    expiresIn: json["expires_in"] == null ? null : json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "token": token == null ? null : token,
    "expires_in": expiresIn == null ? null : expiresIn,
  };
}
