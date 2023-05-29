import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MainButton extends StatelessWidget {
  Widget title;
  VoidCallback function;
  bool isEnd;
  Color background;
  MainButton({Key? key, required this.function, required this.title,required this.isEnd,required this.background}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnd?function:null,
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: title
        ),
      ),
    );
  }
}

