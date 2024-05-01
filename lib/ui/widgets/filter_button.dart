import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterButton extends StatelessWidget {
  String title;
  FilterButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148.w,
      height: MediaQuery.of(context).size.height <= 500 ? 200.h : 48.h,
      decoration: BoxDecoration(
          border: Border.all(color: basicPink),
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.cairo(
                color: basicPink, fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5.w,),
          SvgPicture.asset(
            "assets/icon/tab3.svg",
            color: basicPink,
          ),
        ],
      ),
    );
  }
}
