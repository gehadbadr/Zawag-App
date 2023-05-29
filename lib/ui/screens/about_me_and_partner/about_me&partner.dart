import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/button.dart';
import 'package:effa/ui/widgets/info_bottom_sheet.dart';
import 'package:effa/ui/widgets/register_button.dart';
import 'package:effa/ui/widgets/text_field_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
class AboutMe extends StatelessWidget {
  AboutMe({Key? key}) : super(key: key);
  TextEditingController aboutmeController = TextEditingController();

  TextEditingController partenerController = TextEditingController();
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: SingleChildScrollView(
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
                                fontSize: 22.sp,
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
                        hintTxt: 'شاب طموح متدين ',
                        controller: aboutmeController,
                        validator: (k) {
                          // return
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
                        hintTxt: 'بنت ملتزمة أخلاقيا و دينيا',
                        controller: partenerController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      RegisterButton(
                          title: Text('تـأكيد',
                              style: GoogleFonts.cairo(
                                color: white,
                                fontSize: 16.sp,
                              )),
                          function: (){
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: transparnt,
                                builder: (context) {
                                  return const WaitBottomSheet();
                                });
                          },
                          nav: (){
                            // Get.to(
                            //   DashBoardMale(),);
                          },
                          color: basicPink
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

            ]),
              )
          ),
        ),
        ),
    ));
  }
}
