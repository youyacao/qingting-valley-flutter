// To parse this JSON data, do
//
//     final agreementModel = agreementModelFromJson(jsonString);

import 'dart:convert';

AgreementModel agreementModelFromJson(String str) => AgreementModel.fromJson(json.decode(str));

String agreementModelToJson(AgreementModel data) => json.encode(data.toJson());

class AgreementModel {
    AgreementModel({
        this.code,
        this.msg,
        this.data,
    });

    final int code;
    final String msg;
    final AgreementElement data;

    factory AgreementModel.fromJson(Map<String, dynamic> json) => AgreementModel(
        code: json["code"] == null ? null : json["code"],
        msg: json["msg"] == null ? null : json["msg"],
        data: json["data"] == null ? null : AgreementElement.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "msg": msg == null ? null : msg,
        "data": data == null ? null : data.toJson(),
    };
}

class AgreementElement {
    AgreementElement({
        this.userPolicyUrl,
        this.userAgreement,
    });

    final String userPolicyUrl;
    final String userAgreement;

    factory AgreementElement.fromJson(Map<String, dynamic> json) => AgreementElement(
        userPolicyUrl: json["user_policy_url"] == null ? null : json["user_policy_url"],
        userAgreement: json["user_agreement"] == null ? null : json["user_agreement"],
    );

    Map<String, dynamic> toJson() => {
        "user_policy_url": userPolicyUrl == null ? null : userPolicyUrl,
        "user_agreement": userAgreement == null ? null : userAgreement,
    };
}
