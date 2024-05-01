import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/setting_page_controller.dart';

class AboutApp extends StatelessWidget {
  final controller = Get.lazyPut(() => SettingPageController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        shadowColor: lliGrey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: white,
        title: Center(
          child: Text(
            "عن التطبيق",
            style: GoogleFonts.cairo(
                color: black,
                fontSize: 18.sp),
          ),
        ),
          actions: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("./././assets/icon/arrow_back.png"),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
            ],
        leading: Container(),
      ),
      body: Padding(
        padding:
        EdgeInsets.only(top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 25.h, bottom: 3.h),
            child: Center(
              child: Image.asset(
                "assets/image/logo.png",
                width: 132.18.w,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 343.w,
                height: 498.h,
                margin: const EdgeInsets.all(10.0),
                padding:
                const EdgeInsets.only(bottom: 9.0, left: 9.0, right: 9.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: gGrey, width: 0.7.w, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
                child: SafeArea(
                  child: RawScrollbar(
                    thumbColor: basicPink,
                    radius: const Radius.circular(20),
                    thickness: 5,
                    interactive: true,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(), 
                      // for Vertical scrolling
                      scrollDirection: Axis.vertical,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 8.0.w,
                              right: 8.0.w,
                              bottom: 10.0.h),
                          child: GetBuilder<SettingPageController>(
                              builder: (controller) {
                                return controller.loader
                                    ?  Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top:175.h),
                                    child: const CircularProgressIndicator(
                                      color: basicPink,
                                    ),
                                  ),
                                )
                                    : Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.h,
                                            bottom: 30.h),
                                        child: Text(
                                          "controller.aboutModel!.title",
                                          style: GoogleFonts.cairo(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                       " controller.aboutModel!.content",
                                        style: GoogleFonts.cairo(
                                          color: lGrey,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                          letterSpacing: 1,
                                          wordSpacing: 1,
                                        ),
                                      )
                                    ]);
                              }),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
