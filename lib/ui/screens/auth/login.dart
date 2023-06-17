import 'package:effa/controllers/login_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/pin_page/pin_page.dart';
import 'package:effa/ui/widgets/login_tf.dart';
import 'package:effa/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/dropdown_contry.dart';
import '../../widgets/rounded_card.dart';

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
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: form,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    SvgPicture.asset(
                      "assets/image/logo.svg",
                      width:165.22.w,
                    ),
                    SizedBox(
                      height: 70.h,
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
                          return RoundedCard(
                              width: 301.w,
                              height:controller.checkNum
                                  ? 138.h:101.h,
                              mywidget: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.choseCountry(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Icon(
                                              Icons.keyboard_arrow_down_rounded),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            child: DropdownButtonHideUnderline(
                                              child: DropDownLogin(
                                                countrycode: controller.countrdyCode == null? '🇪🇬': controller.countrdyCode!,
                                                txt: controller.countryName == ""
                                                    ? "مصر"
                                                    : controller.countryName,
                                                phoneController:
                                                    controller.phoneController,
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
                                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                                    child: TextFieldLogin(
                                      txt: controller.countryCode == ""
                                          ? controller.countryPicker
                                              .countryCodes[63].dialCode
                                          : controller.countryCode,
                                      controller: controller.controllerr,
                                    ),
                                  ),
                                  controller.checkNum
                                      ?  Text(
                                          "يجب ادخال رقم صحيح",
                                          style: GoogleFonts.cairo(color: Colors.red),
                                        )
                                      : const SizedBox()
                                ],
                              ));
                        },
                      ),
                    ),
                    GetBuilder<LoginController>(
                      builder:
                      (controller)=> !controller.loader
                          ? SizedBox(
                              height: 44.h,
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
                                  if(controller.controllerr.text.isEmpty){
                                    controller.setNum();
                                  }else {
                                    await controller.sendOTP();
                                  }
                                },
                              ),
                            )
                          : const CircularProgressIndicator(
                        color: basicPink,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      alignment: Alignment.center, // use aligment
                      child: SvgPicture.asset(
                        'assets/image/wedding.svg',
                        height: 215.71.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
