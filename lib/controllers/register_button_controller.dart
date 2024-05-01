//
// import 'package:effa/helper/dio_helper.dart';
// import 'package:effa/helper/http_exeption.dart';
// import 'package:effa/models/nationality/nationality_model.dart';
// import 'package:effa/models/user/user_auth_model.dart';
// import 'package:effa/ui/screens/detailed%20_personal_data/detaild_data.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as Dio;
//
//
// class BasicPagesController extends GetxController {
//
//
//
//   double position = 0.20;
//
//
//
//   bool pressed = false;
//
//
//   int tapIndex = 0;
//
//
//
//
//
//
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//   }
//
//   void onTap() {
//     pageController.nextPage(
//         duration: const Duration(milliseconds: 250), curve: Curves.bounceInOut);
//     position += 0.20;
//     update();
//   }
//
//   Future<bool> onPrevious() async {
//     bool back = pageController.page == 0;
//     if (!back) {
//       await pageController.previousPage(
//           duration: const Duration(milliseconds: 250),
//           curve: Curves.bounceInOut);
//       position -= 0.20;
//       update();
//     }
//     return Future.value(back);
//   }
//
//
//
//   //fetchNationality
//
//
// }
