// To parse this JSON data, do
//
//     final inviteListModel = inviteListModelFromJson(jsonString);

import 'dart:convert';

InviteListModel inviteListModelFromJson(String str) => InviteListModel.fromJson(json.decode(str));

String inviteListModelToJson(InviteListModel data) => json.encode(data.toJson());

class InviteListModel {
  InviteListModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final Data data;

  factory InviteListModel.fromJson(Map<String, dynamic> json) => InviteListModel(
    code: json["code"] == null ? null : json["code"],
    msg: json["msg"] == null ? null : json["msg"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "msg": msg == null ? null : msg,
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.total,
    this.totalPage,
    this.currentPage,
    this.list,
  });

  final int total;
  final int totalPage;
  final int currentPage;
  final List<InviteListElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"] == null ? null : json["total"],
    totalPage: json["total_page"] == null ? null : json["total_page"],
    currentPage: json["current_page"] == null ? null : json["current_page"],
    list: json["list"] == null ? null : List<InviteListElement>.from(json["list"].map((x) => InviteListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "total_page": totalPage == null ? null : totalPage,
    "current_page": currentPage == null ? null : currentPage,
    "list": list == null ? null : List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class InviteListElement {
  InviteListElement({
    this.id,
    this.username,
    this.nickname,
    this.avatar,
  });

  final int id;
  final String username;
  final String nickname;
  final String avatar;

  factory InviteListElement.fromJson(Map<String, dynamic> json) => InviteListElement(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    avatar: json["avatar"] == null ? null : json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "nickname": nickname == null ? null : nickname,
    "avatar": avatar == null ? null : avatar,
  };
}
