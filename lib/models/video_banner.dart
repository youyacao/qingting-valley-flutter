// To parse this JSON data, do
//
//     final videoBannerModel = videoBannerModelFromJson(jsonString);

import 'dart:convert';

VideoBannerModel videoBannerModelFromJson(String str) => VideoBannerModel.fromJson(json.decode(str));

String videoBannerModelToJson(VideoBannerModel data) => json.encode(data.toJson());

class VideoBannerModel {
  VideoBannerModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final List<VideoBannerElement> data;

  factory VideoBannerModel.fromJson(Map<String, dynamic> json) => VideoBannerModel(
    code: json["code"] == null ? null : json["code"],
    msg: json["msg"] == null ? null : json["msg"],
    data: json["data"] == null ? null : List<VideoBannerElement>.from(json["data"].map((x) => VideoBannerElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "msg": msg == null ? null : msg,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class VideoBannerElement {
  VideoBannerElement({
    this.id,
    this.type,
    this.providerName,
    this.title,
    this.imgUrl,
    this.videoUrl,
    this.adUrl,
    this.desc,
    this.openType,
    this.endTime,
    this.viewNum,
    this.sort,
    this.status,
    this.updatedAt,
    this.createdAt,
  });

  final int id;
  final int type;
  final String providerName;
  final String title;
  final String imgUrl;
  final String videoUrl;
  final String adUrl;
  final String desc;
  final int openType;
  final DateTime endTime;
  final int viewNum;
  final int sort;
  final int status;
  final DateTime updatedAt;
  final DateTime createdAt;

  factory VideoBannerElement.fromJson(Map<String, dynamic> json) => VideoBannerElement(
    id: json["id"] == null ? null : json["id"],
    type: json["type"] == null ? null : json["type"],
    providerName: json["provider_name"] == null ? null : json["provider_name"],
    title: json["title"] == null ? null : json["title"],
    imgUrl: json["img_url"] == null ? null : json["img_url"],
    videoUrl: json["video_url"] == null ? null : json["video_url"],
    adUrl: json["ad_url"] == null ? null : json["ad_url"],
    desc: json["desc"] == null ? null : json["desc"],
    openType: json["open_type"] == null ? null : json["open_type"],
    endTime: json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
    viewNum: json["view_num"] == null ? null : json["view_num"],
    sort: json["sort"] == null ? null : json["sort"],
    status: json["status"] == null ? null : json["status"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "type": type == null ? null : type,
    "provider_name": providerName == null ? null : providerName,
    "title": title == null ? null : title,
    "img_url": imgUrl == null ? null : imgUrl,
    "video_url": videoUrl == null ? null : videoUrl,
    "ad_url": adUrl == null ? null : adUrl,
    "desc": desc == null ? null : desc,
    "open_type": openType == null ? null : openType,
    "end_time": endTime == null ? null : endTime.toIso8601String(),
    "view_num": viewNum == null ? null : viewNum,
    "sort": sort == null ? null : sort,
    "status": status == null ? null : status,
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
  };
}
