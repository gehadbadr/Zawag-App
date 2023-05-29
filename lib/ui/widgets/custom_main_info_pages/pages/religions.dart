import 'package:effa/controllers/basic_pages_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Religion extends StatelessWidget {
  Religion({Key? key}) : super(key: key);
  BasicPagesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            ' الديانة ؟',
            style: GoogleFonts.cairo(fontSize: 20.sp),
          ),
        )),
        SizedBox(
          height: 40.h,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: llgrey, width: 1.w),
              borderRadius: BorderRadius.circular(15),
            ),
            color: white,
            child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                child: GetBuilder<BasicPagesController>(
                  builder: (controller) {
                    return Directionality(
                      textDirection: TextDirection.ltr,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.religionList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                controller.choseReligion(index, true);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: 30.0.h, right: 10.w, left: 10.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check,
                                      size: 30,
                                      color: controller.religionTapIndex ==
                                                  index &&
                                              controller.religionPress == true
                                          ? basicPink
                                          : transparnt,
                                    ),
                                    Spacer(),
                                    Text(
                                      controller.religionList[index],
                                      style: GoogleFonts.cairo(
                                          fontSize: 16.sp,
                                          color: controller.religionTapIndex ==
                                                      index &&
                                                  controller.religionPress ==
                                                      true
                                              ? basicPink
                                              : black),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  },
                )),
          ),
        )
      ],
    );
  }
}
