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
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);
  SettingPageController controller =
      Get.put(SettingPageController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPageController>(builder: (controller) {
      return Scaffold(
          backgroundColor: bGround,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0.h, horizontal: 15.w),
              child: Center(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
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
                                vertical: 30.0.h, horizontal: 15.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ImageIcon(
                                      const AssetImage(
                                          "././assets/icon/nextto.png"),
                                      color: basicPink,
                                      size: 28.h,
                                    ),
                                    Text(
                                      "الحساب",
                                      style: GoogleFonts.cairo(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  children: [
                                    ImageIcon(
                                      const AssetImage(
                                          "././assets/icon/notify.png"),
                                      color: basicPink,
                                      size: 24.h,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "الاشعارات ",
                                      style: GoogleFonts.cairo(fontSize: 16.sp),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      height: 30.h,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: CupertinoSwitch(
                                          onChanged: controller.toggleSwitch,
                                          value: controller.isSwitched,
                                          activeColor: basicPink,
                                          trackColor: grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                const MySeparator(
                                  color: Color(0xffCBCBCB),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(Share(), //next page class
                                        duration:
                                            const Duration(milliseconds: 400),
                                        //duration of transitions, default 1 sec
                                        transition: Transition
                                            .leftToRight //transition effect
                                        );
                                  },
                                  child: Row(
                                    children: [
                                      ImageIcon(
                                        const AssetImage(
                                            "././assets/icon/share.png"),
                                        color: basicPink,
                                        size: 24.h,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "مشاركة التطبيق ",
                                        style:
                                            GoogleFonts.cairo(fontSize: 16.sp),
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
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white70, width: 1),
                            boxShadow: [
                              BoxShadow(
                                  color: gGrey,
                                  spreadRadius: 0.2,
                                  blurRadius: 4,
                                  offset: Offset(0, 3)),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 30.0.h, horizontal: 15.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ImageIcon(
                                      const AssetImage(
                                          "././assets/icon/nextto.png"),
                                      color: basicPink,
                                      size: 28.h,
                                    ),
                                    Text(
                                      "المزيد",
                                      style: GoogleFonts.cairo(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                GestureDetector(
                                  onTap: (() {
                                    Get.to(Contact(), //next page class
                                        duration:
                                            const Duration(milliseconds: 400),
                                        //duration of transitions, default 1 sec
                                        transition: Transition
                                            .leftToRight //transition effect
                                        );
                                  }),
                                  child: Row(
                                    children: [
                                      ImageIcon(
                                        const AssetImage(
                                            "././assets/icon/contact.png"),
                                        color: basicPink,
                                        size: 24.h,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "تواصل معنا ",
                                        style:
                                            GoogleFonts.cairo(fontSize: 16.sp),
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
                                    Get.to(AboutApp(), //next page class
                                        duration:
                                            const Duration(milliseconds: 400),
                                        //duration of transitions, default 1 sec
                                        transition: Transition
                                            .leftToRight //transition effect
                                        );
                                  }),
                                  child: Row(
                                    children: [
                                      ImageIcon(
                                        const AssetImage(
                                            "././assets/icon/about.png"),
                                        color: basicPink,
                                        size: 24.h,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "عن التطبيق ",
                                        style:
                                            GoogleFonts.cairo(fontSize: 16.sp),
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
                                    ImageIcon(
                                      const AssetImage(
                                          "././assets/icon/rate.png"),
                                      color: basicPink,
                                      size: 24.h,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "تقييم التطبيق ",
                                      style: GoogleFonts.cairo(fontSize: 16.sp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 18.0.h, bottom: 18.h),
                            child: Text(
                              "كن علي اتصال",
                              style: GoogleFonts.cairo(fontSize: 16.sp),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  // launchUrl(Uri.parse(
                                  //    controller.socialsLinkModel!.insta));
                                  launchUrl(
                                      Uri.parse("https://www.instagram.com/"));
                                },
                                child: Image(
                                  image: const AssetImage(
                                      "././assets/icon/insta.png"),
                                  width: 48.w,
                                  height: 48.h,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 3.0.w),
                                child: InkWell(
                                  onTap: () {
                                    // launchUrl(Uri.parse(
                                    //     controller.socialsLinkModel!.facebook));
                                    launchUrl(
                                        Uri.parse("https://www.facebook.com/"));
                                  },
                                  child: Image(
                                    image: const AssetImage(
                                        "././assets/icon/messenger.png"),
                                    width: 48.w,
                                    height: 48.h,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // launchUrl(Uri.parse(
                                  //     controller.socialsLinkModel!.whats_app));
                                  launchUrl(
                                      Uri.parse("https://wa.me/201013924210"));
                                },
                                child: Image(
                                  image: const AssetImage(
                                    "././assets/icon/whats.png",
                                  ),
                                  width: 48.w,
                                  height: 48.h,
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ));
    });
  }
}
