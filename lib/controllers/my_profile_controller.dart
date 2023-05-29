import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyProfileController extends GetxController{
  bool gender = false;
   bool parentDataShow = false;
   bool isRequest = false;
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
  List<String> userImages =[
    "https://www.pngall.com/wp-content/uploads/5/Cool-Model-Man.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE7R3na3f6i4udmTbnaRyZce2nQiYwSFMiYUB82n1w_wvQ_xCHbOqhEe_6Eok-TDyIS-8&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkIzYybsGnqetUlTz4io4EBsimplksJJjfdOINua8PQxuCPyeLHGFWB6TzrywnJuBK95o&usqp=CAU",
    "https://img.favpng.com/17/20/21/hairstyle-fashion-layered-hair-male-png-favpng-zjDeqZ0cBmzgv4ZA8h1TCvF2v.jpg",
  ];

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
    // TODO: implement onInit
    super.onInit();
  }

}