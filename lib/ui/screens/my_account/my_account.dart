import 'package:carousel_slider/carousel_slider.dart';
import 'package:effa/controllers/my_profile_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/detailed%20_personal_data/detaild_data.dart';
import 'package:effa/ui/widgets/edit_button.dart';
import 'package:effa/ui/widgets/my_info_card.dart';
import 'package:effa/ui/widgets/profile_card.dart';
import 'package:effa/ui/widgets/saprator.dart';
import 'package:effa/ui/widgets/girl_widget.dart';
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
        appBar:  PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: lliGrey,
                offset: Offset(0, 4.0),
                blurRadius: 5.0,
              )
            ]),
            child: AppBar(
              elevation: 0.0,
              scrolledUnderElevation: 0,
              // foregroundColor: Colors.white,
              // shadowColor: lliGrey,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              backgroundColor: white,
              title: Center(
                child: Text(
                  "مشاهدة حسابي",
                  style: GoogleFonts.cairo(color: black, fontSize: 18.sp),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("./././assets/icon/arrow_back.png"),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
              ],
              leading: Container(),
            ),
          ),
        ),
        body: GetBuilder<MyProfileController>(
          builder: (controller){
            return controller.loader?const Center(child: CircularProgressIndicator(color: basicPink,),):SingleChildScrollView(
              child: Padding(
                padding:
                EdgeInsets.only(right: 10.w, left: 10.w, top: 9.h, bottom: 30.h),
                child: Column(children: [
                  controller.gender?ProfileCard(): 
                  GirlWidget(
                            name: "نورهان",
                            age: "22",
                            job: "لاتوجد وظيفه",
                            education: "عالي",
                            socialSituation: "عزباء",
                            nationality: "مصريه",
                            address: "القاهره"),
                  MyInfoCard(),
                  showEdit?InkWell(
                      onTap: (){
                        Get.to(
                          DetailedInfo(showEdit: true,),);
                      },
                      child: EditButton(title: "تعديل الحساب")):const SizedBox()
                ]),
              ),
            );
          },
        )

    );
  }
}
