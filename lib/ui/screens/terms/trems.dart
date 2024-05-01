import 'package:effa/controllers/terms_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/main_data/main_data.dart';
import 'package:effa/ui/widgets/custom_main_info_pages/main_page_view.dart';
import 'package:effa/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Terms extends StatelessWidget {
  Terms({Key? key}) : super(key: key);
  TermsController controller = Get.put(TermsController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 20.h, left: 10.h, right: 10.h),
        child: Container(
          child: Column(children: [
            SizedBox(
              height: 65.h,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 24.0,
                      color: darkblack,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'أهلا بك في ',
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp,
                      ),
                    ),
                    TextSpan(
                        text: 'عفة',
                        style: GoogleFonts.cairo(
                          color: basicPink,
                          fontSize: 24.sp,
                          // fontWeight: FontWeight.w700,
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h, bottom: 20.h),
              child: Center(
                child: Text(
                  'تطبيق الزواج الصادق',
                  style: GoogleFonts.cairo(
                    fontSize: 14.sp,
                    color: midGrey,
                    // fontWeight: FontWeight.normal
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  width: 343.w,
                  height: 498.h,
                  margin: const EdgeInsets.all(10.0),
                  padding:
                      const EdgeInsets.only(bottom: 9.0, left: 9.0, right: 9.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: gGrey, width: 0.7.w, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: SafeArea(
                    child: RawScrollbar(
                      scrollbarOrientation: ScrollbarOrientation.left,
                      thumbColor: basicPink,
                      radius: const Radius.circular(20),
                      thickness: 5,
                      interactive: true,
                      child: SingleChildScrollView(
                        // for Vertical scrolling
                        scrollDirection: Axis.vertical,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 8.0.w, right: 8.0.w, bottom: 10.0.h),
                            child: GetBuilder<TermsController>(
                                builder: (controller) {
                              return controller.loader
                                  ? Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 175.h),
                                        child: const CircularProgressIndicator(
                                          color: basicPink,
                                        ),
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.h, bottom: 30.h),
                                            child: Text(
                                              controller.termsModel!.title,
                                              style: GoogleFonts.cairo(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Text(
                                            controller.termsModel!.content,
                                            style: GoogleFonts.cairo(
                                              color: lGrey,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                              letterSpacing: 1,
                                              wordSpacing: 1,
                                            ),
                                          )
                                        ]);
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GetBuilder<TermsController>(
              builder: (controller) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'لقد قرأت الشروط والاحكام',
                          style: GoogleFonts.cairo(fontSize: 14.sp),
                          // overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Material(
                          child: Checkbox(
                            focusColor: basicPink,
                            activeColor: basicPink,
                            value: controller.agree,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                                side: BorderSide(
                                  color: basicPink,
                                  width: 2.5,
                                )),
                            onChanged: (value) {
                              controller.changeValue(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                    !controller.agree
                        ? Container(
                            width: 148.w,
                            //height: 46.h,
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: lwhite,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text('إبدأ',
                                  style: GoogleFonts.cairo(
                                    color: controller.agree ? white : darkgrey,
                                    fontSize: 16.sp,
                                    //fontWeight: FontWeight.w500
                                  )),
                            ) // your content here
                            )
                        : SizedBox(
                            width: 148.w,
                            height: 46.h,
                            child: controller.posted
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: basicPink,
                                  ))
                                : RoundedButton(
                                    mywidget: Text('إبدأ',
                                        style: GoogleFonts.cairo(
                                          color: white,
                                          fontSize: 16.sp,
                                          //fontWeight: FontWeight.w500
                                        )),
                                    myfun: controller.agree
                                        ? () {
                                            controller.updateTerms();
                                          }
                                        : () {},
                                    raduis: 10,
                                    color: basicPink,
                                  ),
                          )
                  ],
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
