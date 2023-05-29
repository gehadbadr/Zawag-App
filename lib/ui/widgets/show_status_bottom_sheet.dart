import 'dart:ui';

import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

void showStatus(BuildContext ctx) {
  showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: white,
                      elevation: 6,
                      shadowColor: black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20.w,
                            right: 20.w,
                            top: 25.h,
                            bottom: 30.h),
                        child: Column(children: [
                          SvgPicture.asset(
                            "assets/image/messagee.svg",
                            width: 295.86.w,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0.h),
                            child: Text(
                              "تم الأرسال",
                              style: GoogleFonts.cairo(
                                  color: basicPink,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "في انتظار مراجعة الحساب الخاص بك برجاء الانتظار حتي يتم الانتهاء",
                                  style: GoogleFonts.cairo(fontSize: 16.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                            child: Text(
                              "يمكنك التواصل من خلال",
                              style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold, fontSize: 16.sp),
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: SvgPicture.asset(
                                    "assets/icon/icon1.svg",
                                    width: 46.w,
                                    height: 46.h,
                                  ),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    "assets/icon/icon2.svg",
                                    width: 46.w,
                                    height: 46.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 13.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/icon/instagram.png",
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            " * عادة مايتم المراجعة خلال 24 ساعة من فضلك كن صبورا  *",
                            style: GoogleFonts.cairo(color: gmGrey, fontSize: 11.sp),
                          )
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ])),
        );
      });
}
