import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart' as ShareApp;
import 'package:share_plus/share_plus.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGround,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
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
                " الاشعارات",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                      padding: const EdgeInsets.all(15.0),
                      width: double.infinity - 20.w,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        "هناك اشعار جديد",
                        style: TextStyle(color: fontGrey, fontSize: 14.sp),
                      )),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                      padding: const EdgeInsets.all(15.0),
                      width: double.infinity - 20.w,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        "وريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت",
                        style: TextStyle(color: fontGrey, fontSize: 14.sp),
                      )),
                ),
              ]),
        ),
      ),
    );
  }
}
