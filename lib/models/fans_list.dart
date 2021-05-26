// To parse this JSON data, do
//
//     final fansListModel = fansListModelFromJson(jsonString);

import 'dart:convert';

FansListModel fansListModelFromJson(String str) => FansListModel.fromJson(json.decode(str));

String fansListModelToJson(FansListModel data) => json.encode(data.toJson());

class FansListModel {
  FansListModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final Data data;

  factory FansListModel.fromJson(Map<String, dynamic> json) => FansListModel(
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
  final List<FansListElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"] == null ? null : json["total"],
    totalPage: json["total_page"] == null ? null : json["total_page"],
    currentPage: json["current_page"] == null ? null : json["current_page"],
    list: json["list"] == null ? null : List<FansListElement>.from(json["list"].map((x) => FansListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "total_page": totalPage == null ? null : totalPage,
    "current_page": currentPage == null ? null : currentPage,
    "list": list == null ? null : List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class FansListElement {
  FansListElement({
    this.id,
    this.userId,
    this.followId,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.username,
    this.nickname,
    this.avatar,
    this.vipEndTime,
    this.desc,
    this.isVip,
    this.isFollow,
    this.sameTags,
    this.productNum,
  });

  final int id;
  final int userId;
  final int followId;
  final int status;
  final String updatedAt;
  final String createdAt;
  final String username;
  final String nickname;
  final String avatar;
  final int vipEndTime;
  final String desc;
  final int isVip;
  final int isFollow;
  final int sameTags;
  final String productNum;

  factory FansListElement.fromJson(Map<String, dynamic> json) => FansListElement(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    followId: json["follow_id"] == null ? null : json["follow_id"],
    status: json["status"] == null ? null : json["status"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    username: json["username"] == null ? null : json["username"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    vipEndTime: json["vip_end_time"] == null ? null : json["vip_end_time"],
    desc: json["desc"] == null ? null : json["desc"],
    isVip: json["is_vip"] == null ? null : json["is_vip"],
    isFollow: json["is_follow"] == null ? null : json["is_follow"],
    sameTags: json["same_tags"] == null ? null : json["same_tags"],
    productNum: json["product_num"] == null ? null : json["product_num"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "follow_id": followId == null ? null : followId,
    "status": status == null ? null : status,
    "updated_at": updatedAt == null ? null : updatedAt,
    "created_at": createdAt == null ? null : createdAt,
    "username": username == null ? null : username,
    "nickname": nickname == null ? null : nickname,
    "avatar": avatar == null ? null : avatar,
    "vip_end_time": vipEndTime == null ? null : vipEndTime,
    "desc": desc == null ? null : desc,
    "is_vip": isVip == null ? null : isVip,
    "is_follow": isFollow == null ? null : isFollow,
    "same_tags": sameTags == null ? null : sameTags,
    "product_num": productNum == null ? null : productNum,
  };
}
