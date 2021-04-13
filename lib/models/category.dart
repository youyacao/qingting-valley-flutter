// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.code,
    this.msg,
    this.data,
  });

  final int code;
  final String msg;
  final List<Datum> data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    code: json["code"] == null ? null : json["code"],
    msg: json["msg"] == null ? null : json["msg"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "msg": msg == null ? null : msg,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.icon,
    this.level,
    this.pid,
    this.sort,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.children,
  });

  final int id;
  final String name;
  final String icon;
  final int level;
  final int pid;
  final int sort;
  final int status;
  final DateTime updatedAt;
  final DateTime createdAt;
  final List<Datum> children;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    icon: json["icon"] == null ? null : json["icon"],
    level: json["level"] == null ? null : json["level"],
    pid: json["pid"] == null ? null : json["pid"],
    sort: json["sort"] == null ? null : json["sort"],
    status: json["status"] == null ? null : json["status"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    children: json["children"] == null ? null : List<Datum>.from(json["children"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "icon": icon == null ? null : icon,
    "level": level == null ? null : level,
    "pid": pid == null ? null : pid,
    "sort": sort == null ? null : sort,
    "status": status == null ? null : status,
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "children": children == null ? null : List<dynamic>.from(children.map((x) => x.toJson())),
  };
}
