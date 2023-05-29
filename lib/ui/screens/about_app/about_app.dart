import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 7,
        shadowColor: lliGrey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: white,
        title: Center(
          child: Text(
            "عن التطبيق",
            style: GoogleFonts.cairo(
                color: black,
                fontSize: 18.sp),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const ImageIcon(
              AssetImage("./././assets/icon/arrow_back.png"),
              color: black,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
        ],
        leading: Container(),
      ),
      body: Padding(
        padding:
        EdgeInsets.only(top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 25.h, bottom: 3.h),
            child: Center(
              child: Image.asset(
                "assets/image/logo.png",
                width: 132.18.w,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Center(
              child: Container(
                height: 578.h,
                margin: EdgeInsets.all(5.0.h),
                padding: EdgeInsets.all(12.0.h),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: gGrey, width: 1.5.w, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
                child: SafeArea(
                  child: Scrollbar(
                    interactive: true,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          "  ببساطة نص شكلي (بمعنى أن الغاية هي الشكل "
                              "و ليس المحتوى) ويُستخدم في صناعات المطابع"
                              "ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص "
                              "الشكلي منذ القرن الخامس عشر عندما قامت مطبعة "
                              "مجهولة برص مجموعة من الأحرف بشكل عشوائي"
                              "أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع "
                              "شكلي لهذه الأحرف. خمسة قرون من الزمن لم "
                              "تقضي على هذا النص، بل انه حتى صار مستخدماً "
                              "وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. "
                              "انتشر بشكل كبير في ستينيّات هذا القرن  ببساطة نص "
                              "شكلي (بمعنى أن الغاية هي الشكل وليس "
                              "المحتوى) ويُستخدم في صناعات المطابع ودور "
                              "النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي "
                              "منذ القرن الخامس عشر عندما قامت مطبعة مجهولة "
                              "برص مجموعة من الأحرف بشكل عشوائي أخذتها من "
                              " نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه "
                              "الأحرف. خمسة قرون من الزمن لم تقضي على هذا "
                              "النص، بل انه حتى صار مستخدماً وبشكله الأصلي في "
                              "الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في "
                              "ستينيّات هذا القرن  ببساطة نص شكلي (بمعنى أن "
                              "الغاية هي الشكل وليس المحتوى) ويُستخدم في "
                              "صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال "
                              "المعيار للنص الشكلي منذ القرن الخامس عشر عندما"
                              "قامت مطبعة مجهولة برص مجموعة من الأحرف "
                              "بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة "
                              "دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من "
                              "الزمن لم تقضي على هذا النص، بل انه حتى صار "
                              "مستخدماً وبشكله الأصلي في الطباعة والتنضيد "
                              "الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن",
                          style: GoogleFonts.cairo(
                            color: lGrey,
                            fontSize: 14.sp,
                            letterSpacing: 1,
                            wordSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
