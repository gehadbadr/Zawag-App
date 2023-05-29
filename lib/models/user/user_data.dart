
import 'dart:convert';
import 'package:effa/models/user/user_auth_model.dart';



UserInfooo welcomeFromJson(String str) => UserInfooo.fromJson(json.decode(str));

String welcomeToJson(UserInfooo data) => json.encode(data.toJson());



class UserInfooo {
  UserInfooo({
    this.user,
    this.images,
    this.categories,
    this.socialSituation,
    this.job,
    this.education,
    this.nationality,
    this.address,
    this.interests,
  });

  User? user;
  List<ImagesUser>? images;
  List<Category>? categories;
  String? socialSituation;
  String? job;
  String? education;
  String? nationality;
  String? address;
  List<String>? interests;

  factory UserInfooo.fromJson(Map<String, dynamic> json) => UserInfooo(
    user: User.fromJson(json["user"]),
    images: List<ImagesUser>.from(json["images"].map((x) => ImagesUser.fromJson(x))),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    socialSituation: json["SocialSituation"],
    job: json["job"],
    education: json["education"],
    nationality: json["nationality"],
    address: json["address"],
    interests: List<String>.from(json["interests"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "user": user!.toJson(),
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
    "SocialSituation": socialSituation,
    "job": job,
    "education": education,
    "nationality": nationality,
    "address": address,
    "interests": List<dynamic>.from(interests!.map((x) => x)),
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.info,
    this.isActive,
    this.reId,
    this.createdAt,
    this.updatedAt,
    this.questions,
  });

  int? id;
  String? name;
  dynamic info;
  int? isActive;
  int? reId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Question>? questions;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    info: json["info"],
    isActive: json["is_active"],
    reId: json["re_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "info": info,
    "is_active": isActive,
    "re_id": reId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "questions": List<dynamic>.from(questions!.map((x) => x.toJson())),
  };
}

class Question {
  Question({
    this.id,
    this.content,
    this.info,
    this.isActive,
    this.type,
    this.gender,
    this.order,
    this.categoryId,
    this.ansId,
    this.quId,
    this.level,
    this.isSkipable,
    this.regId,
    this.createdAt,
    this.updatedAt,
    this.isAnswer,
    this.answerContent,
  });

  int? id;
  String? content;
  dynamic info;
  int? isActive;
  int? type;
  int? gender;
  int? order;
  int? categoryId;
  int? ansId;
  int?quId;
  int?level;
  int? isSkipable;
  int? regId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isAnswer;
  String? answerContent;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"],
    content: json["content"],
    info: json["info"],
    isActive: json["is_active"],
    type: json["type"],
    gender: json["gender"],
    order: json["order"],
    categoryId: json["category_id"],
    ansId: json["ans_id"],
    quId: json["qu_id"],
    level: json["level"],
    isSkipable: json["is_skipable"],
    regId: json["reg_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isAnswer: json["is_answer"],
    answerContent: json["answer_content"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "info": info,
    "is_active": isActive,
    "type": type,
    "gender": gender,
    "order": order,
    "category_id": categoryId,
    "ans_id": ansId,
    "qu_id": quId,
    "level": level,
    "is_skipable": isSkipable,
    "reg_id": regId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "is_answer": isAnswer,
    "answer_content": answerContent,
  };
}

class ImagesUser {
  ImagesUser({
    this.id,
    this.image,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? image;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ImagesUser.fromJson(Map<String, dynamic> json) => ImagesUser(
    id: json["id"],
    image: json["image"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "user_id": userId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
