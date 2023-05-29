import 'package:get/get.dart';

class SettingPageController extends GetxController{
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
        isSwitched = true;
        update();
    } else {
        isSwitched = false;
        update();
    }
  }
}