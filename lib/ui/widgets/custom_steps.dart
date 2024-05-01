import 'dart:ui';

import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

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
  List<StepperData> stepperData = [
    StepperData(
        title: StepperText('وقت المشاهدة',
            textStyle: GoogleFonts.cairo(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            )),
        subtitle: StepperText("20 / يناير /  2022 - 15:00 م",
            textStyle: GoogleFonts.cairo(
                fontSize: 12.sp, fontWeight: FontWeight.w200)),
        iconWidget: Container(
          decoration: const BoxDecoration(
            color: basicPink,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          // child: const Icon(Icons.looks_two, color: Colors.white),
        )),
    StepperData(
        title: StepperText('وقت طلب ولي الامر',
            textStyle: GoogleFonts.cairo(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            )),
        subtitle: StepperText("20 / يناير /  2022 - 15:00 م",
            textStyle: GoogleFonts.cairo(
                fontSize: 12.sp, fontWeight: FontWeight.w200)),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: basicPink,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          // child: const Icon(Icons.looks_two, color: Colors.white),
        )),
    StepperData(
        title: StepperText('مشاهدة الطلب',
            textStyle: GoogleFonts.cairo(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            )),
        subtitle: StepperText("20 / يناير /  2022 - 15:00 م",
            textStyle: GoogleFonts.cairo(
                fontSize: 12.sp, fontWeight: FontWeight.w200)),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: basicPink,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          // child: const Icon(Icons.looks_two, color: Colors.white),
        )),
    StepperData(
        title: StepperText('الموافقة علي الطلب',
            textStyle: GoogleFonts.cairo(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            )),
        subtitle: StepperText("20 / يناير /  2022 - 15:00 م",
            textStyle: GoogleFonts.cairo(
                fontSize: 12.sp, fontWeight: FontWeight.w200)),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: basicPink,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          // child: const Icon(Icons.looks_two, color: Colors.white),
        )),
    StepperData(
        title: StepperText('مشاهدة الموافقة',
            textStyle: GoogleFonts.cairo(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            )),
        subtitle: StepperText("20 / يناير /  2022 - 15:00 م",
            textStyle: GoogleFonts.cairo(
                fontSize: 12.sp, fontWeight: FontWeight.w200)),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: basicPink,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          // child: const Icon(Icons.looks_two, color: Colors.white),
        )),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
          padding: EdgeInsets.only(bottom: 10.0.h, top: 25.h),
          child: Column(children: [
            SizedBox(
                width: double.infinity,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white70, width: 1),
                      boxShadow: [
                        const BoxShadow(
                            color: gGrey,
                            spreadRadius: 0.2,
                            blurRadius: 4,
                            offset: Offset(0, 3)),
                      ],
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnotherStepper(
                          stepperList: stepperData,
                          stepperDirection: Axis.vertical,
                          verticalGap: 26.h,
                          activeBarColor: basicPink,
                          inActiveBarColor: const Color(0xffFFE6EA),
                          iconWidth:
                              20, // Height that will be applied to all the stepper icons
                          iconHeight:
                              20, // Width that will be applied to all the stepper icons
                        ),
                      ),
                    )
                    // Directionality(
                    //   textDirection: TextDirection.rtl,
                    //   child: Theme(
                    //       data: ThemeData(
                    //           colorScheme:
                    //               const ColorScheme.light(primary: basicPink)),
                    //       child: Stepper(
                    //         type: StepperType.vertical,
                    //         physics: const ScrollPhysics(),
                    //
                    //        margin: EdgeInsets.all(0),
                    //         controlsBuilder: (context, _) => Container(),
                    //
                    //         steps: [

                    //         ],
                    //       )),
                    // ),
                    )),
            SizedBox(
              height: 10.h,
            ),
            isGirl
                ? const SizedBox()
                : SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white70, width: 1),
                        boxShadow: [
                          const BoxShadow(
                              color: gGrey,
                              spreadRadius: 0.2,
                              blurRadius: 4,
                              offset: Offset(0, 3)),
                        ],
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 10.w),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.white70, width: 1),
                              boxShadow: [
                                const BoxShadow(
                                    color: gGrey,
                                    spreadRadius: 0.2,
                                    blurRadius: 4,
                                    offset: Offset(0, 3)),
                              ],
                            ),
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

                                        //height: 56.h,
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
                              Container(
                                  //  constraints:BoxConstraints(minHeight: 150.h),
                                  height:
                                      MediaQuery.of(context).size.height <= 500
                                          ? 300.h
                                          : 150.h,
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
                                                      ImageIcon(
                                                          AssetImage(
                                                              "assets/icon/namee.png"),
                                                          size: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height <=
                                                                  500
                                                              ? 20
                                                              : 40,
                                                          color: red),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Text(
                                                        guardianName,
                                                        style:
                                                            GoogleFonts.cairo(
                                                          fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height <=
                                                                  500
                                                              ? 12.sp
                                                              : 16.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      ImageIcon(
                                                          AssetImage(
                                                              "assets/icon/parents.png"),
                                                          size: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height <=
                                                                  500
                                                              ? 20
                                                              : 40,
                                                          color: red),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Text(
                                                        guardianRelate,
                                                        style:
                                                            GoogleFonts.cairo(
                                                          fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height <=
                                                                  500
                                                              ? 12.sp
                                                              : 16.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      ImageIcon(
                                                        AssetImage(
                                                            "assets/icon/phonee.png"),
                                                        size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height <=
                                                                500
                                                            ? 20
                                                            : 40,
                                                        color: red,
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Text(
                                                        phone,
                                                        style:
                                                            GoogleFonts.cairo(
                                                          fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height <=
                                                                  500
                                                              ? 12.sp
                                                              : 16.sp,
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
                                      : _beforePress(context))
                            ]),
                          )),
                    )),
            const SizedBox(
              height: 18,
            ),
            Text(
              'الابلاغ عن الحساب',
              style: GoogleFonts.cairo(
                decoration: TextDecoration.underline,
              ),
            )
          ])),
    );
  }

  Widget _beforePress(BuildContext context) => Stack(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Stack(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 8.h),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ImageIcon(
                                        AssetImage("assets/icon/namee.png"),
                                        size: MediaQuery.of(context)
                                                    .size
                                                    .height <=
                                                500
                                            ? 20
                                            : 40,
                                        color: red),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      guardianName,
                                      style: GoogleFonts.cairo(
                                        fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height <=
                                                500
                                            ? 12.sp
                                            : 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    ImageIcon(
                                        AssetImage("assets/icon/parents.png"),
                                        size: MediaQuery.of(context)
                                                    .size
                                                    .height <=
                                                500
                                            ? 20
                                            : 40,
                                        color: red),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      guardianRelate,
                                      style: GoogleFonts.cairo(
                                        fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height <=
                                                500
                                            ? 12.sp
                                            : 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    ImageIcon(
                                      AssetImage("assets/icon/phonee.png"),
                                      size:
                                          MediaQuery.of(context).size.height <=
                                                  500
                                              ? 20
                                              : 40,
                                      color: red,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      phone,
                                      style: GoogleFonts.cairo(
                                        fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height <=
                                                500
                                            ? 12.sp
                                            : 16.sp,
                                      ),
                                    ),
                                    const Spacer(),
                                    Image.asset("assets/icon/phoni.png"),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Positioned.fill(
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 6,
                                sigmaY: 6,
                              ),
                              child: Container(
                                    color: dGrey.withOpacity(0.06),
                                  ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 100.w,
                  height:
                      MediaQuery.of(context).size.height <= 500 ? 100.h : 48.h,
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
                            fontSize: MediaQuery.of(context).size.height <= 500
                                ? 14.sp
                                : 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              onPressed!();
            },
            child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.h, right: 30.w),
                  child: Container(
                    width: MediaQuery.of(context).size.height <= 500
                        ? 180.w
                        : 180.w,
                    height: MediaQuery.of(context).size.height <= 500
                        ? 100.h
                        : 44.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: basicPink,
                        ),
                        color: white),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image:
                                AssetImage("././assets/icon/filter_icon.png"),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "اظهر مقابل $showCost",
                            style: GoogleFonts.cairo(
                              color: black,
                              fontSize:
                                  MediaQuery.of(context).size.height <= 500
                                      ? 10.sp
                                      : 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ],
      );
}
