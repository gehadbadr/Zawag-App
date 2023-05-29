import 'package:carousel_slider/carousel_controller.dart';
import 'package:effa/helper/dio_helper.dart';
import 'package:effa/models/user/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as Dio;

class MyProfileController extends GetxController{
  bool gender = false;
   bool parentDataShow = false;
   bool isRequest = false;
  UserInfooo? user;
  bool loader =false;
   requestFatherData(){
     isRequest = true;
     print(isRequest);
     update();
   }
   cancelFather(){
     isRequest = false;
     update();
   }
   showParent(){
     parentDataShow = true;
     update();
   }
  List<ImagesUser> userImages =[];

  List<String> interests =[
    "fgdgdg",
    "jhkjk",
    "khjkjh",
    "hgfghfg",
  ];

  List<String> family =[
    "fgdgddfdsfg",
    "jhksdfjk",
    "khdsfjkjh",
    "hgdsfsdfghfg",
  ];

  List<String> study =[
    "fgdgddfdsfg",
    "jhksdfjk",
    "khdsfjkjh",
    "khdsfjkjh",
    "hgdsfsdfghfg",
  ];

  List<String> relegion =[
    "fgdgddfdsfg",
    "jhksdfjk",
    "jhksdfjk",
    "jhksdfjk",
    "jhksdfjk",
    "khdsfjkjh",
    "hgdsfsdfghfg",
  ];
  List<String> personal =[
    "fgdgddfdsfg",
    "fgdgddfdsfg",
    "jhksdfjk",
    "jhksdfjk",
    "khdsfjkjh",
    "hgdsfsdfghfg",
  ];

  int? totalDots;

  double currentIndex = 0.0;

  updateIndex(double i){
    currentIndex = i;
    update();
  }
  @override
  void onInit() {
    totalDots = userImages.length;
    fetchUserData();
    // TODO: implement onInit
    super.onInit();
  }
  Future <void> fetchUserData() async {
    try {
      loader = true;
      final Dio.Response response = await dio().get(
        'myData/4',
      );
      user = UserInfooo.fromJson(response.data);
      userImages = user!.images!;
      loader = false;
      update();
    } catch (err) {
      loader = false;
      update();
      Get.snackbar('خطأ في الاتصال', "NETWORK_ERR",
          snackPosition: SnackPosition.BOTTOM);
      print(err);
      // ignore: unnecessary_brace_in_string_interps
    }
  }
}