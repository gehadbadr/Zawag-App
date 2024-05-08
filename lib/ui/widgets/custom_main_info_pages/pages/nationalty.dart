import 'package:effa/controllers/basic_pages_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NationalityInfo extends GetView<BasicPagesController> {
  NationalityInfo({Key? key}) : super(key: key);
  BasicPagesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Text(
            ' الجنسية ؟',
            style: GoogleFonts.cairo(
              fontSize:
                  MediaQuery.of(context).size.height <= 500 ? 14.sp : 20.0.sp,
            ),
          ),
        )),
        Padding(
          padding: EdgeInsets.only(right: 12.w, left: 12.w, top: 5.h),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              onChanged: (value) => controller.filterNationality(value),
              cursorColor: basicPink,
              controller: controller.searchController,
              decoration: const InputDecoration(
                hintText: " بحث ... ",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: grey),
                ),
                focusColor: basicPink,
                fillColor: basicPink,
                prefixIcon: Icon(
                  Icons.search,
                  color: basicPink,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: white, width: 0.3.w),
              borderRadius: BorderRadius.circular(15),
            ),
            color: white,
            child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Obx(
                      () => ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.found.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                controller.choseNational(index, true);
                                controller.choseNational(
                                    controller.found[index]!.id, true);
                                controller.onTap();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: 30.0.h, right: 10.w, left: 10.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check,
                                      size: 30,
                                      color: controller.tapIndex ==
                                                  controller.found[index]!.id &&
                                              controller.nationalPress == true
                                          ? basicPink
                                          : transparnt,
                                    ),
                                    const Spacer(),
                                    Text(
                                      controller.choosenGender == 1
                                          ? controller.found[index]!.name
                                          : controller.found[index]!.fName,
                                      style: GoogleFonts.cairo(
                                          fontSize: 16.sp,
                                          color: controller.tapIndex ==
                                                      controller
                                                          .found[index]!.id &&
                                                  controller.nationalPress == true
                                              ? basicPink
                                              : black),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ))),
          ),
        ),
      ]),
    );
  }
}
