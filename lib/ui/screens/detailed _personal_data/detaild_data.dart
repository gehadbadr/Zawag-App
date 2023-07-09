import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/about_me_and_partner/about_me&partner.dart';
import 'package:effa/ui/screens/confirm_identfy/confirm_id.dart';
import 'package:effa/ui/screens/dashboard/male_dashboard.dart';
import 'package:effa/ui/screens/education_work/education_work.dart';
import 'package:effa/ui/screens/family/family.dart';
import 'package:effa/ui/screens/father_data/father_data.dart';
import 'package:effa/ui/screens/my_account/my_account.dart';
import 'package:effa/ui/screens/personal_data/personal_data.dart';
import 'package:effa/ui/screens/personal_photo/personal_photos.dart';
import 'package:effa/ui/screens/r_social_status/social_status.dart';
import 'package:effa/ui/widgets/detailed_widget.dart';
import 'package:effa/ui/widgets/edit_button.dart';
import 'package:effa/ui/widgets/info_bottom_sheet.dart';
import 'package:effa/ui/widgets/saprator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/register_button.dart';
class DetailedInfo extends StatelessWidget {
  bool showEdit;
   DetailedInfo({Key? key,required this.showEdit}) : super(key: key);
  final gender = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height:45.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: SvgPicture.asset(
                "assets/image/logo.svg",
                width: 100.w,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: llgrey, width: 1.w),
                borderRadius: BorderRadius.circular(15),
              ),
              color: white,
              child: Column(
                children: [
                  InkWell(
                      child: DetailedWidget(icon: "assets/icon/1.svg",subject: "مشاهدة حسابي",done: false,),
                    onTap: (){
                      Get.to(
                              () => MyProfile(showEdit: false,));
                    },
                  ),
                  const MySeparator(color: llightGrey,),
                  InkWell(onTap:(){
                    Get.to(
                        PersonalData(), //next page class
                        duration: const Duration(milliseconds: 400), //duration of transitions, default 1 sec
                        transition: Transition.leftToRight //transition effect
                    );
                  },child: DetailedWidget(icon: "assets/icon/2.svg",subject: "البيانات الشخصية & الجسدية",done: false,)),
                  const MySeparator(color: llightGrey,),
                  InkWell(
                    onTap: (){
                      Get.to(
                          SocialState(), //next page class
                          duration: const Duration(milliseconds: 400), //duration of transitions, default 1 sec
                          transition: Transition.leftToRight //transition effect
                      );
                    },
                      child: DetailedWidget(icon: "assets/icon/3.svg",subject: "الدين&الحالةالأجتماعية",done: false,)),
                  const MySeparator(color: llightGrey,),
                  InkWell(
                    onTap: (){
                      Get.to(
                          EduAndWork(), //next page class
                          duration: const Duration(milliseconds: 400), //duration of transitions, default 1 sec
                          transition: Transition.leftToRight //transition effect
                      );
                    },
                      child: DetailedWidget(icon: "assets/icon/4.svg",subject: "التعليم & العمل",done: false,)),
                  const MySeparator(color: llightGrey,),
                  InkWell(
                      onTap: (){
                        Get.to(
                            Family(), //next page class
                            duration: const Duration(milliseconds: 400), //duration of transitions, default 1 sec
                            transition: Transition.leftToRight //transition effect
                        );
                      },
                      child: DetailedWidget(icon: "assets/icon/5.svg",subject: "العائلة",done: false,)),
                  const MySeparator(color: llightGrey,),
                  gender.read("gender")==1?InkWell(
                      onTap: (){
                        Get.to(
                            PersonalPic(), //next page class
                            duration: const Duration(milliseconds: 400), //duration of transitions, default 1 sec
                            transition: Transition.leftToRight //transition effect
                        );
                      },
                      child: DetailedWidget(icon: "assets/icon/7.svg",subject: "الصور الشخصية",done: false,)):InkWell(
                      onTap: (){
                        Get.to(
                            FatherInfo(), //next page class
                            duration: const Duration(milliseconds: 400), //duration of transitions, default 1 sec
                            transition: Transition.leftToRight //transition effect
                        );
                      },
                      child: DetailedWidget(icon: "assets/icon/13.svg",subject: "بيانات ولي الامر",done: false,)),
                  const MySeparator(color: llightGrey,),
                  InkWell(
                      onTap: (){
                        Get.to(
                            AboutMe(), //next page class
                            duration: const Duration(milliseconds: 400), //duration of transitions, default 1 sec
                            transition: Transition.leftToRight //transition effect
                        );
                      },
                      child: DetailedWidget(icon: "assets/icon/6.svg",subject: gender.read("gender")==1?"وصف عني & عن شريكة حياتي":"وصف عني & عن شريك حياتي",done: false,)),

                  const MySeparator(color: llightGrey,),
                  InkWell(
                      onTap: (){
                        Get.to(
                            ConfirmInfo(), //next page class
                            duration: const Duration(milliseconds: 400), //duration of transitions, default 1 sec
                            transition: Transition.leftToRight //transition effect
                        );
                      },
                      child: DetailedWidget(icon: "assets/icon/8.svg",subject: "تأكيد بياناتي",done: false,)),
                ],
              )
            ),
            SizedBox(height: 30.h,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10),
              child: showEdit?EditButton(title: "رجوع"):RegisterButton(
                title: Text('تسجيل الحساب',
                    style: GoogleFonts.cairo(
                      color: white,
                      fontSize: 16.sp,
                    )),
                function: (){
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: transparnt,
                      builder: (context) {
                        return const WaitBottomSheet();
                      });
                },
                nav: (){
                  Get.to(
                    DashBoardMale(),);
                },
                color: basicPink,
              ),
            ),
            SizedBox(height: 20.h,)
          ],
        ),
      ),
    );
  }
}
