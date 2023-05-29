import 'package:effa/controllers/basic_pages_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/custom_main_info_pages/main_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainData extends StatelessWidget {
  MainData({Key? key}) : super(key: key);
  BasicPagesController controller =
      Get.put(BasicPagesController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      bool result = await controller.onPrevious();
      return result;
    }, child: GetBuilder<BasicPagesController>(builder: (controller) {
      return Scaffold(
        body: controller.loaderN?const Center(child: CircularProgressIndicator(color: basicPink,),):Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(children: [
            SizedBox(
              height: 65.h,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(children: [
                SvgPicture.asset("assets/icon/nextto.svg"),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'البيانات الأساسية',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.cairo(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 45.h, top: 20.h),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 250),
                        tween: Tween(begin: 0.0, end: controller.position),
                        builder: (context, val, _) => LinearProgressIndicator(
                            minHeight: 9.h,
                            backgroundColor: bgrey,
                            valueColor:
                                const AlwaysStoppedAnimation<Color>(basicPink),
                            value: val),
                      ),
                    )),
              ),
            ),
            Expanded(child: CustomRegisterView())
          ]),
        ),
      );
    }));
  }
}
