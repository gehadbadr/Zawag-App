import 'package:effa/controllers/quistions_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/models/questions/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class TextQuestion extends StatelessWidget {
  TextQuestion(
      {Key? key,
        required this.question,

      })
      : super(key: key);
  String question;
  final QuestionsController controller = Get.find();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                question,
                style: GoogleFonts.cairo(fontSize: 20.sp),
              ),
            )),
        Padding(
          padding:
          EdgeInsets.only(right: 15.w, left: 15.w, top: 10.h),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              cursorColor: basicPink,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 20.h, horizontal: 15.w),
                hintStyle: GoogleFonts.cairo(fontSize: 14.sp),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: grey, width: 2.w),
                  borderRadius:
                  BorderRadius.all(Radius.circular(15.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: basicPink, width: 1.5.w),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusColor: basicPink,
              ),
              controller: controller.txtAnswerController,
              onEditingComplete: () async {
                controller.changeIndex(1);
              },
            ),
          ),
        )
      ],
    );
  }
}
