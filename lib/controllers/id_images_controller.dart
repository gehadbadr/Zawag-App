import 'dart:io';
import 'package:dio/dio.dart'as Dio;
import 'package:dio/dio.dart';
import 'package:effa/helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdImagesController extends GetxController{

  bool hide1 = false;
  bool hide2 = false;
  File image1 = File("");
  updateImage1(File file){
    hide2 =true;
    image1 = file;
    update();
  }

  File image2 = File("");
  updateImage2(File file){
    hide2 =true;
    image2 = file;
    update();
  }

  File image3 = File("");
  updateImage3(File file){
    hide1 =true;
    image3 = file;
    update();
  }
  Future<void> confirmInfo() async {
    UserImages user = UserImages();
    user.image1 = image1;
    user.image2 = image2;
    user.image3 = image3;
    var fields = Dio.FormData.fromMap({});
    try {
      Get.snackbar("يتم رفع الصوره", "برجاء الانتظار",
          borderRadius: 0,
          showProgressIndicator: true, duration: const Duration(seconds: 20));
      fields = Dio.FormData.fromMap({
        if(user.image1.path.isNotEmpty)
          'identity_face': await Dio.MultipartFile.fromFile(user.image1.path),
        if(user.image2.path.isNotEmpty)
          'identity_back': await Dio.MultipartFile.fromFile(user.image2.path),
        if(user.image3.path.isNotEmpty)
          'passport_image': await Dio.MultipartFile.fromFile(user.image3.path),
      });

      Dio.Response response = await dio().post('user_images', data: fields);
      if(response.statusCode == 200){
        Get.closeAllSnackbars();
        Get.snackbar("تم رفع الصور بنجاح", "",
            borderRadius: 0,
            backgroundColor: Colors.greenAccent,
            showProgressIndicator: false, duration: const Duration(seconds: 4));
      }
    }  on DioError catch (e) {
      print('Error=>${e.message}');

    }}

  bool pressed1 = false;

  bool pressed2 = false;

  bool pressed3 = false;
}
class UserImages {
  late File image1 ;
  late File image2 ;
  late File image3 ;


}
