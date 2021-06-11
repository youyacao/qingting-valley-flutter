// To parse this JSON data, do
//
//     final configModel = configModelFromJson(jsonString);

import 'dart:convert';

ConfigModel configModelFromJson(String str) => ConfigModel.fromJson(json.decode(str));

String configModelToJson(ConfigModel data) => json.encode(data.toJson());

class ConfigModel {
  ConfigModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final ConfigElement data;

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
    code: json["code"] == null ? null : json["code"],
    msg: json["msg"] == null ? null : json["msg"],
    data: json["data"] == null ? null : ConfigElement.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "msg": msg == null ? null : msg,
    "data": data == null ? null : data.toJson(),
  };
}

class ConfigElement {
  ConfigElement({
    this.baseSiteStatus,
    this.baseVideoNeedLogin,
    this.baseVideoFreeTime,
    this.baseVideoFreeDuration,
    this.baseLiveNeedLogin,
    this.baseLiveFreeTime,
    this.baseLiveFreeDuration,
    this.baseVideoOpenCheck,
    this.baseDefaultAvatar,
    this.baseDefaultAvatarUrl,
    this.baseVideoStartSecond,
    this.baseVideoEndSecond,
    this.baseVideoShowAd,
    this.baseVideoFreeNum,
    this.baseLiveFreeNum,
    this.baseQq,
    this.baseGoldUnit,
    this.baseGoldMinAward,
    this.baseGoldMaxAward,
    this.baseLowWithdrawGold,
    this.baseShareUrl,
  });

  final String baseSiteStatus;
  final String baseVideoNeedLogin;
  final String baseVideoFreeTime;
  final String baseVideoFreeDuration;
  final String baseLiveNeedLogin;
  final String baseLiveFreeTime;
  final String baseLiveFreeDuration;
  final String baseVideoOpenCheck;
  final String baseDefaultAvatar;
  final String baseDefaultAvatarUrl;
  final String baseVideoStartSecond;
  final String baseVideoEndSecond;
  final String baseVideoShowAd;
  final String baseVideoFreeNum;
  final String baseLiveFreeNum;
  final String baseQq;
  final String baseGoldUnit;
  final String baseGoldMinAward;
  final String baseGoldMaxAward;
  final String baseLowWithdrawGold;
  final String baseShareUrl;

  factory ConfigElement.fromJson(Map<String, dynamic> json) => ConfigElement(
    baseSiteStatus: json["base_site_status"] == null ? null : json["base_site_status"],
    baseVideoNeedLogin: json["base_video_need_login"] == null ? null : json["base_video_need_login"],
    baseVideoFreeTime: json["base_video_free_time"] == null ? null : json["base_video_free_time"],
    baseVideoFreeDuration: json["base_video_free_duration"] == null ? null : json["base_video_free_duration"],
    baseLiveNeedLogin: json["base_live_need_login"] == null ? null : json["base_live_need_login"],
    baseLiveFreeTime: json["base_live_free_time"] == null ? null : json["base_live_free_time"],
    baseLiveFreeDuration: json["base_live_free_duration"] == null ? null : json["base_live_free_duration"],
    baseVideoOpenCheck: json["base_video_open_check"] == null ? null : json["base_video_open_check"],
    baseDefaultAvatar: json["base_default_avatar"] == null ? null : json["base_default_avatar"],
    baseDefaultAvatarUrl: json["base_default_avatar_url"] == null ? null : json["base_default_avatar_url"],
    baseVideoStartSecond: json["base_video_start_second"] == null ? null : json["base_video_start_second"],
    baseVideoEndSecond: json["base_video_end_second"] == null ? null : json["base_video_end_second"],
    baseVideoShowAd: json["base_video_show_ad"] == null ? null : json["base_video_show_ad"],
    baseVideoFreeNum: json["base_video_free_num"] == null ? null : json["base_video_free_num"],
    baseLiveFreeNum: json["base_live_free_num"] == null ? null : json["base_live_free_num"],
    baseQq: json["base_qq"] == null ? null : json["base_qq"],
    baseGoldUnit: json["base_gold_unit"] == null ? null : json["base_gold_unit"],
    baseGoldMinAward: json["base_gold_min_award"] == null ? null : json["base_gold_min_award"],
    baseGoldMaxAward: json["base_gold_max_award"] == null ? null : json["base_gold_max_award"],
    baseLowWithdrawGold: json["base_low_withdraw_gold"] == null ? null : json["base_low_withdraw_gold"],
    baseShareUrl: json["base_share_url"] == null ? null : json["base_share_url"],
  );

  Map<String, dynamic> toJson() => {
    "base_site_status": baseSiteStatus == null ? null : baseSiteStatus,
    "base_video_need_login": baseVideoNeedLogin == null ? null : baseVideoNeedLogin,
    "base_video_free_time": baseVideoFreeTime == null ? null : baseVideoFreeTime,
    "base_video_free_duration": baseVideoFreeDuration == null ? null : baseVideoFreeDuration,
    "base_live_need_login": baseLiveNeedLogin == null ? null : baseLiveNeedLogin,
    "base_live_free_time": baseLiveFreeTime == null ? null : baseLiveFreeTime,
    "base_live_free_duration": baseLiveFreeDuration == null ? null : baseLiveFreeDuration,
    "base_video_open_check": baseVideoOpenCheck == null ? null : baseVideoOpenCheck,
    "base_default_avatar": baseDefaultAvatar == null ? null : baseDefaultAvatar,
    "base_default_avatar_url": baseDefaultAvatarUrl == null ? null : baseDefaultAvatarUrl,
    "base_video_start_second": baseVideoStartSecond == null ? null : baseVideoStartSecond,
    "base_video_end_second": baseVideoEndSecond == null ? null : baseVideoEndSecond,
    "base_video_show_ad": baseVideoShowAd == null ? null : baseVideoShowAd,
    "base_video_free_num": baseVideoFreeNum == null ? null : baseVideoFreeNum,
    "base_live_free_num": baseLiveFreeNum == null ? null : baseLiveFreeNum,
    "base_qq": baseQq == null ? null : baseQq,
    "base_gold_unit": baseGoldUnit == null ? null : baseGoldUnit,
    "base_gold_min_award": baseGoldMinAward == null ? null : baseGoldMinAward,
    "base_gold_max_award": baseGoldMaxAward == null ? null : baseGoldMaxAward,
    "base_low_withdraw_gold": baseLowWithdrawGold == null ? null : baseLowWithdrawGold,
    "base_share_url": baseShareUrl == null ? null : baseShareUrl,
  };
}
