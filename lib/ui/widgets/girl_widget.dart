import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class GirlWidget extends StatelessWidget {
  String name;
  String age;
  String job;
  String education;
  String socialSituation;
  String nationality;
  String address;

  GirlWidget({
    Key? key,
    required this.name,
    required this.age,
    required this.job,
    required this.education,
    required this.socialSituation,
    required this.nationality,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/report3.png",
                    fit: BoxFit.cover,
                    width: 72.w,
                    height: 72.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    name,
                    style: GoogleFonts.cairo(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                ],
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  const ImageIcon(
                    AssetImage("assets/icon/person.png"),
                    size: 40,
                    color: red,
                  ),
                  Text(
                    age,
                    style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        color: black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' سنة',
                    style: GoogleFonts.cairo(fontSize: 14.sp, color: black),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                      height: 25.h,
                      child: const VerticalDivider(color: grey)),
                  const ImageIcon(
                    AssetImage("assets/icon/ba.png"),
                    size: 40,
                    color: red,
                  ),
                  Text(
                    job,
                    style: GoogleFonts.cairo(fontSize: 14.sp, color: dmGrey),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SizedBox(
                      height: 25.h,
                      child: const VerticalDivider(color: grey)),
                  const ImageIcon(
                    AssetImage("assets/icon/stu.png"),
                    size: 40,
                    color: red,
                  ),
                  Text(
                    education,
                    style: GoogleFonts.cairo(fontSize: 14.sp, color: dmGrey),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Divider(
                thickness: 2.w,
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ImageIcon(
                    AssetImage("assets/icon/stat.png"),
                    size: 40,
                    color: red,
                  ),
                  Text(
                    socialSituation,
                    style: GoogleFonts.cairo(fontSize: 14.sp, color: dmGrey),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: SizedBox(
                          height: 25.h,
                          child: const VerticalDivider(color: grey))),
                  const ImageIcon(
                    AssetImage("assets/icon/al.png"),
                    size: 40,
                    color: red,
                  ),
                  Text(
                    nationality,
                    style: GoogleFonts.cairo(fontSize: 14.sp, color: dmGrey),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Divider(
                thickness: 2.w,
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ImageIcon(
                    AssetImage("assets/icon/loc.png"),
                    size: 40,
                    color: red,
                  ),
                  Text(
                    address,
                    style: GoogleFonts.cairo(fontSize: 14.sp, color: dmGrey),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Image.asset(
              "assets/image/flower.png",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
