import 'dart:async';
import 'package:effa/controllers/pin_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/pin_input.dart';
import 'package:effa/ui/widgets/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class PinPage extends StatelessWidget {
  PinPage({Key? key, this.name, this.code, this.myPhone})
      : super(key: key);
  final String? name;
  final String? code;
  final String? myPhone;
  final controller = Get.lazyPut(() => PinCodeController(),fenix: true);
  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height <= 500
                                          ? 1000
                                          : MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetBuilder<PinCodeController>(
        builder: (controller){
          return Scaffold(
          
            body: SingleChildScrollView(
              child: SizedBox(
                height: height,
                child: Form(
                  child: Column(children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    SvgPicture.asset(
                      'assets/image/code_top.svg',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
                      child: SvgPicture.asset(
                        'assets/image/code_center.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "من فضلك ادخل كود التفعيل المرسل الي",
                      style: GoogleFonts.cairo(
                        fontSize: 14.sp,
                        color: black,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "$code" "$myPhone",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: basicPink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CodeInput(
                            first: true,
                            last: false,
                            focusNode0: controller.focusDigit1,
                            controller:  controller.codeController1,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          CodeInput(
                            first: false,
                            last: false,
                            focusNode0: controller.focusDigit2,
                            controller:  controller.codeController2,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          CodeInput(
                            focusNode0: controller.focusDigit3,
                            controller:  controller.codeController3,
                            first: false,
                            last: false,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          CodeInput(
                            first: false,
                            last: false,
                            focusNode0: controller.focusDigit4,
                            controller:  controller.codeController4,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          CodeInput(
                            first: false,
                            last: false,
                            focusNode0: controller.focusDigit5,
                            controller:  controller.codeController5,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          CodeInput(
                            first: false,
                            last: true,
                            focusNode0: controller.focusDigit6,
                            controller:  controller.codeController6,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                        // 14.w
                        MediaQuery.of(context).size.width * 0.12,
                      ),
                      child: Obx(
                        ()=>
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${controller.remainingTime} ث ",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: basicPink,
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                if (controller.remainingTime == 0) {
                                  Get.back();
                                }
                                else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    backgroundColor: orginalRed,
                                    content: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Text(
                                          "من فضلك انتظر ${controller.remainingTime} ثانيه لاعادة الارسال",
                                          style: GoogleFonts.cairo(
                                            fontSize: 14.sp,
                                          ),
                                        )),
                                  ));
                                }
                              },
                              child: Text(
                                'إعادة ارسال الكود',
                                style: GoogleFonts.cairo(
                                  fontSize: 14.sp,
                                  fontWeight:controller.remainingTime == 0
                                      ? FontWeight.bold:FontWeight.normal,
                                  color: controller.remainingTime == 0
                                      ? bblack
                                      : gmGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                  !controller.loader?SizedBox(
                      width: 148.w,
                      height: 44.w,
                      child: RoundedButton(
                        color: basicPink,
                        mywidget: Text('تأكيد',
                            style: GoogleFonts.cairo(
                                color: white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500)),
                        raduis: 10,
                        myfun: () async {
                          controller.withoutsendOTPCode(context,myPhone,code);
                        },
                      )
                    ):const CircularProgressIndicator(
                    color: basicPink,
                  ),
                    Spacer()
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
