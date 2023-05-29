
import 'package:effa/controllers/male_dashboard_controller.dart';
import 'package:effa/controllers/switch_filter_controllrt.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';


class DashBoardMale extends StatelessWidget {
  DashBoardMale({Key? key}) : super(key: key);
  MaleDashboardController controller =Get.put(MaleDashboardController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MaleDashboardController>(
      builder: (controller){
        return Scaffold(
          backgroundColor: bGround,
          appBar: AppBar(
            elevation: 0,
            foregroundColor: black,
            backgroundColor: white,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 14.w),
                child: SvgPicture.asset(
                  "assets/image/logo.svg",
                  width: 66.w,
                ),
              ),
            ],
            leading: Padding(
              padding: EdgeInsets.only(
                left: 8.w,
              ),
              child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icon/notif.svg",
                ),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Notifications()));
                },
              ),
            ),
          ),
          body:
          controller.pages.elementAt(controller.selectedIndex),
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.rtl,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedIconTheme: IconThemeData(color: lGrey, size: 40),
              showUnselectedLabels: true,
              unselectedLabelStyle:
              GoogleFonts.cairo(color: lGrey, fontWeight: FontWeight.bold),
              unselectedItemColor: lGrey,
              //mouseCursor: SystemMouseCursors.grab,
              selectedFontSize: 12.sp,
              unselectedFontSize: 12.sp,
              selectedIconTheme: IconThemeData(color: basicPink, size: 40),
              selectedItemColor: basicPink,
              selectedLabelStyle: GoogleFonts.cairo(color: basicPink),
              currentIndex: controller.selectedIndex,
              onTap: controller.onItemTapped,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icon/tab4.svg", ),
                  label: 'الرئيسية',
                  activeIcon: SvgPicture.asset("assets/icon/tab4.svg", color: basicPink),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icon/tab3.svg" ,color: grey,),
                  label: 'فلتر',
                  activeIcon: SvgPicture.asset("assets/icon/tab3.svg", color: basicPink,),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icon/tab2.svg"),
                  label: 'حسابي',
                  activeIcon: SvgPicture.asset("assets/icon/tab2.svg" , color: basicPink,),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icon/tab1.svg"),
                  label: 'الاعدادات',
                  activeIcon: SvgPicture.asset("assets/icon/tab1.svg" , color: basicPink,),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
