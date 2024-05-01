import 'package:effa/controllers/switch_filter_controllrt.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class UnsubscribedUser extends GetView<FilterSwitchController>{
  final controller = Get.find<FilterSwitchController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterSwitchController>(
      builder: (controller){
        return  Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0.h),
              child: Center(
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Row(children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 100.w,
                       // height: 48.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12), color: red),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("././assets/icon/filter_icon.svg"),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "150",
                              style: GoogleFonts.cairo(
                                  color: white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  SvgPicture.asset("././assets/image/filter.svg"),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: basicPink,
                            width: 2.w,
                          )),
                      child: TextButton(
                          onPressed: () {
            
                            controller.changeWidget();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("././assets/icon/filter_icon.svg"),
                              // width: 30,
            
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "100",
                                style: GoogleFonts.cairo(
                                    color: basicPink,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "اتاحة الفلتر لمدة7أيام  ",
                                style: GoogleFonts.cairo(color: basicPink, fontSize: 14.sp),
                              ),
                              SvgPicture.asset(
                                "././assets/icon/tab3.svg",
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                    child: Container(
                      decoration: BoxDecoration(
                          color: basicPink,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: basicPink,
                            width: 2.w,
                          )),
                      child: TextButton(
                          onPressed: () {
                            controller.changeWidget();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => FilterOptions()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("././assets/icon/filter_icon.svg"),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "150",
                                style: GoogleFonts.cairo(
                                    color: white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "اتاحة الفلتر لمدة15أيام  ",
                                style: GoogleFonts.cairo(color: white, fontSize: 14.sp),
                              ),
                              SvgPicture.asset(
                                "././assets/icon/tab3.svg",
                                color: white,
                              ),
                            ],
                          )),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
