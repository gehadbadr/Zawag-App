import 'package:effa/ui/screens/filter/unsubscribed_user.dart';
import 'package:effa/ui/screens/filter_option/filter_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FilterSwitchController extends GetxController{
  bool switchWidget = true;
  changeWidget(){
   switchWidget = false;
   update();
  }
}