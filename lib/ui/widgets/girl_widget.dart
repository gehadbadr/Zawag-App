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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
              color: Colors.white70, width: 1
          ),
          boxShadow: [
            const BoxShadow(
                color: gGrey,
                spreadRadius: 0.2,
                blurRadius:4,
                offset: Offset(0,3)
            ),
          ],
        ),
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
              child: Padding(
                padding:  EdgeInsets.only(left: 8.0.w,right: 8.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     ImageIcon(
                      const AssetImage("assets/icon/person.png"),
                      size: 25.h,
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
                        child: const VerticalDivider(color: Color(0xffECECEC))),
                    ImageIcon(
                      const AssetImage("assets/icon/ba.png"),
                      size: 25.h,
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
                        child: const VerticalDivider(color: Color(0xffECECEC))),
                    ImageIcon(
                      const AssetImage("assets/icon/stu.png"),
                      size: 25.h,
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
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Divider(
                thickness: 1.w,
                color: const Color(0xffECECEC),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 7.w,
                  ),
                   Row(

                     children: [
                       ImageIcon(
                        const AssetImage("assets/icon/stat.png"),
                        size: 25.h,
                        color: red,
                                         ),
                                         SizedBox(
                                           width: 7.w,
                                         ),
                                         Text(
                        socialSituation,
                        style: GoogleFonts.cairo(fontSize: 14.sp, color: dmGrey),
                                         ),
                     ],
                   ),

                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: SizedBox(
                          height: 25.h,
                          child: const VerticalDivider(color: Color(0xffECECEC)))),
                  Row(
                    children: [
                      ImageIcon(
                        const AssetImage("assets/icon/al.png"),
                        size: 25.h,
                        color: red,
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(
                        nationality,
                        style: GoogleFonts.cairo(fontSize: 14.sp, color: dmGrey),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Divider(
                thickness: 1.w,
                color: const Color(0xffECECEC),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    const AssetImage("assets/icon/loc.png"),
                    size: 25.h,
                    color: red,
                  ),
                  const SizedBox(
                    width: 5,
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
              height: 38.h,
            ),
          ],
        ),
      ),
    );
  }
}
