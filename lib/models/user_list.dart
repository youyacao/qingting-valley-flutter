// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

UserListModel userListModelFromJson(String str) => UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
  UserListModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final Data data;

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
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
  final List<UserListElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"] == null ? null : json["total"],
    totalPage: json["total_page"] == null ? null : json["total_page"],
    currentPage: json["current_page"] == null ? null : json["current_page"],
    list: json["list"] == null ? null : List<UserListElement>.from(json["list"].map((x) => UserListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "total_page": totalPage == null ? null : totalPage,
    "current_page": currentPage == null ? null : currentPage,
    "list": list == null ? null : List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class UserListElement {
  UserListElement({
    this.id,
    this.username,
    this.nickname,
    this.avatar,
    this.vipEndTime,
    this.isVip,
    this.isFollow,
    this.sameTags,
    this.productNum,
  });

  final int id;
  final String username;
  final String nickname;
  final String avatar;
  final int vipEndTime;
  final int isVip;
  final int isFollow;
  final int sameTags;
  final String productNum;

  factory UserListElement.fromJson(Map<String, dynamic> json) => UserListElement(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    vipEndTime: json["vip_end_time"] == null ? null : json["vip_end_time"],
    isVip: json["is_vip"] == null ? null : json["is_vip"],
    isFollow: json["is_follow"] == null ? null : json["is_follow"],
    sameTags: json["same_tags"] == null ? null : json["same_tags"],
    productNum: json["product_num"] == null ? null : json["product_num"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "nickname": nickname == null ? null : nickname,
    "avatar": avatar == null ? null : avatar,
    "vip_end_time": vipEndTime == null ? null : vipEndTime,
    "is_vip": isVip == null ? null : isVip,
    "is_follow": isFollow == null ? null : isFollow,
    "same_tags": sameTags == null ? null : sameTags,
    "product_num": productNum == null ? null : productNum,
  };
}
