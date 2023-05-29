import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomSteps extends StatelessWidget {
  bool showParentData;
  final VoidCallback? onPressed;
  String guardianName;
  String guardianRelate;
  String phone;
  String mainBalance;
  String showCost;
  bool isGirl;
  CustomSteps({
    Key? key,
    required this.showParentData,
    required this.onPressed,
    required this.guardianName,
    required this.guardianRelate,
    required this.phone,
    required this.mainBalance,
    required this.showCost,
    required this.isGirl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
          padding: EdgeInsets.only(bottom: 10.0.h, top: 25.h),
          child: Column(children: [
            SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: white,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Theme(
                        data: ThemeData(
                            colorScheme:
                                const ColorScheme.light(primary: basicPink)),
                        child: Stepper(
                          type: StepperType.vertical,
                          physics: const ScrollPhysics(),
                          controlsBuilder: (context, _) {
                            return Container();
                          },
                          steps: [
                            Step(
                                title: Text(
                                  'وقت المشاهدة',
                                  style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      ),
                                ),
                                content: const Text(""),
                                subtitle: Text(
                                  "20 / يناير /  2022 - 15:00 م",
                                  style: GoogleFonts.cairo(
                                      color: grey,
                                      fontSize: 12.sp,
                                      ),
                                ),
                                isActive: true,
                                state: StepState.indexed),
                            Step(
                                title: Text(
                                  'وقت طلب ولي الامر',
                                  style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                     ),
                                ),
                                content: const Text(""),
                                subtitle: Text("20 / يناير /  2022 - 15:00 م",
                                    style: GoogleFonts.cairo(
                                        color: grey,
                                        fontSize: 12.sp,
                                        )),
                                isActive: true,
                                state: StepState.indexed),
                            Step(
                                title: Text(
                                  'مشاهدة الطلب',
                                  style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      ),
                                ),
                                content: const Text(""),
                                subtitle: Text("20 / يناير /  2022 - 15:00 م",
                                    style: GoogleFonts.cairo(
                                        color: grey,
                                        fontSize: 12.sp,
                                        )),
                                isActive: true,
                                state: StepState.indexed),
                            Step(
                                title: Text(
                                  'الموافقة علي الطلب',
                                  style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      ),
                                ),
                                content: const Text(""),
                                subtitle: Text("20 / يناير /  2022 - 15:00 م",
                                    style: GoogleFonts.cairo(
                                        color: grey,
                                        fontSize: 12.sp,
                                        )),
                                isActive: true,
                                state: StepState.indexed),
                            Step(
                                title: Text(
                                  'مشاهدة الموافقة',
                                  style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                     ),
                                ),
                                content: const Text(""),
                                subtitle: Text("20 / يناير /  2022 - 15:00 م",
                                    style: GoogleFonts.cairo(
                                        color: grey,
                                        fontSize: 12.sp,
                                       )),
                                isActive: true,
                                state: StepState.indexed),
                          ],
                        )),
                  ),
                )),
            SizedBox(
              height: 10.h,
            ),
            isGirl?const SizedBox():SizedBox(
                width: double.infinity,
                child: Card(
                    elevation: 6.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    // color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 10.w),
                        child: Container(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    side: BorderSide(
                                      color: lightPink,
                                      width: 2.w,
                                      style: BorderStyle.solid,
                                    )),
                                child: Column(children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: whiteRaduis,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                    ),
                                    child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: SizedBox(
                                            height: 56.h,
                                            child: Row(children: [
                                              const ImageIcon(
                                                AssetImage(
                                                  "assets/icon/rec.png",
                                                ),
                                                color: basicPink,
                                                // size: 50,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                "ولي الامر",
                                                style: GoogleFonts.cairo(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.sp),
                                              )
                                            ]))),
                                  ),
                                  SizedBox(
                                      height: 150.h,
                                      child: showParentData == true
                                          ? Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w,
                                                      vertical: 8.h),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const ImageIcon(
                                                              AssetImage(
                                                                  "assets/icon/namee.png"),
                                                              size: 40,
                                                              color: red),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Text(
                                                            guardianName,
                                                            style: GoogleFonts.cairo(
                                                              fontSize: 16.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const ImageIcon(
                                                              AssetImage(
                                                                  "assets/icon/parents.png"),
                                                              size: 40,
                                                              color: red),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Text(
                                                            guardianRelate,
                                                            style: GoogleFonts.cairo(
                                                              fontSize: 16.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const ImageIcon(
                                                            AssetImage(
                                                                "assets/icon/phonee.png"),
                                                            size: 40,
                                                            color: red,
                                                          ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Text(
                                                            phone,
                                                            style: GoogleFonts.cairo(
                                                              fontSize: 16.sp,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Image.asset(
                                                              "assets/icon/phoni.png"),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                        ],

                                                      ),
                                                    ],
                                                  )))
                                          : _beforePress())
                                ])))))),
            Text(
              'الابلاغ عن الحساب',
              style: GoogleFonts.cairo(
                decoration: TextDecoration.underline,
              ),
            )
          ])),
    );
  }

  Widget _beforePress() => Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 100.w,
              height: 48.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: red),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("././assets/icon/filter_icon.png"),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    mainBalance,
                    style: GoogleFonts.cairo(
                        color: white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  width: 160.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: basicPink,
                      ),
                      color: white),
                  child: Center(
                    child: TextButton(
                        onPressed:onPressed,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage(
                                  "././assets/icon/filter_icon.png"),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "اظهر مقابل $showCost",
                              style: GoogleFonts.cairo(
                                color: black,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              )),
        ],
      );
}
