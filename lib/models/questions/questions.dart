// To parse this JSON data, do
//
//     final QuestionsAndAnswers = QuestionsAndAnswersFromJson(jsonString);

import 'dart:convert';

QuestionsAndAnswers QuestionsAndAnswersFromJson(String str) => QuestionsAndAnswers.fromJson(json.decode(str));

String QuestionsAndAnswersToJson(QuestionsAndAnswers data) => json.encode(data.toJson());

class QuestionsAndAnswers {
  List<Question> questions;
  int isFinish;

  QuestionsAndAnswers({
    required this.questions,
    required this.isFinish,
  });

  factory QuestionsAndAnswers.fromJson(Map<String, dynamic> json) => QuestionsAndAnswers(
    questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    isFinish: json["is_finish"],
  );

  Map<String, dynamic> toJson() => {
    "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    "is_finish": isFinish,
  };
}

class Question {
  int id;
  String content;
  dynamic info;
  int isActive;
  int type;
  int gender;
  int order;
  int categoryId;
  dynamic ansId;
  dynamic quId;
  int level;
  int isSkipable;
  int regId;
  DateTime createdAt;
  DateTime updatedAt;
  int isAnswer;
  dynamic answerContent;
  List<Answer> answers;

  Question({
    required this.id,
    required this.content,
    this.info,
    required this.isActive,
    required this.type,
    required this.gender,
    required this.order,
    required this.categoryId,
    this.ansId,
    required this.quId,
    required this.level,
    required this.isSkipable,
    required this.regId,
    required this.createdAt,
    required this.updatedAt,
    required this.isAnswer,
    this.answerContent,
    required this.answers,
  });

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
    answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_answer": isAnswer,
    "answer_content": answerContent,
    "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
  };
}

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

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
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

  Map<String, dynamic> toJson() => {
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
