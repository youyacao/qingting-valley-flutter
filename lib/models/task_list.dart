// To parse this JSON data, do
//
//     final taskListModel = taskListModelFromJson(jsonString);

import 'dart:convert';

TaskListModel taskListModelFromJson(String str) => TaskListModel.fromJson(json.decode(str));

String taskListModelToJson(TaskListModel data) => json.encode(data.toJson());

class TaskListModel {
  TaskListModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final Data data;

  factory TaskListModel.fromJson(Map<String, dynamic> json) => TaskListModel(
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
    this.dailyTask,
  });

  final List<TaskItemElement> dailyTask;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    dailyTask: json["DAILY_TASK"] == null ? null : List<TaskItemElement>.from(json["DAILY_TASK"].map((x) => TaskItemElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "DAILY_TASK": dailyTask == null ? null : List<dynamic>.from(dailyTask.map((x) => x.toJson())),
  };
}

class TaskItemElement {
  TaskItemElement({
    this.id,
    this.userId,
    this.type,
    this.name,
    this.title,
    this.needNum,
    this.integral,
    this.sort,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.hasNum,
    this.canReceive,
    this.isReceive,
  });

  final int id;
  final int userId;
  final String type;
  final String name;
  final String title;
  final int needNum;
  final int integral;
  final int sort;
  final int status;
  final String updatedAt;
  final String createdAt;
  final int hasNum;
  final int canReceive;
  final int isReceive;

  factory TaskItemElement.fromJson(Map<String, dynamic> json) => TaskItemElement(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    type: json["type"] == null ? null : json["type"],
    name: json["name"] == null ? null : json["name"],
    title: json["title"] == null ? null : json["title"],
    needNum: json["need_num"] == null ? null : json["need_num"],
    integral: json["integral"] == null ? null : json["integral"],
    sort: json["sort"] == null ? null : json["sort"],
    status: json["status"] == null ? null : json["status"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    hasNum: json["has_num"] == null ? null : json["has_num"],
    canReceive: json["can_receive"] == null ? null : json["can_receive"],
    isReceive: json["is_receive"] == null ? null : json["is_receive"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "type": type == null ? null : type,
    "name": name == null ? null : name,
    "title": title == null ? null : title,
    "need_num": needNum == null ? null : needNum,
    "integral": integral == null ? null : integral,
    "sort": sort == null ? null : sort,
    "status": status == null ? null : status,
    "updated_at": updatedAt == null ? null : updatedAt,
    "created_at": createdAt == null ? null : createdAt,
    "has_num": hasNum == null ? null : hasNum,
    "can_receive": canReceive == null ? null : canReceive,
    "is_receive": isReceive == null ? null : isReceive,
  };
}
