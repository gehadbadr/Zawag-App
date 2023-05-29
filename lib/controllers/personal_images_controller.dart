import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PersonalImagesController extends GetxController{

  File myFile=File("");

  bool? press;

  bool? isProfile;

  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  List<File> imageList = [];

  File image1 = File("");

  bool pressed1 = false;

  removeItemList(int i){
    imageFileList!.removeAt(i - 1);
    update();
  }

  selectImages() async {
    imageFileList!.clear();
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      for (int i = 0; i < selectedImages.length ; i++) {
          imageFileList!.add(selectedImages[i]);
          update();
      }
    }
    print("Image List Length:" + imageFileList!.length.toString());
  }

  pickImageGallery(BuildContext context)async{
    try {
      final pickedImage = await ImagePicker().pickImage(
          source: ImageSource.gallery);
      final pickedImageFile = File(pickedImage!.path);
      myFile = pickedImageFile;
      press = true;
      update();
      Navigator.pop(context);
    }on PlatformException catch (e) {
      debugPrint("Failed to Pick Image :$e");
    }
  }

  pickImageCamera(BuildContext context)async{
    try {
      final pickedImagec = await ImagePicker()
          .pickImage(source: ImageSource.camera);

      final pickedImageFilec =
      File(pickedImagec!.path);
        myFile = pickedImageFilec;
        press = true;
        Navigator.pop(context);
        Navigator.pop(context);

    } on PlatformException catch (e) {
      debugPrint("Failed to Pick Image :$e");
    }
  }

}