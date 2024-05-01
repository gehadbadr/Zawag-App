import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/filter/filter.dart';
import 'package:effa/ui/screens/notification/notification.dart';
import 'package:effa/ui/widgets/filter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowNotify extends StatelessWidget {
  const ShowNotify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          // elevation: 1,

          shadowColor: Color(0xff707070),
          // foregroundColor: black,
          backgroundColor: Colors.white,
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
                Get.to(() => Notifications());
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Notifications()));
              },
            ),
          ),
        ),
        body: Center(
           // padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 10.h, 
                ),
                Image.asset(
                  "assets/image/nonotify.png",
                  width: 300.w,
                ),
                SizedBox(
                  height: 20.h, 
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                                "يتم الان عرض حسابك علي المستخدمين . سيصلك اشعار عندما يرسل احدهم طلب لكي",
                                style: TextStyle(color: darkblack, fontSize: 14.sp),
                              ),
                      ),
                        SizedBox(
                    height: 40.h, 
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text("يمكنك استخدام الفلتر لتحديد من يمكنه ارسال طلبات.",
                              style: TextStyle(color: midGrey, fontSize: 12.sp),
                            ),
                   ),
                    SizedBox(
                    height: 10.h, 
                  ),
                    ],
                  ),
                ),
                
                 InkWell(
                        onTap: () => Get.to(()=>Filter()),
                        child:FilterButton(title: "فلتر"))
              
              
              ]),
            )));
  }
}
