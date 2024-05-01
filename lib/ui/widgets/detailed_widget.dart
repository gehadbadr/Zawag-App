import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
class DetailedWidget extends StatelessWidget {
  DetailedWidget({
    Key? key,
    required this.icon,
    required this.subject,
    required this.done,
  }) : super(key: key);
final String icon;
final String subject;
final bool done;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:20.h,left: 18.w, right: 18.w, bottom: 20.h),
      child:  Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              SvgPicture.asset(icon),
              SizedBox(
                width: 7.w,
              ),
              Text(
                subject,
                style: GoogleFonts.cairo(
                  fontSize: 16.sp,
                  color: black,
                ),
              ),
              const Spacer(),
              done?const Icon(
                  Icons.check,
                  size: 30,
                  color:
                  basicPink
              ):const SizedBox(),
            ],
          ),
        ),
    );
  }
}
