// ignore_for_file: must_be_immutable

import 'package:effa/controllers/login_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/login_tf.dart';
import 'package:effa/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/dropdown_contry.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  LoginController controller = Get.put(LoginController(), permanent: false);
  GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: form,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 90.h,
                  ),
                  SvgPicture.asset(
                    "assets/image/logo.svg",
                    width: 165.22.w,
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Text(
                      'تسجيل الدخول',
                      style: GoogleFonts.cairo(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/image/line.svg",
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    child: GetBuilder<LoginController>(
                      builder: (controller) {
                        return SizedBox(
                                width: 301.w,
                                // height: controller.checkNum
                                //     ? MediaQuery.of(context).size.height <= 500
                                //         ? 138.h
                                //         : 210.h
                                //     : MediaQuery.of(context).size.height > 500
                                //         ? 101.h
                                //         : 210.h,
                                // decoration: BoxDecoration(
                                //   border: Border.all(
                                //     color: Colors.black38,
                                //   ),
                                //   borderRadius: BorderRadius.circular(20),

                                // ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.choseCountry(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0, right: 5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Icon(Icons
                                                .keyboard_arrow_down_rounded),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              height: MediaQuery.of(context)
                                                          .size
                                                          .height <=
                                                      500
                                                  ? 110.h
                                                  : 50.h,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropDownLogin(
                                                  countrycode:
                                                      controller.countrdyCode ==
                                                              null
                                                          ? '🇪🇬'
                                                          : controller
                                                              .countrdyCode!,
                                                  txt: controller.countryName ==
                                                          ""
                                                      ? "مصر"
                                                      : controller.countryName,
                                                  phoneController: controller
                                                      .phoneController,
                                                  onChanged: (newValue) {},
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.black38,
                                      height: 0.5.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8),
                                      child: TextFieldLogin(
                                        txt: controller.countryCode == ""
                                            ? controller.countryPicker
                                                .countryCodes[63].dialCode
                                            : controller.countryCode,
                                        controller: controller.controllerr,
                                      ),
                                    ),
                                    controller.checkNum
                                        ? Text(
                                            "يجب ادخال رقم صحيح",
                                            style: GoogleFonts.cairo(
                                                color: Colors.red),
                                          )
                                        : const SizedBox()
                                  ],
                                ))
                            .box
                            .color(white)
                            .roundedSM
                            .shadowSm
                            // .margin(const EdgeInsets.all(12))
                            // .padding(const EdgeInsets.symmetric(horizontal: 16))
                            .make();
                      },
                    ),
                  ),
                  GetBuilder<LoginController>(
                    builder: (controller) => !controller.loader
                        ? SizedBox(
                            // height: MediaQuery.of(context).size.height <= 500
                            //     ? 170.h
                            //     : 44.h,
                            width: 148.w,
                            child: RoundedButton(
                              color: basicPink,
                              mywidget: Text('دخول',
                                  style: GoogleFonts.cairo(
                                      color: white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.normal)),
                              raduis: 10,
                              myfun: () async {
                                if (controller.controllerr.text.isEmpty) {
                                  controller.setNum();
                                } else {
                                  await controller.sendOTP();
                                }
                              },
                            ),
                          )
                        : const CircularProgressIndicator(
                            color: basicPink,
                          ),
                  ),
                  SizedBox(height: 35.h),
                  Container(
                    alignment: Alignment.center, // use aligment
                    child: SvgPicture.asset(
                      'assets/image/wedding.svg',
                      height: 188.71.h,
                      // fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
