// To parse this JSON data, do
//
//     final NationalityModel = NationalityModelFromJson(jsonString);

class NationalityModel {
  dynamic id;
  String name;
  String fName;
  dynamic info;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  NationalityModel({
    required this.id,
    required this.name,
    required this.fName,
    this.info,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NationalityModel.fromJson(Map<dynamic, dynamic> json) =>
      NationalityModel(
        id: json["id"],
        name: json["name"],
        fName: json["fName"],
        info: json["info"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fName": fName,
        "info": info,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
