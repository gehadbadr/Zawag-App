// To parse this JSON data, do
//
//     final UserAuth = UserAuthFromJson(jsonString);

import 'dart:convert';

UserAuth UserAuthFromJson(String str) => UserAuth.fromJson(json.decode(str));

String UserAuthToJson(UserAuth data) => json.encode(data.toJson());

class UserAuth {
  String? accessToken;
  User? user;

  UserAuth({
    this.accessToken,
    this.user,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) => UserAuth(
    accessToken: json["accessToken"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  dynamic frName;
  dynamic lsName;
  dynamic faName;
  dynamic idNumber;
  dynamic image;
  int? isLogin;
  int? isComplet;
  int? gender;
  int? isBlock;
  int? isWait;
  dynamic phoneCode;
  String? phone;
  String? userCode;
  dynamic countryId;
  dynamic country;
  int? isNew;
  dynamic govId;
  dynamic cityId;
  dynamic lastLoginAt;
  int? religionId;
  dynamic birthDate;
  String? slug;
  dynamic identityFace;
  dynamic identityBack;
  dynamic passportImage;
  int? isApproved;
  dynamic rejectResson;
  dynamic aboutYou;
  int? isAcceptTerms;
  dynamic aboutPartner;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fullName;

  User({
    this.id,
    this.frName,
    this.lsName,
    this.faName,
    this.idNumber,
    this.image,
    this.isLogin,
    this.isComplet,
    this.gender,
    this.isBlock,
    this.isWait,
    this.phoneCode,
    this.phone,
    this.userCode,
    this.countryId,
    this.country,
    this.isNew,
    this.govId,
    this.cityId,
    this.lastLoginAt,
    this.religionId,
    this.birthDate,
    this.slug,
    this.identityFace,
    this.identityBack,
    this.passportImage,
    this.isApproved,
    this.rejectResson,
    this.aboutYou,
    this.isAcceptTerms,
    this.aboutPartner,
    this.createdAt,
    this.updatedAt,
    this.fullName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    frName: json["frName"],
    lsName: json["lsName"],
    faName: json["FaName"],
    idNumber: json["idNumber"],
    image: json["image"],
    isLogin: json["is_login"],
    isComplet: json["is_complet"],
    gender: json["gender"],
    isBlock: json["is_block"],
    isWait: json["is_wait"],
    phoneCode: json["phone_Code"],
    phone: json["phone"],
    userCode: json["user_code"],
    countryId: json["country_id"],
    country: json["country"],
    isNew: json["is_new"],
    govId: json["gov_id"],
    cityId: json["city_id"],
    lastLoginAt: json["lastLoginAt"],
    religionId: json["religion_id"],
    birthDate: json["birth_date"],
    slug: json["slug"],
    identityFace: json["identity_face"],
    identityBack: json["identity_back"],
    passportImage: json["passport_image"],
    isApproved: json["is_approved"],
    rejectResson: json["reject_resson"],
    aboutYou: json["about_you"],
    isAcceptTerms: json["is_accept_terms"],
    aboutPartner: json["about_partner"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "frName": frName,
    "lsName": lsName,
    "FaName": faName,
    "idNumber": idNumber,
    "image": image,
    "is_login": isLogin,
    "is_complet": isComplet,
    "gender": gender,
    "is_block": isBlock,
    "is_wait": isWait,
    "phone_Code": phoneCode,
    "phone": phone,
    "user_code": userCode,
    "country_id": countryId,
    "country": country,
    "is_new": isNew,
    "gov_id": govId,
    "city_id": cityId,
    "lastLoginAt": lastLoginAt,
    "religion_id": religionId,
    "birth_date": birthDate,
    "slug": slug,
    "identity_face": identityFace,
    "identity_back": identityBack,
    "passport_image": passportImage,
    "is_approved": isApproved,
    "reject_resson": rejectResson,
    "about_you": aboutYou,
    "is_accept_terms": isAcceptTerms,
    "about_partner": aboutPartner,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "full_name": fullName,
  };
}
