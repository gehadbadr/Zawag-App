import 'dart:convert';

class Answer {
  int id;
  String content;
  int deg;
  dynamic info;
  int isActive;
  int type;
  int quId;
  int? relatedQuId;
  DateTime createdAt;
  DateTime updatedAt;
  int isAnswer;

  Answer({
    required this.id,
    required this.content,
    required this.deg,
    this.info,
    required this.isActive,
    required this.type,
    required this.quId,
    this.relatedQuId,
    required this.createdAt,
    required this.updatedAt,
    required this.isAnswer,
  });

  factory Answer.fromRawJson(String str) => Answer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Answer.fromJson(Map<dynamic, dynamic> json) => Answer(
    id: json["id"],
    content: json["content"],
    deg: json["deg"],
    info: json["info"],
    isActive: json["is_active"],
    type: json["type"],
    quId: json["qu_id"],
    relatedQuId: json["related_qu_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isAnswer: json["is_answer"],
  );

  Map<dynamic, dynamic> toJson() => {
    "id": id,
    "content": content,
    "deg": deg,
    "info": info,
    "is_active": isActive,
    "type": type,
    "qu_id": quId,
    "related_qu_id": relatedQuId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_answer": isAnswer,
  };
}