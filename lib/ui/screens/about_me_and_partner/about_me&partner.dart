import 'package:effa/helper/app_colors.dart';
import 'package:effa/models/posts/auth.dart';
import 'package:effa/ui/widgets/button.dart';
import 'package:effa/ui/widgets/info_bottom_sheet.dart';
import 'package:effa/ui/widgets/register_button.dart';
import 'package:effa/ui/widgets/text_field_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class AboutMe extends StatelessWidget {
  AboutMe({Key? key}) : super(key: key);

  final AuthController controller = Get.put(AuthController(), permanent: false);
  TextEditingController aboutmeController = TextEditingController();

  TextEditingController partenerController = TextEditingController();
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
              child: GetBuilder<AuthController>(
                  builder: (controller){
                    return SingleChildScrollView(
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                                style: GoogleFonts.cairo(color: grey, fontSize: 13.sp),
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
                                title: controller.loader? const Center(child: CircularProgressIndicator(color: basicPink,),):Text('تـأكيد',
                                    style: GoogleFonts.cairo(
                                      color: white,
                                      fontSize: 16.sp,
                                    )),
                                function: (){
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: transparnt,
                                      builder: (context) {
                                        return WaitBottomSheet(id: 2);
                                      });
                                },
                                nav: (){
                                  if(controller.loader == true){
                                  }else{
                                    if (aboutmeController.text == "" ||
                                        partenerController.text == "") {
                                      Get.snackbar( " من فضلك تأكد من تكملة البيانات","",
                                          borderRadius: 0,
                                          showProgressIndicator: false, duration: const Duration(seconds: 4));
                                    } else {
                                      controller.updateUser(aboutmeController.text,
                                          partenerController.text);
                                      return;
                                    }
                                  }
                                },
                                color: basicPink
                            ),
                            SizedBox(
                              height: 20.h,
                            ),

                          ]),
                    );
                  }
              )
          ),
        ),
        ),
    ));
  }
}
