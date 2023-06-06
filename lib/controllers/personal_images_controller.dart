import 'dart:io';


import 'package:effa/helper/dio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as Dio;
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class PersonalImagesController extends GetxController{

  File myFile=File("");



  bool? isProfile;

  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  List<File> imageList = [];

  File image1 = File("");

  bool pressed1 = false;
  bool press = false;
  List<XFile>? selectedImages;
  bool loader = false;
  List<int> idList = [0];


  removeItemList(int i){
    imageFileList!.removeAt(i - 1);
    update();
  }

  selectImages() async {
    imageFileList!.clear();
    selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      for (int i = 0; i < selectedImages!.length ; i++) {
          imageFileList!.add(selectedImages![i]);
          update();
      }
    }
    print("Image List Length:" + imageFileList!.length.toString());
  }

  Future<void> updateImgs() async {
    loader = true;
    update();
    Map<String,dynamic> api ={
      "user_id": storage.read('userId'),
    };
    for (int i = 0;i<selectedImages!.length; i++){
      api['images[$i]'] = await Dio.MultipartFile.fromFile(selectedImages![i].path, filename: selectedImages![i].path);
    }
    Get.snackbar("يتم رفع الصوره", "برجاء الانتظار",
        showProgressIndicator: true, duration: const Duration(seconds: 20));
    try {
      Dio.Response response = await dio().post(
        'user_imagesmale',
        options: Options(
            followRedirects: false,
            receiveDataWhenStatusError: true,
            contentType: 'multipart/form-data'
        ),
        data: Dio.FormData.fromMap(api),
      );
      if(response.statusCode == 200){
        loader = false;
        update();
        Get.closeAllSnackbars();
        Get.snackbar("تم رفع الصور بنجاح", "",
            backgroundColor: Colors.greenAccent,
            showProgressIndicator: false, duration: const Duration(seconds: 4));
      }

    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      rethrow;
    }
  }
  pickImageGallery(BuildContext context)async{
    var imageServer;
    try {
      final pickedImage = await ImagePicker().pickImage(
          source: ImageSource.gallery);
      final pickedImageFile = File(pickedImage!.path);
      imageServer = Dio.MultipartFile.fromFileSync(
          pickedImageFile.path,
          filename: pickedImageFile.path
              .split('/')
              .last,
      );
      Get.snackbar("يتم رفع الصوره", "برجاء الانتظار",
          showProgressIndicator: true, duration: const Duration(seconds: 10));
      Dio.Response response = await dio().post(
        'update_profile_image',
        options: Options(
            contentType: 'multipart/form-data'
        ),
        data: Dio.FormData.fromMap({
          "image": imageServer
        }
        ),
      );
      if (kDebugMode) {
        print(response.data);
      }
      Navigator.pop(context);
      myFile = pickedImageFile;
       press = true;
      update();

      Get.closeAllSnackbars();
    }on PlatformException catch (e) {
      debugPrint("Failed to Pick Image :$e");
    }
  }

  pickImageCamera(BuildContext context)async{
    var imageServer;
    try {
      final pickedImagec = await ImagePicker().pickImage(
          source: ImageSource.gallery);
      final pickedImageFilec = File(pickedImagec!.path);
      imageServer = Dio.MultipartFile.fromFileSync(
        pickedImagec.path,
        filename: pickedImagec.path
            .split('/')
            .last,
      );
      Get.snackbar("يتم رفع الصوره", "برجاء الانتظار",
          showProgressIndicator: true, duration: const Duration(seconds: 10));
      Dio.Response response = await dio().post(
        'update_profile_image',
        options: Options(
            contentType: 'multipart/form-data'
        ),
        data: Dio.FormData.fromMap({
          "image": imageServer
        }
        ),
      );
      if (kDebugMode) {
        print(response.data);
      }
      Navigator.pop(context);
      myFile = pickedImageFilec;
      press = true;
      update();

      Get.closeAllSnackbars();
    }on PlatformException catch (e) {
      debugPrint("Failed to Pick Image :$e");
    }
  }

}