import 'package:effa/controllers/quistions_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/dashboard/male_dashboard.dart';
import 'package:effa/ui/widgets/show_status_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'info_bottom_sheet.dart';

class RegisterButton extends StatelessWidget {
  Widget title;
  VoidCallback function;
  VoidCallback nav;
  Color color;
  bool? gradient;
  RegisterButton(
      {Key? key,
      required this.title,
      required this.function,
      required this.nav,
      required this.color,
      this.gradient})
      : super(key: key);

  final List<double> stops = [0.1, 0.4, 0.5, 0.2];
  // Color backgroundG = Colors.grey;
  //  Color fill = Colors.redAccent;
  // final List<Color> gradientColors = [
  //   backgroundG,
  //   backgroundG,
  //   fill,
  //   fill,
  // ];
  final controller = Get.lazyPut(() => QuestionsController(), fenix: false);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        gradient != null
            ? Expanded(
                child: GetBuilder<QuestionsController>(builder: (controller) {
                  int length = controller.len;
                  double lengthprecentage = 0;
                  if (length > 10) {
                    lengthprecentage = 0.5;
                  } else {
                    lengthprecentage = 0.2;

                  }
                  return LinearPercentIndicator(
                      alignment: MainAxisAlignment.end,
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      //   fillColor: Colors.blue,
                      barRadius: const Radius.circular(10),
                      isRTL: true,
                      width: MediaQuery.of(context).size.width / 1.4,
                      animation: true,
                      lineHeight: MediaQuery.of(context).size.height <= 500
                          ? 100.h
                          : 55.h,
                      animationDuration: 2000,
                      percent: lengthprecentage,
                      center: TextButton(
                        onPressed: nav,
                        child: title,
                      ),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: color,
                      backgroundColor: midGrey);
                }),
              )
            : Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: color),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    onPressed: nav,
                    child: title,
                  ),
                ),
              ),
        SizedBox(
          width: 15.h,
        ),
        InkWell(
          onTap: function,
          child: Container(
            decoration: const BoxDecoration(
                color: ggrey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              child: SvgPicture.asset("assets/icon/9.svg"),
            ),
          ),
        ),
      ],
    );
  }
}
