// ignore_for_file: must_be_immutable, file_names

import 'package:effa/helper/app_colors.dart';
import 'package:effa/models/posts/auth.dart';
import 'package:effa/ui/widgets/info_bottom_sheet.dart';
import 'package:effa/ui/widgets/register_button.dart';
import 'package:effa/ui/widgets/text_field_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class AboutMe extends StatelessWidget {
  AboutMe({Key? key}) : super(key: key);

  final AuthController controller = Get.put(AuthController(), permanent: false);
  TextEditingController aboutmeController = TextEditingController();
  MultiSelectController interests = MultiSelectController();
  TextEditingController partenerController = TextEditingController();
  List<String> interestsChoich = [];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  child: GetBuilder<AuthController>(builder: (controller) {
                    return SingleChildScrollView(
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        SizedBox(
                          height: 45.h,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icon/nextto.svg"),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'وصف عني & عن شريك حياتي',
                                textAlign: TextAlign.right,
                                style: GoogleFonts.cairo(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(children: [
                              SvgPicture.asset("assets/icon/10.svg"),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'نبذه عنك',
                                textAlign: TextAlign.right,
                                style: GoogleFonts.cairo(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ])),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFieldDetails(
                          key: key,
                          hintTxt: 'شاب طموح متدين ',
                          controller: aboutmeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يجب ادخال بيانات';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "اكتب نبذه لا تقل عن 50 حرف",
                            style:
                                GoogleFonts.cairo(color: grey, fontSize: 13.sp),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(children: [
                              SvgPicture.asset("assets/icon/13.svg"),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'اهتماماتك',
                                textAlign: TextAlign.right,
                                style: GoogleFonts.cairo(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ])),
                        SizedBox(
                          height: 20.h,
                        ),
                        MultiSelectDropDown(
                          showClearIcon: true,
                          controller: interests,
                          onOptionSelected: (List<ValueItem> selectedOptions) {
                            debugPrint(selectedOptions.toString());
                          },
                          options: const <ValueItem>[
                            ValueItem(label: 'السباحة', value: 'السباحة'),
                            ValueItem(label: 'الرماية', value: 'الرماية'),
                            ValueItem(label: 'القراءة', value: 'القراءة'),
                            ValueItem(label: 'المشي', value: 'المشي'),
                            ValueItem(label: 'ركوب الخيل', value: 'ركوب الخيل'),
                            ValueItem(label: 'المبارزة', value: 'المبارزة'),
                          ],
                          chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                          optionTextStyle: const TextStyle(fontSize: 16),
                          selectedOptionIcon: const Icon(Icons.check_circle),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(children: [
                              SvgPicture.asset("assets/icon/13.svg"),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'نبذه عن شريك حياتي',
                                textAlign: TextAlign.right,
                                style: GoogleFonts.cairo(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ])),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFieldDetails2(
                          key: key,
                          hintTxt: 'بنت ملتزمة أخلاقيا و دينيا',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يجب ادخال بيانات';
                            }
                            return null;
                          },
                          controller: partenerController,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        RegisterButton(
                            title: controller.loader
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: basicPink,
                                    ),
                                  )
                                : Text('تـأكيد',
                                    style: GoogleFonts.cairo(
                                      color: white,
                                      fontSize: 16.sp,
                                    )),
                            function: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: transparnt,
                                  builder: (context) {
                                    return WaitBottomSheet(id: 2);
                                  });
                            },
                            nav: () {
                              interestsMethod();
                              if (controller.loader == true) {
                              } else {
                                if (aboutmeController.text == "" ||
                                    partenerController.text == "" ||
                                    interests.selectedOptions.isEmpty) {
                                  Get.snackbar(
                                      " من فضلك تأكد من تكملة البيانات", "",
                                      borderRadius: 0,
                                      showProgressIndicator: false,
                                      duration: const Duration(seconds: 4));
                                } else {
                                  controller.updateUser(
                                    aboutmeController.text,
                                    partenerController.text,
                                  );
                                  return;
                                }
                              }
                            },
                            color: basicPink),
                        SizedBox(
                          height: 20.h,
                        ),
                      ]),
                    );
                  })),
            ),
          ),
        ));
  }

  void interestsMethod() {
    interests.selectedOptions.map((e) {
      bool x = false;
      int z;
      int n = 0;
      for (int i = 0; i < interestsChoich.length; i++) {
        for (z = 0; z < interests.selectedOptions.length; z++) {
          if ((z == interests.selectedOptions.length) && (n != 0)) {
            interestsChoich.remove(interests.selectedOptions[n]);
          }
        }
        if (e.value == interestsChoich[i]) {
          x = true;
        }
      }
      if (x == false) {
        interestsChoich.add(e.value!);
      }
    }).toList();
    print("interestsChoich == ${interestsChoich}");
  }
}
