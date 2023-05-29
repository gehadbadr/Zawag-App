import 'package:carousel_slider/carousel_slider.dart';
import 'package:effa/controllers/my_profile_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/edit_button.dart';
import 'package:effa/ui/widgets/my_info_card.dart';
import 'package:effa/ui/widgets/profile_card.dart';
import 'package:effa/ui/widgets/saprator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class MyProfile extends StatelessWidget {
  bool showEdit;
  MyProfile({Key? key,required this.showEdit}) : super(key: key);
  MyProfileController controller = Get.put(MyProfileController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bGround,
        appBar: AppBar(
          elevation: 7,
          shadowColor: lliGrey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: white,
          title: Center(
            child: Text(
              "مشاهدة حسابي",
              style: GoogleFonts.cairo(
                  color: black,
                  fontSize: 18.sp),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset("assets/icon/arrow_back.svg"),
            ),
            SizedBox(
              width: 15.w,
            ),
          ],
          leading: Container(),
        ),
        body: SingleChildScrollView(
                child: Padding(
                  padding:
                  EdgeInsets.only(right: 10.w, left: 10.w, top: 9.h, bottom: 30.h),
                  child: Column(children: [
                    ProfileCard(),
                    MyInfoCard(),
                    showEdit?const EditButton():const SizedBox()
                  ]),
                ),
              )

    );
  }
}
