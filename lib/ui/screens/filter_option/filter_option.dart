import 'package:effa/controllers/filter_option_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/dropdown_filter.dart';
import 'package:effa/ui/widgets/sliderTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../settings/settings.dart';

class FilterOptions extends StatefulWidget {
  FilterOptions({Key? key}) : super(key: key);

  @override
  State<FilterOptions> createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  FilterOptionsControllers controller =
  Get.put(FilterOptionsControllers(), permanent: true);
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 4,
      //   foregroundColor: black,
      //   backgroundColor: white,
      //   actions: [
      //     Image.asset(
      //       "assets/image/logo.png",
      //       width: 66.09.w,
      //     ),
      //   ],
      //   leading: IconButton(
      //     icon: const ImageIcon(
      //       AssetImage("assets/icon/notif.png"),
      //     ),
      //     iconSize: 40,
      //     onPressed: () {
      //       // Navigator.push(context,
      //       //     MaterialPageRoute(builder: (context) => Notifications()));
      //     },
      //   ),
      // ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: PhysicalModel(
          color: grey,
          elevation: 30,
          shadowColor: white,
          child: Container(
            color: light,
            child: Padding(
              padding: EdgeInsets.all(20.0.h),
              child: Row(
                children: [
                  Expanded(
                    flex: MediaQuery.of(context).size.height <= 500
                                          ? 2
                                          :1,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height <= 500
                                          ? 140.h
                                          :44.h,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: basicPink,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                          ),
                          onPressed: () {
                            //model.completAccount();
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context) => BasicInfo()));
                          },
                          child: Text('تأكيد',
                              style: GoogleFonts.cairo(
                                color: white,
                                fontSize: 16.sp,
                              ))),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height <= 500
                                          ? 140.h
                                          :44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: mlliGrey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8),
                      child: Center(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(children: [
                              Text(
                                " عدد النتائج اكثر من ",
                                style: GoogleFonts.cairo(
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "100 ",
                                style: GoogleFonts.cairo(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: basicPink),
                              ),
                              Text(
                                "مماثلة",
                                style: GoogleFonts.cairo(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ]),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 25.h, left: 10.w, right: 10.w),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(children: [
                  Container(
                    color: white,
                    child: Column(children: [
                      DropDownFilter(
                        icon: "assets/icon/nation.png",
                        txt: "الجنسية", onSelect: (value) {  },
                      ),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      DropDownFilter(
                        icon: "assets/icon/status.png",
                        txt: "الحالة الاجتماعية", onSelect: (value) {  },
                      ),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      DropDownFilter(
                        icon: "assets/icon/gps.png",
                        txt:  "بلد الاقامة", onSelect: (value) {  },
                      ),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      DropDownFilter(
                        icon: "assets/icon/gover.png",
                        txt:  "المحافظة", onSelect: (value) {  },
                      ),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      DropDownFilter(
                        icon:  "assets/icon/study.png",
                        txt:   "التعليم", onSelect: (value) {  },
                      ),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      DropDownFilter(
                        icon: "assets/icon/faculty.png",
                        txt:   "الكلية", onSelect: (value) {  },
                      ),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      DropDownFilter(
                        icon:  "assets/icon/faculty.png",
                        txt:  "الجامعة", onSelect: (value) {  },
                      ),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      DropDownFilter(
                        icon:  "assets/icon/bag.png",
                        txt:  "هل تعمل", onSelect: (value) {  },
                      ),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      DropDownFilter(
                        icon:  "assets/icon/bag.png",
                        txt:  "مجال عملها", onSelect: (value) {  },
                      ),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      SliderWidget(
                          icon: "assets/icon/tall.png",
                          txt1: "الطول",
                         onSelect: (value){},
                         txt2: "${controller.currentRangeValuesTall.start.round()} : ${controller.currentRangeValuesTall.end.round()}سم"),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      DropDownFilter(
                        icon: "assets/icon/hijab.png",
                        txt: "الحجاب", onSelect: (value) {  },

                      ),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      DropDownFilter(
                        icon: "assets/icon/skin.png",
                        txt: "لون البشرة", onSelect: (value) {  },
                        menuItems: ["dfdsfdafhgthr","dsfsdfsdfs","dsfsdfsdfkkv"],
                      ),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      GetBuilder<FilterOptionsControllers>(
                        builder: (controller){
                          return SliderWidget(
                              icon: "assets/icon/age.png",
                              txt1: "العمر",
                              onSelect: (value){
                                controller.currentRangeValuesTall = value;
                                controller.update();
                              },
                              txt2:"${controller.currentRangeValuesTall.start.round()} : ${controller.currentRangeValuesTall.end.round()}سنة");
                        },
                      ),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      DropDownFilter(
                        icon:"assets/icon/newhome.png",
                        txt: "محافظة شقة الزوجية", onSelect: (value) {  },
                      ),
                      Divider(
                        color: lbg,
                        thickness: 1.w,
                      ),
                      DropDownFilter(
                        icon:  "assets/icon/l.png",
                        txt:  "اللحية",
                        onSelect: (value) {  },
                      ),
                    ]),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
