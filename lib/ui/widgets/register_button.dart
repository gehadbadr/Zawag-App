import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/dashboard/male_dashboard.dart';
import 'package:effa/ui/widgets/show_status_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'info_bottom_sheet.dart';
class RegisterButton extends StatelessWidget {
  Widget title;
  VoidCallback function;
  VoidCallback nav;
  Color color;
  RegisterButton({Key? key,required this.title,required this.function,required this.nav,required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: color
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                onPressed: nav,
                child: title,
              ),
            ),
          ),
          SizedBox(
            width: 15.h,
          ),
          InkWell(
            onTap:function,
            child: Container(
              decoration: const BoxDecoration(
                  color: ggrey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: SvgPicture.asset(
                    "assets/icon/9.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
