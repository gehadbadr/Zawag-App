import 'package:effa/helper/dio_helper.dart';
import 'package:effa/helper/http_exeption.dart';

import 'package:effa/models/user/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

class ProgressController extends GetxController {
  bool gender = false;
  bool parentDataShow = false;
  bool isRequest = false;
  UserInfooo? user;
  bool loader = false;

  bool personalDone = false;
  bool relegionDone = false;
  bool studyDone = false;
  bool familyDone = false;
  bool interestsDone = false;
  bool imageDone = false;
  double progress = 0.4;

  List<ImagesUser> userImages = [];

  List<String> interests = [];

  List<Question> family = [];

  List<Question> study = [];

  List<Question> relegion = [];

  List<Question> personal = [];

  int? totalDots;

  @override
  void onInit() async {
    fetchUserData();
    getProgress();
    getPersonalCompelete();
    getStudyCompelete();
    getFamilyCompelete();
    getRelegionCompelete();
    getImagesCompelete();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> fetchUserData() async {
    try {
      loader = true;
      final Dio.Response response = await dio().get(
        'myData',
      );
      user = UserInfooo.fromJson(response.data);
      userImages = user!.images!;
      personal = user!.categories![0].questions!;
      relegion = user!.categories![1].questions!;
      study = user!.categories![2].questions!;
      family = user!.categories![3].questions!;
      interests = user!.interests!;

      if (user!.images!.isEmpty) {
        totalDots = 1;
      } else {
        totalDots = userImages.length;
      }
      loader = false;
      update();
    } catch (err) {
      loader = false;
      update();
      Get.snackbar('خطأ في الاتصال', "NETWORK_ERR",
          borderRadius: 0, snackPosition: SnackPosition.BOTTOM);
      print("MyProfileController error == ${err.toString()}");
      // ignore: unnecessary_brace_in_string_interps
    }
  }

  void getPersonalCompelete() {
    int personalnum = 0;
    for (var i = 0; i < personal.length; i++) {
      if (personal[i].answerContent != null) {
        personalnum++;
      }
    }
    if (personalnum == personal.length ) {
      personalDone = true;
    }

    update();
  }

  void getRelegionCompelete() {
    int relegionNum = 0;
    for (var i = 0; i < relegion.length; i++) {
      if (relegion[i].answerContent != null) {
        relegionNum++;
      }
    }
    if (relegionNum == relegion.length) {
      relegionDone = true;
    }

    update();
  }

  void getStudyCompelete() {
    int studyNum = 0;
    for (var i = 0; i < study.length; i++) {
      if (study[i].answerContent != null) {
        studyNum++;
      }
    }
    if (studyNum == study.length) {
      studyDone = true;
    }
    update();
  }

  void getFamilyCompelete() {
    int familyNum = 0;
    for (var i = 0; i < family.length; i++) {
      if (family[i].answerContent != null) {
        familyNum++;
      }
    }
    if (familyNum == family.length) {
      familyDone = true;
    }
    update();
  }

  void getImagesCompelete() {
    int imageNum = 0;
    for (var i = 0; i < userImages.length; i++) {
      if (userImages[i].image != null) {
        imageNum++;
      }
    }
    if (imageNum == userImages.length) {
      imageDone = true;
    }
    update();
  }

  void getParentCompelete() {
    int familyNum = 0;
    for (var i = 0; i < family.length; i++) {
      if (family[i].answerContent != null) {
        familyNum++;
      }
    }
    if (familyNum == family.length) {
      familyDone = true;
    }
    update();
  }

  void getProgress() {
    if (personal.isNotEmpty) {
      progress += 0.1;
    }
    if (relegion.isNotEmpty) {
      progress += 0.1;
    }
    if (study.isNotEmpty) {
      progress += 0.1;
    }
    if (family.isNotEmpty) {
      progress += 0.1;
    }
    if (interests.isNotEmpty &&
        user?.user?.aboutYou != null &&
        user?.user?.aboutPartner != null) {
      progress += 0.1;
    }
    if (gender == false) {
      if (userImages.isNotEmpty) {
        progress += 0.1;
      }
    } else {
      if (family.isNotEmpty) {
        progress += 0.1;
      }
    }

    update();
  }
}
