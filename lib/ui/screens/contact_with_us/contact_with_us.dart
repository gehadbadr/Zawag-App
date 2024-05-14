// ignore_for_file: must_be_immutable

import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/contact_us.dart';

class Contact extends StatelessWidget {
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController topic = TextEditingController();

  TextEditingController message = TextEditingController();
  ContactUs_And_ShareLink controller = ContactUs_And_ShareLink();
  Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGround,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: lliGrey,
              offset: Offset(0, 4.0),
              blurRadius: 5.0,
            )
          ]),
          child: AppBar(
            scrolledUnderElevation: 0,
            elevation: 0.0,
            // foregroundColor: Colors.white,
            // shadowColor: lliGrey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            backgroundColor: white,
            title: Center(
              child: Text(
                "تواصل معنا",
                style: GoogleFonts.cairo(color: black, fontSize: 18.sp),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("./././assets/icon/arrow_back.png"),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
            ],
            leading: Container(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 25.h, bottom: 10.h),
            child: Center(
              child: Image.asset(
                "assets/image/logo.png",
                width: 132.18.w,
                // height: 80.h,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white70, width: 1),
                boxShadow: const [
                  BoxShadow(
                      color: gGrey,
                      spreadRadius: 0.2,
                      blurRadius: 4,
                      offset: Offset(0, 3)),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 35.h),
                child: Column(children: [
                  _txtField(
                      name, 'الاسم ', "./././assets/icon/name.png", 1, context),
                  _txtField(email, 'البريد الالكتروني ',
                      "./././assets/icon/email.png", 1, context),
                  _txtField(topic, 'الموضوع ', "./././assets/icon/topic.png", 1,
                      context),
                  Container(
                      // height: 20,
                      child: _txtField(message, 'نص الرسالة ',
                          "./././assets/icon/topic.png", 4, context)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                      child: SizedBox(
                        width: 100.w,
                        //  height: 44.h,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: basicPink,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(22))),
                            ),
                            onPressed: () {
                              // if (name.text.trim().isNotEmpty ||
                              //     message.text.trim().isNotEmpty ||
                              //     email.text.trim().isNotEmpty ||
                              //     topic.text.trim().isNotEmpty) {
                              //   controller.contactUs(name.text, email.text,
                              //       topic.text, message.text);
                              // }
                            },
                            child: Text('ارسال',
                                style: GoogleFonts.cairo(
                                  color: white,
                                  fontSize: 14.sp,
                                ))),
                      ))
                ]),
              ),
            ),
          ),

          // Expanded(child: SizedBox())
        ]),
      ),
    );
  }

  Widget _txtField(TextEditingController cont, String txt, String img, int line,
          BuildContext context) =>
      Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: TextFormField(
            controller: cont,
            keyboardType: TextInputType.name,
            textAlignVertical: TextAlignVertical.top,
            onFieldSubmitted: (String value) {},
            maxLines: line,
            style: GoogleFonts.cairo(fontSize: 14.sp, height: 1),
            onChanged: (String value) {},
            decoration: InputDecoration(
              hintText: txt,
              hintStyle: GoogleFonts.cairo(fontSize: 14.sp),
              prefixIcon: ImageIcon(
                AssetImage(img),
                color: ddGrey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: basicPink, width: 1),
              ),
              border: const OutlineInputBorder(
                borderSide: const BorderSide(color: basicPink, width: 1),
              ),
            ),
          ),
        ),
      );
}
