// To parse this JSON data, do
//
//     final videoListModel = videoListModelFromJson(jsonString);

import 'dart:convert';

VideoListModel videoListModelFromJson(String str) => VideoListModel.fromJson(json.decode(str));

String videoListModelToJson(VideoListModel data) => json.encode(data.toJson());

class VideoListModel {
  VideoListModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final Data data;

  factory VideoListModel.fromJson(Map<String, dynamic> json) => VideoListModel(
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
  final List<VideoListElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"] == null ? null : json["total"],
    totalPage: json["total_page"] == null ? null : json["total_page"],
    currentPage: json["current_page"] == null ? null : json["current_page"],
    list: json["list"] == null ? null : List<VideoListElement>.from(json["list"].map((x) => VideoListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "total_page": totalPage == null ? null : totalPage,
    "current_page": currentPage == null ? null : currentPage,
    "list": list == null ? null : List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class VideoListElement {
  VideoListElement({
    this.id,
    this.userId,
    this.categoryId,
    this.title,
    this.thumb,
    this.videoUrl,
    this.shortVideoUrl,
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
    this.username,
    this.nickname,
    this.avatar,
    this.vipEndTime,
    this.sex,
    this.isAuth,
    this.topicId,
    this.isVip,
    this.mtime,
    this.viewNumStr,
    this.likeNumStr,
    this.commentNumStr,
    this.shareNumStr,
    this.collectNumStr,
    this.durationStr,
    this.isFollow,
    this.isLike,
    this.isCollect,
    this.categoryName,
    this.topicInfo,
  });

  final int id;
  final int userId;
  final int categoryId;
  final String title;
  final String thumb;
  final String videoUrl;
  final String shortVideoUrl;
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
  final String username;
  final String nickname;
  final String avatar;
  final dynamic vipEndTime;
  final int sex;
  final String isAuth;
  final dynamic topicId;
  final int isVip;
  final String mtime;
  final String viewNumStr;
  final String likeNumStr;
  final String commentNumStr;
  final String shareNumStr;
  final String collectNumStr;
  final String durationStr;
  final int isFollow;
  final int isLike;
  final int isCollect;
  final String categoryName;
  final dynamic topicInfo;

  factory VideoListElement.fromJson(Map<String, dynamic> json) => VideoListElement(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    title: json["title"] == null ? null : json["title"],
    thumb: json["thumb"] == null ? null : json["thumb"],
    videoUrl: json["video_url"] == null ? null : json["video_url"],
    shortVideoUrl: json["short_video_url"] == null ? null : json["short_video_url"],
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
    username: json["username"] == null ? null : json["username"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    vipEndTime: json["vip_end_time"],
    sex: json["sex"] == null ? null : json["sex"],
    isAuth: json["is_auth"] == null ? null : json["is_auth"],
    topicId: json["topic_id"],
    isVip: json["is_vip"] == null ? null : json["is_vip"],
    mtime: json["mtime"] == null ? null : json["mtime"],
    viewNumStr: json["view_num_str"] == null ? null : json["view_num_str"],
    likeNumStr: json["like_num_str"] == null ? null : json["like_num_str"],
    commentNumStr: json["comment_num_str"] == null ? null : json["comment_num_str"],
    shareNumStr: json["share_num_str"] == null ? null : json["share_num_str"],
    collectNumStr: json["collect_num_str"] == null ? null : json["collect_num_str"],
    durationStr: json["duration_str"] == null ? null : json["duration_str"],
    isFollow: json["is_follow"] == null ? null : json["is_follow"],
    isLike: json["is_like"] == null ? null : json["is_like"],
    isCollect: json["is_collect"] == null ? null : json["is_collect"],
    categoryName: json["category_name"] == null ? null : json["category_name"],
    topicInfo: json["topic_info"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "category_id": categoryId == null ? null : categoryId,
    "title": title == null ? null : title,
    "thumb": thumb == null ? null : thumb,
    "video_url": videoUrl == null ? null : videoUrl,
    "short_video_url": shortVideoUrl == null ? null : shortVideoUrl,
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
    "username": username == null ? null : username,
    "nickname": nickname == null ? null : nickname,
    "avatar": avatar == null ? null : avatar,
    "vip_end_time": vipEndTime,
    "sex": sex == null ? null : sex,
    "is_auth": isAuth == null ? null : isAuth,
    "topic_id": topicId,
    "is_vip": isVip == null ? null : isVip,
    "mtime": mtime == null ? null : mtime,
    "view_num_str": viewNumStr == null ? null : viewNumStr,
    "like_num_str": likeNumStr == null ? null : likeNumStr,
    "comment_num_str": commentNumStr == null ? null : commentNumStr,
    "share_num_str": shareNumStr == null ? null : shareNumStr,
    "collect_num_str": collectNumStr == null ? null : collectNumStr,
    "duration_str": durationStr == null ? null : durationStr,
    "is_follow": isFollow == null ? null : isFollow,
    "is_like": isLike == null ? null : isLike,
    "is_collect": isCollect == null ? null : isCollect,
    "category_name": categoryName == null ? null : categoryName,
    "topic_info": topicInfo,
  };
}
