import 'package:effa/controllers/basic_pages_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

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
            style: GoogleFonts.cairo(
              fontSize:
                  MediaQuery.of(context).size.height <= 500 ? 14.sp : 20.0.sp,
            ),
          ),
        )),
        Padding(
          padding: EdgeInsets.only(
            bottom: 45.0.h,
          ),
          child: Card(
            elevation: 3,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: llgrey, width: 1.w),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height <= 500 ? 200.h : 392.h,
              child: ScrollDatePicker(
                selectedDate: controller.myDate,
                scrollViewOptions: DatePickerScrollViewOptions(
                    year: ScrollViewDetailOptions(
                        selectedTextStyle: GoogleFonts.cairo(
                          fontSize: MediaQuery.of(context).size.height <= 500
                              ? 10.sp
                              : 22.0.sp,
                        ),
                        alignment: Alignment.centerRight,
                        textStyle: GoogleFonts.cairo(
                          fontSize: MediaQuery.of(context).size.height <= 500
                              ? 10.sp
                              : 22.0.sp,
                        )),
                    day: ScrollViewDetailOptions(
                        selectedTextStyle: GoogleFonts.cairo(
                          fontSize: MediaQuery.of(context).size.height <= 500
                              ? 10.sp
                              : 22.0.sp,
                        ),
                        alignment: Alignment.centerLeft,
                        textStyle: GoogleFonts.cairo(
                          fontSize: MediaQuery.of(context).size.height <= 500
                              ? 10.sp
                              : 22.0.sp,
                        )),
                    month: ScrollViewDetailOptions(
                        selectedTextStyle: GoogleFonts.cairo(
                          fontSize: MediaQuery.of(context).size.height <= 500
                              ? 10.sp
                              : 22.0.sp,
                        ),
                        alignment: Alignment.center,
                        textStyle: GoogleFonts.cairo(
                          fontSize: MediaQuery.of(context).size.height <= 500
                              ? 10.sp
                              : 22.0.sp,
                        ))),
                maximumDate: DateTime(2010, 12, 31),
                minimumDate: DateTime(1960, 12, 31),
                viewType: const [
                  DatePickerViewType.year,
                  DatePickerViewType.month,
                  DatePickerViewType.day,
                ],
                options: const DatePickerOptions(
                  isLoop: true,
                ),
                locale: const Locale('ar'),
                onDateTimeChanged: (DateTime value) {
                  controller.myDate = value == null ? controller.myDate : value;
                  debugPrint("$value");
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Container(
          width: 264.w,
          // padding: EdgeInsets.all(5.0),
          // height: 44.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: basicPink,
              padding: const EdgeInsets.all(2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text('التالي',
                style: GoogleFonts.cairo(
                  color: white,
                  fontSize: MediaQuery.of(context).size.height <= 500
                      ? 10.sp
                      : 16.0.sp,
                )),
            // raduis: 10,
            // myfun: () {

            // },
            // color: basicPink,
            onPressed: () {
             
              controller.onTap();
            },
          ),
        ),
       
          
         
        ),
        // const Expanded(
        //   flex: 1,
        //   child: SizedBox(
        //     // height: 10,
        //   ),
        // )
      ],
    );
  }
}
// CupertinoTheme(
// data: CupertinoThemeData(
//
// brightness: Brightness.light,
// // primaryColor: Colors.white,
// textTheme: CupertinoTextThemeData(
//
// dateTimePickerTextStyle:GoogleFonts.cairo(
// fontSize:22.sp,
//
// )
// ),
// ),
// child: CupertinoDatePicker(
//
// dateOrder: DatePickerDateOrder.ymd,
// mode: CupertinoDatePickerMode.date,
//
// initialDateTime: controller.myDate,
// minimumYear: 1960,
// minimumDate: DateTime(1960, 12, 31),
// use24hFormat: true,
// // maximumYear: 2002,
// maximumDate: DateTime(2005, 12, 31),
// onDateTimeChanged: (dateTime) {
// controller.myDate = dateTime == null ? controller.myDate : dateTime;
// debugPrint("$dateTime");
// },
// ),
// ),