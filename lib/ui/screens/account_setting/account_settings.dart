import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/auth/login.dart';
import 'package:effa/ui/screens/my_account/my_account.dart';
import 'package:effa/ui/screens/reported_accounts/reported_account.dart';
import 'package:effa/ui/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/male_dashboard_controller.dart';
import '../detailed _personal_data/detaild_data.dart';

class AccountSettings extends StatelessWidget {
  AccountSettings({Key? key}) : super(key: key);
  final controller = Get.lazyPut(() => MaleDashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bGround,
        body: SingleChildScrollView(
          child: GetBuilder<MaleDashboardController>(
            builder: (controller) {
              return Column(children: [
                Stack(children: [
                  Container(
                    height: 120.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("././assets/image/account_img.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Center(
                    child: Padding(
                        padding: EdgeInsets.only(top: 60.h),
                        child: CustomImage(
                          isNetwork: true,
                          //   "${controller.user?.images?.isEmpty}" == "true"?"https://www.iconpacks.net/icons/2/free-user-icon-3296-thumb.png":"${ApiConstants.baseUrl}${controller.user?.images?.first}",
                          "https://www.iconpacks.net/icons/2/free-user-icon-3296-thumb.png",
                          height: 96.h,
                          width: 96.w,
                          shape: true,
                          isShadow: false,
                        )),
                  ),
                ]),
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                  child: Text(
                    " ${controller.user?.user?.frName} ${controller.user?.user?.lsName}",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold, fontSize: 22.sp),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white70, width: 1),
                      boxShadow: const [
                        BoxShadow(
                            color: gGrey,
                            spreadRadius: 0.2,
                            blurRadius: 4,
                            offset: Offset(0, 3)),
                      ],
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0.h, horizontal: 12.w),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 12.0.h),
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
                                                Image(
                                                  image: const AssetImage(
                                                      "././assets/icon/filt.png"),
                                                  height: 36.h,
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Text(
                                                  "${controller.user?.user?.points}",
                                                  style: GoogleFonts.cairo(
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
                                              style: GoogleFonts.cairo(
                                                  color: white,
                                                  fontSize: 16.sp),
                                            )
                                          ]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 18.w,
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
                                                Image(
                                                  image: const AssetImage(
                                                    "././assets/icon/profiles.png",
                                                  ),
                                                  height: 36.h,
                                                ),
                                                SizedBox(
                                                  width: 20.w,
                                                ),
                                                Text(
                                                  controller.user!.user!.points
                                                      .toString(),
                                                  style: GoogleFonts.cairo(
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
                                              style: GoogleFonts.cairo(
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
                                      () => MyProfile(
                                            showEdit: true,
                                          ),
                                      //next page class
                                      duration:
                                          const Duration(milliseconds: 400),
                                      //duration of transitions, default 1 sec
                                      transition: Transition
                                          .leftToRight //transition effect
                                      );
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 3.0.h),
                                  child: _rowOption("././assets/icon/watch.png",
                                      "مشاهدة حسابي"),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => DetailedInfo(
                                        showEdit: true,
                                      ));
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 3.0.h),
                                  child: _rowOption(
                                    "././assets/icon/edit2.png",
                                    "تعديل الحساب",
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
                                  padding:
                                      EdgeInsets.symmetric(vertical: 3.0.h),
                                  child: _rowOption(
                                      "././assets/icon/unwatch.png",
                                      "تعطيل الحساب"),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => Report(), //next page class
                                      duration: const Duration(
                                          milliseconds:
                                              400), //duration of transitions, default 1 sec
                                      transition: Transition
                                          .leftToRight //transition effect
                                      );
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 3.0.h),
                                  child: _rowOption(
                                      "././assets/icon/report.png",
                                      "الابلاغ عن الحسابات"),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.offAll(LoginPage(), //next page class
                                      duration: const Duration(
                                          milliseconds:
                                              400), //duration of transitions, default 1 sec
                                      transition: Transition
                                          .leftToRight //transition effect
                                      );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: 3.0.h),
                                  child: _rowOption(
                                      "././assets/icon/logout.png",
                                      "تسجيل الخروج"),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ]);
            },
          ),
        ));
  }

  Widget _rowOption(String icon, String txt) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: lbg,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 10.w),
          child: Row(
            children: [
              ImageIcon(
                AssetImage(icon),
                size: 25.h,
                color: basicPink,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                txt,
                style: GoogleFonts.cairo(
                  fontSize: 16.sp,
                ),
              )
            ],
          ),
        ),
      );
}
