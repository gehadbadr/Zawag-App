import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WaitBottomSheet extends StatelessWidget {
  const WaitBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
              child: Card(
            color: white,
            elevation: 6,
            shadowColor: black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0.h),
                        child: Text(
                          "عنوان",
                          style: GoogleFonts.cairo(
                              decoration: TextDecoration.underline,
                              color: basicPink,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "محتوي الرساله",
                            style: GoogleFonts.cairo(fontSize: 16.sp),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          )),
        ],
      ),
    );
  }
}
