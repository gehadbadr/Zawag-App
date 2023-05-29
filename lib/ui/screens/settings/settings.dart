
import 'package:effa/controllers/setting_page_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/about_app/about_app.dart';
import 'package:effa/ui/screens/contact_with_us/contact_with_us.dart';
import 'package:effa/ui/screens/share_app/share_app.dart';
import 'package:effa/ui/widgets/saprator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);
  final controller = Get.lazyPut(() => SettingPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGround,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 25.0.h, horizontal: 15.w),
          child: Center(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 6,
                      shadowColor: black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                            vertical: 30.0.h, horizontal: 15.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const ImageIcon(
                                  AssetImage("././assets/icon/nextto.png"),
                                  color: basicPink,
                                  size: 30,
                                ),
                                Text(
                                  "الحساب",
                                  style:  GoogleFonts.cairo(fontSize: 18.sp , fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            Row(
                              children: [
                                const ImageIcon(
                                  AssetImage("././assets/icon/notify.png"),
                                  color: basicPink,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "الاشعارات ",
                                  style:  GoogleFonts.cairo(fontSize: 16.sp),
                                ),
                                const Spacer(),
                                GetBuilder<SettingPageController>(
                                  builder: (controller){
                                    return CupertinoSwitch(
                                      onChanged: controller.toggleSwitch,
                                      value: controller.isSwitched,
                                      activeColor: basicPink,
                                      trackColor: grey,
                                    );
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            const MySeparator(),
                            SizedBox(
                              height: 25.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                    Share(), //next page class
                                    duration: const Duration(milliseconds: 400), //duration of transitions, default 1 sec
                                    transition: Transition.leftToRight //transition effect
                                );
                              },
                              child: Row(
                                children: [
                                  const ImageIcon(
                                    AssetImage("././assets/icon/share.png"),
                                    color: basicPink,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "مشاركة التطبيق ",
                                    style:  GoogleFonts.cairo(fontSize: 16.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Card(
                      elevation: 6,
                      shadowColor: black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                            vertical: 30.0.h, horizontal: 15.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const ImageIcon(
                                  AssetImage("././assets/icon/nextto.png"),
                                  color: basicPink,
                                  size: 30,
                                ),
                                Text(
                                  "المزيد",
                                  style:  GoogleFonts.cairo(fontSize: 18.sp , fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            GestureDetector(
                              onTap: (() {
                                Get.to(
                                    Contact(), //next page class
                                    duration: const Duration(milliseconds: 400), //duration of transitions, default 1 sec
                                    transition: Transition.leftToRight //transition effect
                                );
                              }),
                              child: Row(
                                children: [
                                  const ImageIcon(
                                    AssetImage("././assets/icon/contact.png"),
                                    color: basicPink,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "تواصل معنا ",
                                    style:  GoogleFonts.cairo(fontSize: 16.sp),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            const MySeparator(),
                            SizedBox(
                              height: 20.h,
                            ),
                            GestureDetector(
                              onTap: (() {
                                Get.to(
                                    AboutApp(), //next page class
                                    duration: const Duration(milliseconds: 400), //duration of transitions, default 1 sec
                                    transition: Transition.leftToRight //transition effect
                                );
                              }),
                              child: Row(
                                children: [
                                  const ImageIcon(
                                    AssetImage("././assets/icon/about.png"),
                                    color: basicPink,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "عن التطبيق ",
                                    style: GoogleFonts.cairo(fontSize: 16.sp),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            const MySeparator(),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                const ImageIcon(
                                  AssetImage("././assets/icon/rate.png"),
                                  color: basicPink,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "تقييم التطبيق ",
                                  style:  GoogleFonts.cairo(fontSize: 16.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding:  EdgeInsets.only(top: 18.0.h, bottom: 18.h),
                        child: Text(
                          "كن علي اتصال",
                          style:  GoogleFonts.cairo(
                              fontSize: 16.sp),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 20.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: const AssetImage("././assets/icon/insta.png"),
                            width:48.w ,
                            height: 48.h,
                          ),

                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 3.0.w),
                            child: Image(
                              image:
                              const AssetImage("././assets/icon/messenger.png"),
                              width:48.w ,
                              height: 48.h,
                            ),
                          ),
                          Image(
                            image: const AssetImage("././assets/icon/whats.png" ,

                            ),
                            width:48.w ,
                            height: 48.h,
                          ),

                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
