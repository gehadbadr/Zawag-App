import 'package:effa/controllers/my_profile_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/saprator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyInfoCard extends StatelessWidget {
  MyInfoCard({Key? key}) : super(key: key);
  MyProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0.h),
      child: SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 6.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: white,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.only(
                    right: 15.0.w, left: 15.0.w, top: 25.h, bottom: 33.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/icon/2.svg"),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            'البيانات الشخصية & الجسدية',
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Wrap(
                        spacing: 5.0,
                        children: List<Widget>.generate(
                            controller.personal.length, (int index) {
                          return _editTitleChip(
                            controller.personal[index],
                          );
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 25.0.h, horizontal: 10.w),
                        child: const MySeparator(
                          color: llightGrey,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icon/3.svg"),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            'الدين & الحالة الإجتماعية ',
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Wrap(
                        spacing: 5.0,
                        children: List<Widget>.generate(
                            controller.relegion.length, (int index) {
                          return _editTitleChip(
                            controller.relegion[index],
                          );
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 25.0.h, horizontal: 10.w),
                        child: const MySeparator(
                          color: llightGrey,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icon/4.svg"),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            'التعليم & العمل',
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Wrap(
                        spacing: 5.0,
                        children: List<Widget>.generate(controller.study.length,
                            (int index) {
                          return _editTitleChip(
                            controller.study[index],
                          );
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 25.0.h, horizontal: 10.w),
                        child: const MySeparator(
                          color: llightGrey,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icon/5.svg"),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            'العائله',
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Wrap(
                        spacing: 5.0,
                        children: List<Widget>.generate(
                            controller.family.length, (int index) {
                          return _editTitleChip(
                            controller.family[index],
                          );
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 25.0.h, horizontal: 10.w),
                        child: const MySeparator(
                          color: llightGrey,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icon/interstes.svg"),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            'الاهتمامات',
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Wrap(
                        spacing: 5.0,
                        //runSpacing: 6.0,
                        children: List<Widget>.generate(
                            controller.interests.length, (int index) {
                          return _editTitleChip(
                            controller.interests[index],
                          );
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 25.0.h, horizontal: 10.w),
                        child: const MySeparator(
                          color: llightGrey,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icon/6.svg"),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            'وصف عنى',
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20.0.h,
                          bottom: 20.0.h,
                        ),
                        child: _editTitleTextField(
                            "وصف عني", " snp.data!.user!.aboutYou!"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 25.0.h, horizontal: 10.w),
                        child: const MySeparator(
                          color: llightGrey,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icon/6.svg"),
                          SizedBox(
                            width: 7.w,
                          ),
                          Text(
                            'وصف عن شريكة حياتى',
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20.0.h,
                        ),
                        child: _editTitleTextField("وصف عن شريك حياتي",
                            "snp.data!.user!.aboutPartner!"),
                      ),
                    ]),
              ),
            ),
          )),
    );
  }

  Widget _editTitleChip(
    String txt,
  ) {
    return txt == "null"
        ? SizedBox()
        : Chip(
            backgroundColor: white,
            side: BorderSide(
                color: lightPink, width: 1.7.w, style: BorderStyle.solid),
            label: Text(txt,
                style: TextStyle(
                  color: black,
                  fontSize: 14.0.sp,
                )),
          );
  }

  Widget _editTitleTextField(String txt, String txtValue) {
    return Container(
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: txt,
          labelStyle: TextStyle(
            color: basicPink,
            fontSize: 16.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Text(txtValue,
            style: TextStyle(
              color: black,
              fontSize: 14.0.sp,
            )),
      ),
    );
  }
}
