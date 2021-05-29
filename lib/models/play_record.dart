// To parse this JSON data, do
//
//     final playRecordModel = playRecordModelFromJson(jsonString);

import 'dart:convert';

PlayRecordModel playRecordModelFromJson(String str) => PlayRecordModel.fromJson(json.decode(str));

String playRecordModelToJson(PlayRecordModel data) => json.encode(data.toJson());

class PlayRecordModel {
  PlayRecordModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final Data data;

  factory PlayRecordModel.fromJson(Map<String, dynamic> json) => PlayRecordModel(
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
  final List<PlayRecordElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"] == null ? null : json["total"],
    totalPage: json["total_page"] == null ? null : json["total_page"],
    currentPage: json["current_page"] == null ? null : json["current_page"],
    list: json["list"] == null ? null : List<PlayRecordElement>.from(json["list"].map((x) => PlayRecordElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "total_page": totalPage == null ? null : totalPage,
    "current_page": currentPage == null ? null : currentPage,
    "list": list == null ? null : List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class PlayRecordElement {
  PlayRecordElement({
    this.id,
    this.userId,
    this.videoId,
    this.second,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.mtime,
    this.date,
    this.video,
  });

  final int id;
  final int userId;
  final int videoId;
  final int second;
  final int status;
  final String updatedAt;
  final String createdAt;
  final String mtime;
  final DateTime date;
  final Video video;

  factory PlayRecordElement.fromJson(Map<String, dynamic> json) => PlayRecordElement(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    videoId: json["video_id"] == null ? null : json["video_id"],
    second: json["second"] == null ? null : json["second"],
    status: json["status"] == null ? null : json["status"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    mtime: json["mtime"] == null ? null : json["mtime"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    video: json["video"] == null ? null : Video.fromJson(json["video"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "video_id": videoId == null ? null : videoId,
    "second": second == null ? null : second,
    "status": status == null ? null : status,
    "updated_at": updatedAt == null ? null : updatedAt,
    "created_at": createdAt == null ? null : createdAt,
    "mtime": mtime == null ? null : mtime,
    "date": date == null ? null : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "video": video == null ? null : video.toJson(),
  };
}

class Video {
  Video({
    this.id,
    this.title,
    this.thumb,
    this.videoUrl,
  });

  final int id;
  final String title;
  final String thumb;
  final String videoUrl;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    thumb: json["thumb"] == null ? null : json["thumb"],
    videoUrl: json["video_url"] == null ? null : json["video_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "thumb": thumb == null ? null : thumb,
    "video_url": videoUrl == null ? null : videoUrl,
  };
}
