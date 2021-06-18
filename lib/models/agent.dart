// To parse this JSON data, do
//
//     final agentModel = agentModelFromJson(jsonString);

import 'dart:convert';

AgentModel agentModelFromJson(String str) => AgentModel.fromJson(json.decode(str));

String agentModelToJson(AgentModel data) => json.encode(data.toJson());

class AgentModel {
  AgentModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final AgentElement data;

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
    code: json["code"] == null ? null : json["code"],
    msg: json["msg"] == null ? null : json["msg"],
    data: json["data"] == null ? null : AgentElement.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "msg": msg == null ? null : msg,
    "data": data == null ? null : data.toJson(),
  };
}

class AgentElement {
  AgentElement({
    this.amount,
    this.integral,
    this.gold,
    this.performance,
    this.earnings,
    this.todayPerformance,
    this.todayEarnings,
  });

  final String amount;
  final int integral;
  final int gold;
  final dynamic performance;
  final dynamic earnings;
  final dynamic todayPerformance;
  final dynamic todayEarnings;

  factory AgentElement.fromJson(Map<String, dynamic> json) => AgentElement(
    amount: json["amount"] == null ? null : json["amount"],
    integral: json["integral"] == null ? null : json["integral"],
    gold: json["gold"] == null ? null : json["gold"],
    performance: json["performance"] == null ? null : json["performance"],
    earnings: json["earnings"] == null ? null : json["earnings"],
    todayPerformance: json["today_performance"] == null ? null : json["today_performance"],
    todayEarnings: json["today_earnings"] == null ? null : json["today_earnings"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount == null ? null : amount,
    "integral": integral == null ? null : integral,
    "gold": gold == null ? null : gold,
    "performance": performance == null ? null : performance,
    "earnings": earnings == null ? null : earnings,
    "today_performance": todayPerformance == null ? null : todayPerformance,
    "today_earnings": todayEarnings == null ? null : todayEarnings,
  };
}
