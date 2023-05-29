import 'package:effa/ui/screens/account_setting/account_settings.dart';
import 'package:effa/ui/screens/filter/filter.dart';
import 'package:effa/ui/screens/home/home.dart';
import 'package:effa/ui/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaleDashboardController extends GetxController{
  List<Widget> pages = <Widget>[
    Home(),
    Filter(),
    AccountSettings(),
    Settings(),
  ];
  int selectedIndex = 0;

  void onItemTapped(int index) {
      selectedIndex = index;
   update();
  }
}