import 'dart:io';

import 'package:get/get.dart';

class IdImagesController extends GetxController{
  File image1 = File("");
  updateImage1(File file){
    image1 = file;
    update();
  }

  File image2 = File("");
  updateImage2(File file){
    image2 = file;
    update();
  }

  File image3 = File("");
  updateImage3(File file){
    image3 = file;
    update();
  }

  bool pressed1 = false;

  bool pressed2 = false;

  bool pressed3 = false;
}