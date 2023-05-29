import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterOptionsControllers extends GetxController{
  RangeValues currentRangeValuesTall =  const RangeValues(0, 100);
  RangeValues currentRangeValuesAge =  const RangeValues(0, 100);

  String? selectedValue = null;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "USA", child: Text("USA")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItems;
  }
}