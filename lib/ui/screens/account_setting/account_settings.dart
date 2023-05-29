import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/auth/login.dart';
import 'package:effa/ui/screens/dashboard/male_dashboard.dart';
import 'package:effa/ui/screens/my_account/my_account.dart';
import 'package:effa/ui/screens/reported_accounts/reported_account.dart';
import 'package:effa/ui/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class AccountSettings extends StatelessWidget {
  AccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGround,
      body: SingleChildScrollView(
        child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 155.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("././assets/image/account_img.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                Center(
                  child: Padding(
                      padding: EdgeInsets.only(top: 105.h),
                      child: CustomImage(
                        isNetwork: false,
                        "././assets/icon/profiles.png",
                        height: 96.h,
                        width: 96.w,
                        shape: true,
                        isShadow: false,
                      )
                  ),
                ),
              ]),
              Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
                    child: Text(
                      "ahmed ahmed",
                      style:
                       GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 22.sp),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Card(
                    elevation: 6,
                    shadowColor: black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0.h, horizontal: 15.w),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 18.0.h),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 153.w,
                                        // height: 119.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: red),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 24.0.h,
                                          ),
                                          child: Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                const Image(
                                                  image: AssetImage(
                                                      "././assets/icon/filt.png"),
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Text(
                                                  "100",
                                                  style:  GoogleFonts.cairo(
                                                      color: white,
                                                      fontSize: 30.sp,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 14.h,
                                            ),
                                            Text(
                                              "نقاطي",
                                              style:  GoogleFonts.cairo(
                                                  color: white,
                                                  fontSize: 16.sp),
                                            )
                                          ]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 153.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: basicPink),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 24.0.h,
                                          ),
                                          child: Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                const Image(
                                                  image: AssetImage(
                                                      "././assets/icon/profiles.png"),
                                                ),
                                                SizedBox(
                                                  width: 20.w,
                                                ),
                                                Text(
                                                  "210",
                                                  style:  GoogleFonts.cairo(
                                                      color: white,
                                                      fontSize: 30.sp,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 14.h,
                                            ),
                                            Text(
                                              "حسابات شاهدتها",
                                              style:  GoogleFonts.cairo(
                                                  color: white,
                                                  fontSize: 16.sp),
                                            )
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                          () => MyProfile(showEdit: true,),
                                      //next page class
                                      duration: const Duration(milliseconds:400),
                                      //duration of transitions, default 1 sec
                                      transition: Transition
                                          .leftToRight //transition effect
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0.h),
                                  child: _rowOption("././assets/icon/watch.png",
                                      "مشاهدة حسابي"
                                  ),
                                ),
                              ),
                              GestureDetector
                                (onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Report()));
                              },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0.h),
                                  child: _rowOption(
                                    "././assets/icon/edit2.png", "تعديل الحساب",
                                  ),
                                ),
                              ),
                              GestureDetector(

                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Report()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0.h),
                                  child: _rowOption("././assets/icon/unwatch.png",
                                      "تعطيل الحساب"),
                                ),
                              ),
                              GestureDetector
                                (onTap: () {
                                Get.to(
                                    Report(), //next page class
                                    duration: const Duration(milliseconds: 400), //duration of transitions, default 1 sec
                                    transition: Transition.leftToRight //transition effect
                                );

                              },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0.h),
                                  child: _rowOption("././assets/icon/report.png",
                                      "الابلاغ عن الحسابات"),
                                ),
                              ),
                              GestureDetector
                                (onTap: () {
                                Get.offAll(
                                    LoginPage(), //next page class
                                    duration: const Duration(milliseconds: 400), //duration of transitions, default 1 sec
                                    transition: Transition.leftToRight //transition effect
                                );
                              },
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5.0.h),
                                  child: _rowOption("././assets/icon/logout.png",
                                      "تسجيل الخروج"),
                                ),
                              )
                            ],
                          ),
                        ))),
              ),
            ]),
      ),
    );
  }

  Widget _rowOption(String icon, String txt) => Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: lbg,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.h),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(icon),
            size: 40,
            color: basicPink,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            txt,
            style:  GoogleFonts.cairo(
              fontSize: 16.sp,
            ),
          )
        ],
      ),
    ),
  );
}
