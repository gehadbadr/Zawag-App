import 'package:effa/controllers/quistions_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/answers/multiple_choices.dart';
import 'package:effa/ui/widgets/answers/single_choices.dart';
import 'package:effa/ui/widgets/answers/text_answer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class EduAndWork extends StatefulWidget {
  EduAndWork({Key? key}) : super(key: key);

  @override
  State<EduAndWork> createState() => _EduAndWorkState();
}

class _EduAndWorkState extends State<EduAndWork> {
  final QuestionsController controller =
  Get.put(QuestionsController(), permanent: false);

  @override
  void initState() {
    controller.categoryId = 3;
    controller.getQuestions();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<QuestionsController>(
        builder: (controller){
          return Scaffold(
            body: SizedBox(
              child: Column(
                  children: [
                    SizedBox(
                      height: 65.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icon/nextto.svg"),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "التعليم & العمل",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.cairo(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, bottom: 45.h, top: 20.h),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40.0))),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: LinearProgressIndicator(
                                  minHeight: 9.h,
                                  backgroundColor: bgrey,
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                      basicPink),
                                  value: controller.position
                              )),
                        ),
                      ),
                    ),
                    controller.loader?const Center(child: CircularProgressIndicator(),):Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.5,
                          child: PageView.builder(
                            controller: controller.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            onPageChanged: (value){
                              controller.onPageChange(value);
                            },
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int x) {
                              if (controller.questions?.questions[x].type == 1) {
                                return Center(
                                  child: TextQuestion(
                                    question: controller.questions!.questions[x].content,
                                  ),
                                );
                              } else if (controller.questions?.questions[x].type == 2 || controller.questions?.questions[x].type == 4) {
                                return
                                  Center(
                                    child: SingleChoice(
                                      editingController: controller.txtController,
                                      idQuestion: controller.questions!.questions[x].id,
                                      answers: controller.questions!.questions[x].answers,
                                      question: controller.questions!.questions[x].content,),
                                  );
                              } else {
                                return Center(
                                  child: MultipleChoices(
                                    Q_id: controller.questions?.questions[x].id,
                                    question:controller.questions!.questions[x].content,
                                    answers:controller.questions?.questions[x].answers,
                                  ),
                                );
                              }
                            },
                            itemCount: controller.len,
                          ),
                        ),
                        controller.loaderAnswer?const Center(child: CircularProgressIndicator(color: basicPink,),):
                        controller.pageIndex == 0?
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.5.w,
                                    // assign the color to the border color
                                    color: transparnt,
                                  ),
                                  color: basicPink,
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                  ),
                                  onPressed: () {
                                    if(controller.questions?.questions[controller.pageIndex].isSkipable == 1&& controller.selectedChoice==null){
                                      if (kDebugMode) {
                                        print("error11111");
                                      }
                                      controller. changeIndexnN();
                                      controller.onTapP();
                                    }else if(controller.selectedChoice!=null){
                                      if (controller.questions?.questions[controller.pageIndex].type == 1) {
                                        controller.textAnswer(controller.questions!.questions[controller.pageIndex].id);
                                      } else if (controller.questions?.questions[controller.pageIndex].type == 2 || controller.questions?.questions[controller.pageIndex].type == 4) {
                                        controller.singleAnswer(controller.questions!.questions[controller.pageIndex].id,
                                            controller.questions!.questions[controller.pageIndex].answers[controller.selectedChoice!].id);
                                      } else {
                                        controller.multipleAnswer(controller.questions!.questions[controller.pageIndex].id);
                                      }
                                    }else{
                                      if (kDebugMode) {
                                        print("error33333");
                                      }
                                      Get.snackbar("","برجاء اختيار اجراء",
                                          showProgressIndicator: false, duration: const Duration(seconds: 2));
                                    }
                                  },
                                  child: Text(
                                      controller.selectedChoice==null?'تخطي':"التالي",
                                      style:  GoogleFonts.cairo(
                                        color: white,
                                        fontSize: 16.sp,

                                      )),
                                ),
                              ),
                            )):
                        controller.pageIndex+1==controller.len?
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.5.w,
                                    color: transparnt,
                                  ),
                                  color: basicPink,
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                  ),
                                  onPressed: () async{
                                    if(controller.questions?.questions[controller.pageIndex].isSkipable == 1&&controller.selectedChoice==null){
                                      print(11);
                                      controller. changeIndexnN();
                                      controller.onTapP();
                                      controller.level ++;
                                      controller.lastId = controller.questions!.questions[controller.pageIndex].id;
                                      controller.getQuestions();
                                    }else if(controller.selectedChoice!=null){
                                      if (controller.questions?.questions[controller.pageIndex].type == 1) {
                                        controller.textAnswer(controller.questions!.questions[controller.pageIndex].id);
                                      } else if (controller.questions?.questions[controller.pageIndex].type == 2 || controller.questions?.questions[controller.pageIndex].type == 4) {
                                        controller.singleAnswer(controller.questions!.questions[controller.pageIndex].id,
                                            controller.questions!.questions[controller.pageIndex].answers[controller.selectedChoice!].id);
                                      } else {
                                        controller.multipleAnswer(controller.questions!.questions[controller.pageIndex].id);
                                      }
                                    }else{
                                      Get.snackbar(
                                        "خطأ",
                                        "برجاء اختيار اجراء",
                                        colorText: Colors.white,
                                        backgroundColor: orginalRed,
                                        icon: const Icon(Icons.error),
                                      );
                                    }
                                  },
                                  child: Text(
                                      "تأكيد",
                                      style:  GoogleFonts.cairo(
                                        color: white,
                                        fontSize: 16.sp,

                                      )),
                                ),
                              ),
                            )):
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.5.w,
                                    // assign the color to the border color
                                    color: transparnt,
                                  ),
                                  color: basicPink,
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                  ),
                                  onPressed: () {
                                    if(controller.questions?.questions[controller.pageIndex].isSkipable == 1&&controller.selectedChoice==null){
                                      controller. changeIndexnN();
                                      controller.onTapP();
                                    }else if(controller.selectedChoice!=null){
                                      if (controller.questions?.questions[controller.pageIndex].type == 1) {
                                        controller.textAnswer(controller.questions!.questions[controller.pageIndex].id);
                                      } else if (controller.questions?.questions[controller.pageIndex].type == 2 || controller.questions?.questions[controller.pageIndex].type == 4) {
                                        controller.singleAnswer(controller.questions!.questions[controller.pageIndex].id,
                                            controller.questions!.questions[controller.pageIndex].answers[controller.selectedChoice!].id);
                                      } else {
                                        controller.multipleAnswer(controller.questions!.questions[controller.pageIndex].id);
                                      }
                                    }else{
                                      Get.snackbar(
                                        "خطأ",
                                        "برجاء اختيار اجراء",
                                        colorText: Colors.white,
                                        backgroundColor: orginalRed,
                                        icon: const Icon(Icons.error),
                                      );
                                    }
                                  },
                                  child: Text(
                                      controller.selectedChoice==null?'تخطي':"التالي",
                                      style:  GoogleFonts.cairo(
                                        color: white,
                                        fontSize: 16.sp,
                                      )),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: true,
                              child: SizedBox(
                                width: 25.w,
                              ),
                            ),
                            Visibility(
                              visible: true,
                              child: Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: transparnt,
                                    border: Border.all(
                                      width: 1.5.w,
                                      // assign the color to the border color
                                      color: black,
                                    ),
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                    ),
                                    onPressed: () {
                                      controller.back();
                                    },
                                    child: Text('السابق',
                                        style:  GoogleFonts.cairo(
                                          color: black,
                                          fontSize: 16.sp,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    GestureDetector(
                      onTap: (() {
                        Get.back();
                      }),
                      child: Text(
                        "الانهاء في وقت اخر",
                        style:  GoogleFonts.cairo(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ]),
            ),
          );});
  }
}
