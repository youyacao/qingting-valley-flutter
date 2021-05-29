// To parse this JSON data, do
//
//     final downloadRecordModel = downloadRecordModelFromJson(jsonString);

import 'dart:convert';

DownloadRecordModel downloadRecordModelFromJson(String str) => DownloadRecordModel.fromJson(json.decode(str));

String downloadRecordModelToJson(DownloadRecordModel data) => json.encode(data.toJson());

class DownloadRecordModel {
  DownloadRecordModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final Data data;

  factory DownloadRecordModel.fromJson(Map<String, dynamic> json) => DownloadRecordModel(
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
  final List<DownloadRecordElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"] == null ? null : json["total"],
    totalPage: json["total_page"] == null ? null : json["total_page"],
    currentPage: json["current_page"] == null ? null : json["current_page"],
    list: json["list"] == null ? null : List<DownloadRecordElement>.from(json["list"].map((x) => DownloadRecordElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "total_page": totalPage == null ? null : totalPage,
    "current_page": currentPage == null ? null : currentPage,
    "list": list == null ? null : List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class DownloadRecordElement {
  DownloadRecordElement({
    this.id,
    this.title,
    this.thumb,
    this.videoUrl,
    this.username,
    this.nickname,
    this.avatar,
    this.vipEndTime,
    this.createdAt,
    this.isVip,
    this.mtime,
  });

  final int id;
  final String title;
  final String thumb;
  final String videoUrl;
  final String username;
  final String nickname;
  final String avatar;
  final int vipEndTime;
  final String createdAt;
  final int isVip;
  final String mtime;

  factory DownloadRecordElement.fromJson(Map<String, dynamic> json) => DownloadRecordElement(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    thumb: json["thumb"] == null ? null : json["thumb"],
    videoUrl: json["video_url"] == null ? null : json["video_url"],
    username: json["username"] == null ? null : json["username"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    vipEndTime: json["vip_end_time"] == null ? null : json["vip_end_time"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    isVip: json["is_vip"] == null ? null : json["is_vip"],
    mtime: json["mtime"] == null ? null : json["mtime"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "thumb": thumb == null ? null : thumb,
    "video_url": videoUrl == null ? null : videoUrl,
    "username": username == null ? null : username,
    "nickname": nickname == null ? null : nickname,
    "avatar": avatar == null ? null : avatar,
    "vip_end_time": vipEndTime == null ? null : vipEndTime,
    "created_at": createdAt == null ? null : createdAt,
    "is_vip": isVip == null ? null : isVip,
    "mtime": mtime == null ? null : mtime,
  };
}
