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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/image/logo.svg",
                    width: MediaQuery.of(context).size.width / 2.4,
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
                            width: MediaQuery.of(context).size.width * .9,
                            height:controller.checkNum
                                ?  MediaQuery.of(context).size.height / 4.2:MediaQuery.of(context).size.height / 5,
                            mywidget: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.choseCountry(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                                const Divider(
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                        "الرجاء ادخال رقم صحيح",
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
                            height: 50.h,
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
                      width: 321.06.w,
                      // width: double.infinity,
                      //height: 173.13.h,
                      fit: BoxFit.fill,
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
