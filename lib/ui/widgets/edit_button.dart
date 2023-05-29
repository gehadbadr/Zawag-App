import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class EditButton extends StatelessWidget {
  const EditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148.w,
      height: 48.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color:ggrey
      ),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "تعديل الحساب",
            style: GoogleFonts.cairo(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
          Image.asset("assets/icon/edit.png"),
        ],
      ),
    );
  }
}