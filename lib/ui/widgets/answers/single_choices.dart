import 'package:effa/controllers/quistions_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/models/questions/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleChoice extends StatelessWidget {
  String question;
  int idQuestion;
  List<Answer> answers;
  TextEditingController editingController;
  SingleChoice(
      {Key? key,
      required this.question,
      required this.idQuestion,
      required this.answers,
      required this.editingController})
      : super(key: key);
  final QuestionsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsController>(builder: (controller) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "${question}",
                style: GoogleFonts.cairo(fontSize: 20.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Padding(
          //   padding:
          //   EdgeInsets.only(right: 30.w, left: 30.w, bottom: 8.h, top: 8.h),
          //   child: Directionality(
          //     textDirection: TextDirection.rtl,
          //     child: TextField(
          //       style: GoogleFonts.cairo(
          //         fontSize: 18.0, // Set the font size
          //         color: Colors.black, // Set the text color
          //         fontWeight: FontWeight.bold, // Set the font weight
          //         decorationColor: basicPink, // Set the underline color
          //         decorationThickness: 2.0, // Set the underline thickness
          //       ),
          //       cursorColor: basicPink,
          //       onChanged: (value) {
          //
          //       },
          //       controller: editingController,
          //       decoration: InputDecoration(
          //         hintText: " بحث ... ",
          //         hintStyle:  GoogleFonts.cairo(
          //           fontSize: 12.0, // Set the font size
          //         ),
          //         focusedBorder: const UnderlineInputBorder(
          //           borderSide: BorderSide(color: grey),
          //         ),
          //         focusColor: basicPink,
          //         fillColor: basicPink,
          //         prefixIcon: Icon(
          //           Icons.search,
          //           color: basicPink,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: Container(
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: llgrey,
                  width: 1.3.w,
                ),
                boxShadow: const [
                  BoxShadow(
                      color: gGrey,
                      spreadRadius: 0.2,
                      blurRadius: 4,
                      offset: Offset(0, 3)),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                ),
                child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount: answers.length,
                    itemBuilder: (context, index) {
                      if (editingController.text.isEmpty) {
                        return InkWell(
                          onTap: () async {
                            controller.changeIndex(index);

                            for (int i = 0; i < answers.length; i++) {
                              answers[i].isAnswer = 0;
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: 12.0.h,
                                top: 12.0.h,
                                right: 10.w,
                                left: 10.w),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check,
                                    size: 30,
                                    color: (controller.tapIndex == index &&
                                                controller.press == true) ||
                                            answers[index].isAnswer == 1
                                        ? basicPink
                                        : transparnt,
                                  ),
                                  const Spacer(),
                                  Text(
                                    answers[index].content,
                                    style: GoogleFonts.cairo(
                                        fontSize: 16.sp,
                                        color: (controller.tapIndex == index &&
                                                    controller.press == true) ||
                                                answers[index].isAnswer == 1
                                            ? basicPink
                                            : black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else if (answers[index]
                              .content
                              .contains(editingController.text) ||
                          answers[index]
                              .content
                              .contains(editingController.text)) {
                        return InkWell(
                          onTap: () async {
                            controller.changeIndex(index);
                            // setState(() {
                            for (int i = 0; i < answers.length; i++) {
                              print("single choices == ${answers[i]}");
                              answers[i].isAnswer = 0;
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: 12.0.h,
                                top: 12.0.h,
                                right: 10.w,
                                left: 10.w),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    size: 30,
                                    color: (controller.tapIndex == index &&
                                                controller.press == true) ||
                                            answers[index].isAnswer == 1
                                        ? basicPink
                                        : transparnt,
                                  ),
                                  const Spacer(),
                                  Text(
                                    answers[index].content,
                                    style: GoogleFonts.cairo(
                                        fontSize: 16.sp,
                                        color: (controller.tapIndex == index &&
                                                    controller.press == true) ||
                                                answers[index].isAnswer == 1
                                            ? basicPink
                                            : black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            ),
          ))
        ],
      );
    });
  }
}
