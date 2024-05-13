// To parse this JSON data, do
//
//     final TermsModel = TermsModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

TermsModel TermsModelFromJson(String str) =>
    TermsModel.fromJson(json.decode(str));

String TermsModelToJson(TermsModel data) => json.encode(data.toJson());

class TermsModel {
  String title;
  String content;

  TermsModel({
    required this.title,
    required this.content,
  });

  factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}

ShareLinkModel shareLinkModelFromJson(String str) =>
    ShareLinkModel.fromJson(json.decode(str));
String shareLinkModelToJson(TermsModel data) => json.encode(data.toJson());

class ShareLinkModel {
  String title;

  ShareLinkModel({
    required this.title,
  });

  factory ShareLinkModel.fromJson(Map<String, dynamic> json) => ShareLinkModel(
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}

class SocialsLinkModel {
  String whats_app, facebook, insta;

  SocialsLinkModel({
    required this.whats_app,
    required this.facebook,
    required this.insta,
  });

  factory SocialsLinkModel.fromJson(Map<String, dynamic> json) =>
      SocialsLinkModel(
        whats_app: json["whats_app"],
        facebook: json["facebook"],
        insta: json["insta"],
      );

  Map<String, dynamic> toJson() => {
        "whats_app": whats_app,
        "facebook": facebook,
        "insta": insta,
      };
}
