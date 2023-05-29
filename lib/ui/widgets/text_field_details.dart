
import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldDetails extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintTxt;
  const TextFieldDetails(
      {Key? key,
        this.controller,
        this.validator,
        this.hintTxt})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        cursorColor: basicPink,
        maxLines: 6,
        minLines: 6,
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
          hintText: hintTxt,
          hintStyle: TextStyle(fontSize: 14.sp),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey, width: 2.w),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey, width: 2.w),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
class TextFieldDetails2 extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintTxt;
  const TextFieldDetails2(
      {Key? key,
        this.controller,
        this.validator,
        this.hintTxt})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        cursorColor: basicPink,
        maxLines: 6,
        minLines: 6,
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
          hintText: hintTxt,
          hintStyle: TextStyle(fontSize: 14.sp),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey, width: 2.w),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey, width: 2.w),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
