// To parse this JSON data, do
//
//     final messageBs = messageBsFromJson(jsonString);

import 'dart:convert';

MessageBs messageBsFromJson(String str) => MessageBs.fromJson(json.decode(str));

String messageBsToJson(MessageBs data) => json.encode(data.toJson());

class MessageBs {
  int? id;
  dynamic link;
  String? keyWord;
  String? type;
  String? lang;
  String? title;
  String? content;
  dynamic image;
  dynamic createdAt;
  dynamic updatedAt;

  MessageBs({
    this.id,
    this.link,
    this.keyWord,
    this.type,
    this.lang,
    this.title,
    this.content,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory MessageBs.fromJson(Map<String, dynamic> json) => MessageBs(
    id: json["id"],
    link: json["link"],
    keyWord: json["key_word"],
    type: json["type"],
    lang: json["lang"],
    title: json["title"],
    content: json["content"],
    image: json["image"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "link": link,
    "key_word": keyWord,
    "type": type,
    "lang": lang,
    "title": title,
    "content": content,
    "image": image,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
