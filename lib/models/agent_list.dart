// To parse this JSON data, do
//
//     final agentListModel = agentListModelFromJson(jsonString);

import 'dart:convert';

AgentListModel agentListModelFromJson(String str) => AgentListModel.fromJson(json.decode(str));

String agentListModelToJson(AgentListModel data) => json.encode(data.toJson());

class AgentListModel {
  AgentListModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final List<AgentListElement> data;

  factory AgentListModel.fromJson(Map<String, dynamic> json) => AgentListModel(
    code: json["code"] == null ? null : json["code"],
    msg: json["msg"] == null ? null : json["msg"],
    data: json["data"] == null ? null : List<AgentListElement>.from(json["data"].map((x) => AgentListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "msg": msg == null ? null : msg,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AgentListElement {
  AgentListElement({
    this.level,
    this.title,
    this.num,
  });

  final int level;
  final String title;
  final int num;

  factory AgentListElement.fromJson(Map<String, dynamic> json) => AgentListElement(
    level: json["level"] == null ? null : json["level"],
    title: json["title"] == null ? null : json["title"],
    num: json["num"] == null ? null : json["num"],
  );

  Map<String, dynamic> toJson() => {
    "level": level == null ? null : level,
    "title": title == null ? null : title,
    "num": num == null ? null : num,
  };
}
