import 'package:effa/controllers/basic_pages_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class BirthDate extends StatelessWidget {
  BasicPagesController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                'تاريخ ميلادك ؟',
                style: GoogleFonts.cairo(fontSize: 20.sp),
              ),
            )),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 18.0.h,
            ),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: llgrey, width: 1.w),
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                child: CupertinoDatePicker(
                  dateOrder: DatePickerDateOrder.ymd,
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: controller.myDate,
                  minimumYear: 1960,
                  minimumDate: DateTime(1960, 12, 31),
                  // maximumYear: 2002,
                  maximumDate: DateTime(2005, 12, 31),
                  onDateTimeChanged: (dateTime) {
                    controller.myDate = dateTime == null ? controller.myDate : dateTime;
                    debugPrint("$dateTime");
                  },
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: SizedBox(
            width: 264.w,
            child: RoundedButton(
                mywidget: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Text('التالي',
                      style: GoogleFonts.cairo(
                        color: white,
                        fontSize: 16.sp,
                      )),
                ),
                raduis: 10,
                myfun: () {
                  controller.onTap();
                },
                color: basicPink),
          ),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(
            // height: 10,
          ),
        )
      ],
    );
  }
}
