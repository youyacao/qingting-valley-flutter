// To parse this JSON data, do
//
//     final videoLikesRecordsModel = videoLikesRecordsModelFromJson(jsonString);

import 'dart:convert';

VideoLikesRecordsModel videoLikesRecordsModelFromJson(String str) => VideoLikesRecordsModel.fromJson(json.decode(str));

String videoLikesRecordsModelToJson(VideoLikesRecordsModel data) => json.encode(data.toJson());

class VideoLikesRecordsModel {
  VideoLikesRecordsModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final Data data;

  factory VideoLikesRecordsModel.fromJson(Map<String, dynamic> json) => VideoLikesRecordsModel(
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
  final List<VideoLikesRecordsElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"] == null ? null : json["total"],
    totalPage: json["total_page"] == null ? null : json["total_page"],
    currentPage: json["current_page"] == null ? null : json["current_page"],
    list: json["list"] == null ? null : List<VideoLikesRecordsElement>.from(json["list"].map((x) => VideoLikesRecordsElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "total_page": totalPage == null ? null : totalPage,
    "current_page": currentPage == null ? null : currentPage,
    "list": list == null ? null : List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class VideoLikesRecordsElement {
  VideoLikesRecordsElement({
    this.id,
    this.type,
    this.userId,
    this.vid,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.username,
    this.nickname,
    this.avatar,
    this.vipEndTime,
    this.video,
  });

  final int id;
  final int type;
  final int userId;
  final int vid;
  final int status;
  final String updatedAt;
  final String createdAt;
  final String username;
  final String nickname;
  final String avatar;
  final int vipEndTime;
  final VideoLikesRecordsVideoElement video;

  factory VideoLikesRecordsElement.fromJson(Map<String, dynamic> json) => VideoLikesRecordsElement(
    id: json["id"] == null ? null : json["id"],
    type: json["type"] == null ? null : json["type"],
    userId: json["user_id"] == null ? null : json["user_id"],
    vid: json["vid"] == null ? null : json["vid"],
    status: json["status"] == null ? null : json["status"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    username: json["username"] == null ? null : json["username"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    vipEndTime: json["vip_end_time"] == null ? null : json["vip_end_time"],
    video: json["video"] == null ? null : VideoLikesRecordsVideoElement.fromJson(json["video"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "type": type == null ? null : type,
    "user_id": userId == null ? null : userId,
    "vid": vid == null ? null : vid,
    "status": status == null ? null : status,
    "updated_at": updatedAt == null ? null : updatedAt,
    "created_at": createdAt == null ? null : createdAt,
    "username": username == null ? null : username,
    "nickname": nickname == null ? null : nickname,
    "avatar": avatar == null ? null : avatar,
    "vip_end_time": vipEndTime == null ? null : vipEndTime,
    "video": video == null ? null : video.toJson(),
  };
}

class VideoLikesRecordsVideoElement {
  VideoLikesRecordsVideoElement({
    this.id,
    this.userId,
    this.categoryId,
    this.title,
    this.thumb,
    this.videoUrl,
    this.shortVideoLikesRecordsVideoElementUrl,
    this.duration,
    this.viewNum,
    this.likeNum,
    this.commentNum,
    this.shareNum,
    this.collectNum,
    this.tags,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.avatar,
    this.username,
    this.nickname,
    this.isVip,
    this.vipEndTime,
  });

  final int id;
  final int userId;
  final int categoryId;
  final String title;
  final String thumb;
  final String videoUrl;
  final String shortVideoLikesRecordsVideoElementUrl;
  final String duration;
  final int viewNum;
  final int likeNum;
  final int commentNum;
  final int shareNum;
  final int collectNum;
  final String tags;
  final int status;
  final String updatedAt;
  final String createdAt;
  final String avatar;
  final String username;
  final String nickname;
  final int isVip;
  final int vipEndTime;

  factory VideoLikesRecordsVideoElement.fromJson(Map<String, dynamic> json) => VideoLikesRecordsVideoElement(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    title: json["title"] == null ? null : json["title"],
    thumb: json["thumb"] == null ? null : json["thumb"],
    videoUrl: json["video_url"] == null ? null : json["video_url"],
    shortVideoLikesRecordsVideoElementUrl: json["short_video_url"] == null ? null : json["short_video_url"],
    duration: json["duration"] == null ? null : json["duration"],
    viewNum: json["view_num"] == null ? null : json["view_num"],
    likeNum: json["like_num"] == null ? null : json["like_num"],
    commentNum: json["comment_num"] == null ? null : json["comment_num"],
    shareNum: json["share_num"] == null ? null : json["share_num"],
    collectNum: json["collect_num"] == null ? null : json["collect_num"],
    tags: json["tags"] == null ? null : json["tags"],
    status: json["status"] == null ? null : json["status"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    username: json["username"] == null ? null : json["username"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    isVip: json["is_vip"] == null ? null : json["is_vip"],
    vipEndTime: json["vip_end_time"] == null ? null : json["vip_end_time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "category_id": categoryId == null ? null : categoryId,
    "title": title == null ? null : title,
    "thumb": thumb == null ? null : thumb,
    "video_url": videoUrl == null ? null : videoUrl,
    "short_video_url": shortVideoLikesRecordsVideoElementUrl == null ? null : shortVideoLikesRecordsVideoElementUrl,
    "duration": duration == null ? null : duration,
    "view_num": viewNum == null ? null : viewNum,
    "like_num": likeNum == null ? null : likeNum,
    "comment_num": commentNum == null ? null : commentNum,
    "share_num": shareNum == null ? null : shareNum,
    "collect_num": collectNum == null ? null : collectNum,
    "tags": tags == null ? null : tags,
    "status": status == null ? null : status,
    "updated_at": updatedAt == null ? null : updatedAt,
    "created_at": createdAt == null ? null : createdAt,
    "avatar": avatar == null ? null : avatar,
    "username": username == null ? null : username,
    "nickname": nickname == null ? null : nickname,
    "is_vip": isVip == null ? null : isVip,
    "vip_end_time": vipEndTime == null ? null : vipEndTime,
  };
}
