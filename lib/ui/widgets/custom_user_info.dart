import 'package:custom_timer/custom_timer.dart';
import 'package:effa/controllers/my_profile_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/models/user/user_data.dart';
import 'package:effa/ui/widgets/saprator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomUserInfoCard extends StatefulWidget {
  List<Question> personalData;
  List<Question> relegion;
  List<Question> study;
  List<Question> family;
  List<String> interests;
  List<ImagesUser> userImages;
  String aboutMe;
  String aboutPartner;
  String cost;
  bool isRequest;
  bool isGirl;
  final VoidCallback? onSendRequest;
  final VoidCallback? onCancel;
  final VoidCallback? cancelFather;
  final VoidCallback? onSubmitRep;
  CustomUserInfoCard({
    Key? key,
    required this.personalData,
    required this.relegion,
    required this.study,
    required this.family,
    required this.interests,
    required this.userImages,
    required this.aboutMe,
    required this.aboutPartner,
    required this.cost,
    required this.isRequest,
    required this.isGirl,
    required this.onSendRequest,
    required this.onCancel,
    required this.cancelFather,
    required this.onSubmitRep,
  }) : super(key: key);

  @override
  State<CustomUserInfoCard> createState() => _CustomUserInfoCardState();
}

class _CustomUserInfoCardState extends State<CustomUserInfoCard>
    with TickerProviderStateMixin {
  late final CustomTimerController controller = CustomTimerController(
      vsync: this,
      begin: const Duration(
        minutes: 2,
      ),
      end: const Duration(),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.milliseconds);
  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0.h),
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: gray, width: 1),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: gGrey,
                    //       spreadRadius: 0.2,
                    //       blurRadius:4,
                    //       offset: Offset(0,3)
                    //   ),
                    // ],
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 15.0.w, left: 15.0.w, top: 25.h, bottom: 33.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/icon/2.svg"),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Text(
                                  'البيانات الشخصية & الجسدية',
                                  style: GoogleFonts.cairo(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Wrap(
                              spacing: 5.0,
                              children: List<Widget>.generate(
                                  widget.personalData.length, (int index) {
                                return _editTitleChip(
                                  "${widget.personalData[index].answerContent}",
                                );
                              }),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25.0.h, horizontal: 10.w),
                              child: const MySeparator(
                                color: llightGrey,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/icon/3.svg"),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Text(
                                  'الدين & الحالة الإجتماعية ',
                                  style: GoogleFonts.cairo(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Wrap(
                              spacing: 5.0,
                              children: List<Widget>.generate(
                                  widget.relegion.length, (int index) {
                                return _editTitleChip(
                                  "${widget.relegion[index].answerContent}",
                                );
                              }),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25.0.h, horizontal: 10.w),
                              child: const MySeparator(
                                color: llightGrey,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/icon/4.svg"),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Text(
                                  'التعليم & العمل',
                                  style: GoogleFonts.cairo(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Wrap(
                              spacing: 5.0,
                              children: List<Widget>.generate(
                                  widget.study.length, (int index) {
                                return _editTitleChip(
                                  "${widget.study[index].answerContent}",
                                );
                              }),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25.0.h, horizontal: 10.w),
                              child: const MySeparator(
                                color: llightGrey,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/icon/5.svg"),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Text(
                                  'العائله',
                                  style: GoogleFonts.cairo(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Wrap(
                              spacing: 5.0,
                              children: List<Widget>.generate(
                                  widget.family.length, (int index) {
                                return _editTitleChip(
                                  "${widget.family[index].answerContent}",
                                );
                              }),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25.0.h, horizontal: 10.w),
                              child: const MySeparator(
                                color: llightGrey,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/icon/interstes.svg"),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Text(
                                  'الاهتمامات',
                                  style: GoogleFonts.cairo(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Wrap(
                              spacing: 5.0,
                              //runSpacing: 6.0,
                              children: List<Widget>.generate(
                                  widget.interests.length, (int index) {
                                return _editTitleChip(
                                  widget.interests[index],
                                );
                              }),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25.0.h, horizontal: 10.w),
                              child: const MySeparator(
                                color: llightGrey,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/icon/6.svg"),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Text(
                                  'وصف عنى',
                                  style: GoogleFonts.cairo(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 20.0.h,
                                bottom: 20.0.h,
                              ),
                              child: _editTitleTextField(
                                  "وصف عني", widget.aboutMe),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 25.0.h, horizontal: 10.w),
                              child: const MySeparator(
                                color: llightGrey,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/icon/6.svg"),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Text(
                                  'وصف عن شريكة حياتى',
                                  style: GoogleFonts.cairo(
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 20.0.h,
                              ),
                              child: _editTitleTextField(
                                  "وصف عن شريك حياتي", widget.aboutPartner),
                            ),
                          ]),
                    ),
                  ),
                )),
            const SizedBox(
              height: 18,
            ),
            widget.isGirl
                ? const SizedBox()
                : widget.isRequest
                    ? _cancel()
                    : _buildManButton(),
          ],
        ),
      ),
    );
  }

  Widget _editTitleChip(
    String txt,
  ) {
    return txt == "null"
        ? const SizedBox()
        : Chip(
            backgroundColor: white,
            side: BorderSide(
                color: lightPink, width: 1.7.w, style: BorderStyle.solid),
            label: Text(txt,
                style: GoogleFonts.cairo(
                  color: black,
                  fontSize: 14.0.sp,
                )),
          );
  }

  Widget _editTitleTextField(String txt, String txtValue) {
    return Container(
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: txt,
          labelStyle: GoogleFonts.cairo(
            color: basicPink,
            fontSize: 16.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Text(txtValue,
            style: GoogleFonts.cairo(
              color: black,
              fontSize: 14.0.sp,
            )),
      ),
    );
  }

  Widget _buildManButton() {
    controller.start();

    return Column(children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  color: basicPink,
                  border: Border.all(
                    color: transparnt,
                    width: 2,
                  )),
            //  height: MediaQuery.of(context).size.height <= 500 ? 300.h : 55.0.h,
              child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        barrierColor: liGrey.withOpacity(0.9),
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(24),
                        // ),
                        backgroundColor: transparnt,
                        //clipBehavior: Clip.antiAliasWithSaveLayer,
                        builder: (context) {
                          return Container(
                           height: MediaQuery.of(context).size.height <= 500 ? 600.h : 265.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: Colors.white70, width: 1),
                            ),
                            child: Column(
                              // crossAxisAlignment:
                              //     CrossAxisAlignment.center,
                              // mainAxisAlignment:
                              //     MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Image.asset("assets/image/j.png"),
                                  // color: Color(0xffFF8297),
                                  // size: 50,
                                ),
                                Text(
                                  "تأكيد خصم ${widget.cost} نقطة لاظهار رقم ولي الامر",
                                  style: GoogleFonts.cairo(fontSize: 14),
                                ),
                                 SizedBox(
                                  height: MediaQuery.of(context).size.height <= 500 ? 10.h : 20,
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(
                                      horizontal: 20, vertical: MediaQuery.of(context).size.height <= 500 ?5 :15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(35),
                                                color: basicPink,
                                                border: Border.all(
                                                  color: transparnt,
                                                  width: 2,
                                                )),
                                            child: TextButton(
                                              onPressed: widget.onSendRequest,
                                              child: Text("نعم",
                                                  style: GoogleFonts.cairo(
                                                      color: white,
                                                      fontSize: MediaQuery.of(context).size.height <= 500 ? 10.sp : 20.0.sp,)),
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(35),
                                                color: midGrey,
                                                border: Border.all(
                                                  color: transparnt,
                                                  width: 2,
                                                )),
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "لا",
                                                style: GoogleFonts.cairo(
                                                    color: white, fontSize: MediaQuery.of(context).size.height <= 500 ? 10.sp : 20.0.sp,),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0, horizontal: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ImageIcon(
                              AssetImage("assets/icon/love.png"),
                              size: 40,
                              color: white,
                            ),
                            Text(
                              "ارسال طلب ولي امر",
                              style: GoogleFonts.cairo(
                                  color: white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                  )),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: CustomTimer(
                  controller: controller,
                  builder: (state, time) {
                    bool isDone = false;
                    time.minutes == "00" ? isDone = true : isDone = false;
                    return Container(
                              decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27),
                            color: midGrey,
                            border: Border.all(
                              color: transparnt,
                              width: 2,
                            )),
                        child: TextButton(
                            onPressed: () {
                              widget.onCancel;
                            },
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${time.minutes}:${time.seconds}",
                                      style: GoogleFonts.cairo(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.height <= 500 ? 10.sp : 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    ImageIcon(
                                      AssetImage("assets/icon/x.png"),
                                      size: 30.w,
                                      color: white,
                                    ),
                                  ]),
                            )));
                  }),
            ),
          ]),
        ),
      ),
      const SizedBox(
        height: 18,
      ),
      GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            barrierColor: liGrey.withOpacity(0.9),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(24),
            // ),
            backgroundColor: transparnt,
            // barrierColor: liGrey.withOpacity(0.8),
            // shape: const RoundedRectangleBorder(
            //   borderRadius: BorderRadius.vertical(
            //     top: Radius.circular(28),
            //   ),
            // ),
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (context) {
              return Container(
                height: 265.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white70, width: 1),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "الابلاغ عن حساب",
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text(
                      "هل تريد تأكيد الابلاغ عن حساب",
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                    Text(
                      " حسام وليد",
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 50.h, left: 22.w, right: 22.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: basicPink,
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                        color: transparnt,
                                        width: 2,
                                      )),
                                  child: TextButton(
                                      onPressed: widget.onSubmitRep,
                                      child: Text(
                                        "نعم",
                                        style: GoogleFonts.cairo(
                                            color: white, fontSize: 23),
                                      )))),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: midGrey,
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                      color: transparnt,
                                      width: 2,
                                    )),
                                child: TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "لا",
                                      style: GoogleFonts.cairo(
                                          color: white, fontSize: 23),
                                    ))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Text(
          "الابلاغ عن الحساب",
          style: GoogleFonts.cairo(
              fontSize: 14, decoration: TextDecoration.underline),
        ),
      ),
    ]);
  }

  Widget _cancel() => Container(
        width: 132.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: black,
            border: Border.all(
              color: transparnt,
              width: 2.w,
            )),
        child: TextButton(
            onPressed: widget.cancelFather,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 5.w),
                child: Text(
                  "الغاء الطلب",
                  style: GoogleFonts.cairo(
                    color: white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            )),
      );
}
