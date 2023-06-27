import 'package:effa/controllers/basic_pages_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FullName extends StatelessWidget {
  GlobalKey<FormState> form = GlobalKey<FormState>();



  BasicPagesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            'اسم المستخدم بالعربي ؟',
            style: GoogleFonts.cairo(fontSize: 20.sp),
          ),
        )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.h),
          child: Form(
            key: form,
            child: Row(
              children: [
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      style: GoogleFonts.cairo(),
                      onTap: () {
                        if (controller.firstName.selection ==
                            TextSelection.fromPosition(TextPosition(
                                offset: controller.firstName.text.length - 1))) {
                          controller.firstName.selection = TextSelection.fromPosition(
                              TextPosition(offset: controller.firstName.text.length));
                        }
                      },
                      controller: controller.firstName,
                      cursorColor: basicPink,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return "ادخل الاسم الأول";
                        } else if (text.length < 2) {
                          return 'علي الأقل حرفين';
                        }
                        return null;
                      },
                      maxLength: 12,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp("[a-zA-Z]"), // Arabic Unicode range
                        ),
                      ],
                      decoration: InputDecoration(
                        labelText: 'الاسم الأول',
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: basicPink, width: 1.5.w),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusColor: basicPink,
                        floatingLabelStyle: const TextStyle(
                          color: basicPink,
                        ),
                        labelStyle: TextStyle(fontSize: 14.sp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      style: GoogleFonts.cairo(),
                      onTap: () {
                        if (controller.secondName.selection ==
                            TextSelection.fromPosition(TextPosition(
                                offset: controller.secondName.text.length - 1))) {
                          controller.secondName.selection = TextSelection.fromPosition(
                              TextPosition(offset: controller.secondName.text.length));
                        }
                      },
                      controller: controller.secondName,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp("[a-zA-Z]"), // Arabic Unicode range
                        ),
                      ],
                      textAlign: TextAlign.right,
                      cursorColor: basicPink,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return " ادخل الاسم الأخير ";
                        } else if (text.length < 2) {
                          return 'علي الأقل حرفين';
                        }
                        return null;
                      },
                      onChanged: (String value) {},
                      maxLength: 12,
                      decoration: InputDecoration(
                        labelText: 'الاسم الأخير',
                        labelStyle: TextStyle(fontSize: 14.sp),
                        floatingLabelStyle: const TextStyle(
                          color: basicPink,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: basicPink, width: 1.5.w),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Expanded(flex: 3, child: SizedBox()),
        SizedBox(
          width: 264.w,
          height: 44.h,
          child: RoundedButton(
              mywidget: Text('التالي',
                  style: GoogleFonts.cairo(
                    color: white,
                    fontSize: 16,
                  )),
              raduis: 10,
              myfun: () {
                if (!form.currentState!.validate()) {
                  return;
                }
                controller.onTap();
              },
              color: basicPink),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(
              // height: 10,
              ),
        )
      ],
    );
  }
}
