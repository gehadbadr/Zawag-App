import 'package:carousel_slider/carousel_controller.dart';
import 'package:effa/helper/dio_helper.dart';
import 'package:effa/models/user/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;

class MyProfileController extends GetxController {
  bool gender = false;
  bool parentDataShow = false;
  bool isRequest = false;
  UserInfooo? user;
  bool loader = false;
  requestFatherData() {
    isRequest = true;
    print("MyProfileController isRequest == ${isRequest}");
    update();
  }

  cancelFather() {
    isRequest = false;
    update();
  }

  showParent() {
    parentDataShow = true;
    update();
  }

  List<ImagesUser> userImages = [];

  List<String> interests = [];

  List<Question> family = [];

  List<Question> study = [];

  List<Question> relegion = [];

  List<Question> personal = [];

  int? totalDots;

  double currentIndex = 0.0;

  updateIndex(double i) {
    currentIndex = i;
    update();
  }

  @override
  void onInit() {
    fetchUserData();
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
}
