import 'package:effa/controllers/quistions_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/models/questions/questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';



class MultipleChoices extends StatelessWidget {
  MultipleChoices({
    Key? key,
    this.answers,
    this.Q_id,
    required this.question,

  }) : super(key: key);
  String question;
  int? Q_id;
  List<Answer>? answers;

  final QuestionsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.fillList(answers);
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            question,
            style: GoogleFonts.cairo(fontSize: 20.sp),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      // Padding(
      //   padding:
      //       EdgeInsets.only(right: 30.w, left: 30.w, bottom: 8.h, top: 8.h),
      //   child: Directionality(
      //     textDirection: TextDirection.rtl,
      //     child: TextField(
      //       cursorColor: basicPink,
      //       onChanged: (value) {
      //         Provider.of<InfoProvider>(context, listen: false).rebuild();
      //       },
      //       controller: editingController,
      //       decoration: const InputDecoration(
      //         hintText: " بحث ... ",
      //         focusedBorder: UnderlineInputBorder(
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
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color:  llgrey,
                      width: 1.3.w,),
                    boxShadow: const[
                       BoxShadow(
                          color: gGrey,
                          spreadRadius: 0.2,
                          blurRadius: 4,
                          offset: Offset(0, 3)),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: answers!.length,
                        itemBuilder: (context, index) {

                            return InkWell(
                              onTap: () {
                                if(answers![index].isAnswer == 1){
                                  answers![index].isAnswer = 0;
                                  controller.updateList(index, false);
                                  controller.removeId(answers![index].id);
                                }else{

                                  controller.addId(answers![index].id);
                                  answers![index].isAnswer = 1;
                                  controller.updateList(index, !controller.checklist[index]);
                                  controller.changeIndex(index);
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: 20.0.h, right: 10.w, left: 10.w,top: 10.h),
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color:  controller.checklist[index] ||
                                                answers![index]
                                                    .isAnswer ==
                                                    1
                                                ? basicPink
                                                : black,
                                            width: 1.8,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: 28.h,
                                            height:28.h,
                                            child: controller.checklist[index] ||
                                                answers![index]
                                                    .isAnswer ==
                                                    1?const Icon(Icons.done,color:basicPink ,):const SizedBox()
                                        )// Your child widget here
                                    ),
                                    const Spacer(),
                                    Text(
                                      answers![index].content,
                                      style: GoogleFonts.cairo(
                                          fontSize: 16.sp,
                                          color:
                                              controller.checklist[index] ||
                                              answers![index]
                                                  .isAnswer ==
                                                  1
                                              ? basicPink
                                              : black),
                                    ),
                                  ],
                                ),
                              ),
                            );

                        }),
                  ))))
    ]);
  }
}
