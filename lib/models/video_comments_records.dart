// To parse this JSON data, do
//
//     final videoCommentsRecordsModel = videoCommentsRecordsModelFromJson(jsonString);

import 'dart:convert';

VideoCommentsRecordsModel videoCommentsRecordsModelFromJson(String str) => VideoCommentsRecordsModel.fromJson(json.decode(str));

String videoCommentsRecordsModelToJson(VideoCommentsRecordsModel data) => json.encode(data.toJson());

class VideoCommentsRecordsModel {
  VideoCommentsRecordsModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final Data data;

  factory VideoCommentsRecordsModel.fromJson(Map<String, dynamic> json) => VideoCommentsRecordsModel(
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
  final List<VideoCommentsRecordsElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"] == null ? null : json["total"],
    totalPage: json["total_page"] == null ? null : json["total_page"],
    currentPage: json["current_page"] == null ? null : json["current_page"],
    list: json["list"] == null ? null : List<VideoCommentsRecordsElement>.from(json["list"].map((x) => VideoCommentsRecordsElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "total_page": totalPage == null ? null : totalPage,
    "current_page": currentPage == null ? null : currentPage,
    "list": list == null ? null : List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class VideoCommentsRecordsElement {
  VideoCommentsRecordsElement({
    this.id,
    this.type,
    this.vid,
    this.userId,
    this.content,
    this.likeNum,
    this.pid,
    this.commentId,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.categoryId,
    this.title,
    this.thumb,
    this.videoUrl,
    this.shortVideoUrl,
    this.duration,
    this.viewNum,
    this.commentNum,
    this.shareNum,
    this.collectNum,
    this.tags,
    this.avatar,
    this.username,
    this.nickname,
    this.vipEndTime,
    this.isVip,
    this.mtime,
    this.viewNumStr,
    this.likeNumStr,
    this.commentNumStr,
    this.shareNumStr,
    this.collectNumStr,
  });

  final int id;
  final int type;
  final int vid;
  final int userId;
  final String content;
  final int likeNum;
  final int pid;
  final int commentId;
  final int status;
  final String updatedAt;
  final String createdAt;
  final int categoryId;
  final String title;
  final String thumb;
  final String videoUrl;
  final String shortVideoUrl;
  final String duration;
  final int viewNum;
  final int commentNum;
  final int shareNum;
  final int collectNum;
  final String tags;
  final String avatar;
  final String username;
  final String nickname;
  final int vipEndTime;
  final int isVip;
  final String mtime;
  final String viewNumStr;
  final String likeNumStr;
  final String commentNumStr;
  final String shareNumStr;
  final String collectNumStr;

  factory VideoCommentsRecordsElement.fromJson(Map<String, dynamic> json) => VideoCommentsRecordsElement(
    id: json["id"] == null ? null : json["id"],
    type: json["type"] == null ? null : json["type"],
    vid: json["vid"] == null ? null : json["vid"],
    userId: json["user_id"] == null ? null : json["user_id"],
    content: json["content"] == null ? null : json["content"],
    likeNum: json["like_num"] == null ? null : json["like_num"],
    pid: json["pid"] == null ? null : json["pid"],
    commentId: json["comment_id"] == null ? null : json["comment_id"],
    status: json["status"] == null ? null : json["status"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    title: json["title"] == null ? null : json["title"],
    thumb: json["thumb"] == null ? null : json["thumb"],
    videoUrl: json["video_url"] == null ? null : json["video_url"],
    shortVideoUrl: json["short_video_url"] == null ? null : json["short_video_url"],
    duration: json["duration"] == null ? null : json["duration"],
    viewNum: json["view_num"] == null ? null : json["view_num"],
    commentNum: json["comment_num"] == null ? null : json["comment_num"],
    shareNum: json["share_num"] == null ? null : json["share_num"],
    collectNum: json["collect_num"] == null ? null : json["collect_num"],
    tags: json["tags"] == null ? null : json["tags"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    username: json["username"] == null ? null : json["username"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    vipEndTime: json["vip_end_time"] == null ? null : json["vip_end_time"],
    isVip: json["is_vip"] == null ? null : json["is_vip"],
    mtime: json["mtime"] == null ? null : json["mtime"],
    viewNumStr: json["view_num_str"] == null ? null : json["view_num_str"],
    likeNumStr: json["like_num_str"] == null ? null : json["like_num_str"],
    commentNumStr: json["comment_num_str"] == null ? null : json["comment_num_str"],
    shareNumStr: json["share_num_str"] == null ? null : json["share_num_str"],
    collectNumStr: json["collect_num_str"] == null ? null : json["collect_num_str"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "type": type == null ? null : type,
    "vid": vid == null ? null : vid,
    "user_id": userId == null ? null : userId,
    "content": content == null ? null : content,
    "like_num": likeNum == null ? null : likeNum,
    "pid": pid == null ? null : pid,
    "comment_id": commentId == null ? null : commentId,
    "status": status == null ? null : status,
    "updated_at": updatedAt == null ? null : updatedAt,
    "created_at": createdAt == null ? null : createdAt,
    "category_id": categoryId == null ? null : categoryId,
    "title": title == null ? null : title,
    "thumb": thumb == null ? null : thumb,
    "video_url": videoUrl == null ? null : videoUrl,
    "short_video_url": shortVideoUrl == null ? null : shortVideoUrl,
    "duration": duration == null ? null : duration,
    "view_num": viewNum == null ? null : viewNum,
    "comment_num": commentNum == null ? null : commentNum,
    "share_num": shareNum == null ? null : shareNum,
    "collect_num": collectNum == null ? null : collectNum,
    "tags": tags == null ? null : tags,
    "avatar": avatar == null ? null : avatar,
    "username": username == null ? null : username,
    "nickname": nickname == null ? null : nickname,
    "vip_end_time": vipEndTime == null ? null : vipEndTime,
    "is_vip": isVip == null ? null : isVip,
    "mtime": mtime == null ? null : mtime,
    "view_num_str": viewNumStr == null ? null : viewNumStr,
    "like_num_str": likeNumStr == null ? null : likeNumStr,
    "comment_num_str": commentNumStr == null ? null : commentNumStr,
    "share_num_str": shareNumStr == null ? null : shareNumStr,
    "collect_num_str": collectNumStr == null ? null : collectNumStr,
  };
}
