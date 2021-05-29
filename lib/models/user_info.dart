// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) => UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  UserInfoModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final UserInfoElement data;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    code: json["code"] == null ? null : json["code"],
    msg: json["msg"] == null ? null : json["msg"],
    data: json["data"] == null ? null : UserInfoElement.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "msg": msg == null ? null : msg,
    "data": data == null ? null : data.toJson(),
  };
}

class UserInfoElement {
  UserInfoElement({
    this.id,
    this.username,
    this.phone,
    this.email,
    this.nickname,
    this.avatar,
    this.refcode,
    this.truename,
    this.qq,
    this.sex,
    this.birthday,
    this.amount,
    this.integral,
    this.gold,
    this.heat,
    this.grade,
    this.alipayAccountName,
    this.alipayAccount,
    this.vipEndTime,
    this.position,
    this.desc,
    this.pid,
    this.level,
    this.isAuth,
    this.isAudio,
    this.deviceId,
    this.lastLoginTime,
    this.tags,
    this.canLive,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.avatarOrigin,
    this.roles,
    this.isVip,
    this.followNum,
    this.myFollowNum,
    this.likeNum,
    this.refNum,
    this.tagsNum,
    this.filmReviewNum,
  });

  final int id;
  final String username;
  final String phone;
  final String email;
  final String nickname;
  final String avatar;
  final String refcode;
  final String truename;
  final String qq;
  final int sex;
  final String birthday;
  final String amount;
  final int integral;
  final int gold;
  final int heat;
  final int grade;
  final String alipayAccountName;
  final String alipayAccount;
  final dynamic vipEndTime;
  final String position;
  final String desc;
  final int pid;
  final String level;
  final String isAuth;
  final int isAudio;
  final String deviceId;
  final String lastLoginTime;
  final String tags;
  final int canLive;
  final int status;
  final String updatedAt;
  final String createdAt;
  final String avatarOrigin;
  final List<dynamic> roles;
  final int isVip;
  final String followNum;
  final String myFollowNum;
  final String likeNum;
  final String refNum;
  final int tagsNum;
  final String filmReviewNum;

  factory UserInfoElement.fromJson(Map<String, dynamic> json) => UserInfoElement(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"] == null ? null : json["email"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    refcode: json["refcode"] == null ? null : json["refcode"],
    truename: json["truename"] == null ? null : json["truename"],
    qq: json["qq"] == null ? null : json["qq"],
    sex: json["sex"] == null ? null : json["sex"],
    birthday: json["birthday"] == null ? null : json["birthday"],
    amount: json["amount"] == null ? null : json["amount"],
    integral: json["integral"] == null ? null : json["integral"],
    gold: json["gold"] == null ? null : json["gold"],
    heat: json["heat"] == null ? null : json["heat"],
    grade: json["grade"] == null ? null : json["grade"],
    alipayAccountName: json["alipay_account_name"] == null ? null : json["alipay_account_name"],
    alipayAccount: json["alipay_account"] == null ? null : json["alipay_account"],
    vipEndTime: json["vip_end_time"] == null ? null : json["vip_end_time"],
    position: json["position"] == null ? null : json["position"],
    desc: json["desc"] == null ? null : json["desc"],
    pid: json["pid"] == null ? null : json["pid"],
    level: json["level"] == null ? null : json["level"],
    isAuth: json["is_auth"] == null ? null : json["is_auth"],
    isAudio: json["is_audio"] == null ? null : json["is_audio"],
    deviceId: json["device_id"] == null ? null : json["device_id"],
    lastLoginTime: json["last_login_time"] == null ? null : json["last_login_time"],
    tags: json["tags"] == null ? null : json["tags"],
    canLive: json["can_live"] == null ? null : json["can_live"],
    status: json["status"] == null ? null : json["status"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    avatarOrigin: json["avatar_origin"] == null ? null : json["avatar_origin"],
    roles: json["roles"] == null ? null : List<dynamic>.from(json["roles"].map((x) => x)),
    isVip: json["is_vip"] == null ? null : json["is_vip"],
    followNum: json["follow_num"] == null ? null : json["follow_num"],
    myFollowNum: json["my_follow_num"] == null ? null : json["my_follow_num"],
    likeNum: json["like_num"] == null ? null : json["like_num"],
    refNum: json["ref_num"] == null ? null : json["ref_num"],
    tagsNum: json["tags_num"] == null ? null : json["tags_num"],
    filmReviewNum: json["film_review_num"] == null ? null : json["film_review_num"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "nickname": nickname == null ? null : nickname,
    "avatar": avatar == null ? null : avatar,
    "refcode": refcode == null ? null : refcode,
    "truename": truename == null ? null : truename,
    "qq": qq == null ? null : qq,
    "sex": sex == null ? null : sex,
    "birthday": birthday == null ? null : birthday,
    "amount": amount == null ? null : amount,
    "integral": integral == null ? null : integral,
    "gold": gold == null ? null : gold,
    "heat": heat == null ? null : heat,
    "grade": grade == null ? null : grade,
    "alipay_account_name": alipayAccountName == null ? null : alipayAccountName,
    "alipay_account": alipayAccount == null ? null : alipayAccount,
    "vip_end_time": vipEndTime == null ? null : vipEndTime,
    "position": position == null ? null : position,
    "desc": desc == null ? null : desc,
    "pid": pid == null ? null : pid,
    "level": level == null ? null : level,
    "is_auth": isAuth == null ? null : isAuth,
    "is_audio": isAudio == null ? null : isAudio,
    "device_id": deviceId == null ? null : deviceId,
    "last_login_time": lastLoginTime == null ? null : lastLoginTime,
    "tags": tags == null ? null : tags,
    "can_live": canLive == null ? null : canLive,
    "status": status == null ? null : status,
    "updated_at": updatedAt == null ? null : updatedAt,
    "created_at": createdAt == null ? null : createdAt,
    "avatar_origin": avatarOrigin == null ? null : avatarOrigin,
    "roles": roles == null ? null : List<dynamic>.from(roles.map((x) => x)),
    "is_vip": isVip == null ? null : isVip,
    "follow_num": followNum == null ? null : followNum,
    "my_follow_num": myFollowNum == null ? null : myFollowNum,
    "like_num": likeNum == null ? null : likeNum,
    "ref_num": refNum == null ? null : refNum,
    "tags_num": tagsNum == null ? null : tagsNum,
    "film_review_num": filmReviewNum == null ? null : filmReviewNum,
  };
}
