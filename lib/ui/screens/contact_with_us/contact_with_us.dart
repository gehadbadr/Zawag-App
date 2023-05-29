import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Contact extends StatelessWidget {
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController topic = TextEditingController();

  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGround,
      resizeToAvoidBottomInset: false,
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
            "تواصل معنا",
            style: GoogleFonts.cairo(color: black, fontSize: 18.sp),
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
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 25.h, bottom: 10.h),
            child: Center(
              child: Image.asset(
                "assets/image/logo.png",
                width: 132.18.w,
                // height: 80.h,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
            child: Card(
              elevation: 6,
              shadowColor: black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 35.h),
                child: Column(children: [
                  _txtField(
                      name, 'الاسم ', "./././assets/icon/name.png",1, context),
                  _txtField(email, 'البريد الالكتروني ',
                      "./././assets/icon/email.png",1, context),
                  _txtField(topic, 'الموضوع ', "./././assets/icon/topic.png",1,
                      context),
                  Container(
                    // height: 20,
                      child: _txtField(message, 'نص الرسالة ',
                          "./././assets/icon/topic.png",4, context)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                      child: SizedBox(
                        width: 100.w,
                       height: 44.h,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: basicPink,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(22))),
                            ),
                            onPressed: () {
                            },
                            child: Text('ارسال',
                                style: GoogleFonts.cairo(
                                  color: white,
                                  fontSize: 14.sp,
                                ))),
                      ))
                ]),
              ),
            ),
          ),

          // Expanded(child: SizedBox())
        ]),
      ),
    );
  }

  Widget _txtField(TextEditingController cont, String txt, String img,int line,
      BuildContext context) =>
      Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: TextFormField(
            controller: cont,
            keyboardType: TextInputType.name,
            textAlignVertical: TextAlignVertical.top,
            onFieldSubmitted: (String value) {},
            maxLines:line ,
            onChanged: (String value) {},
            decoration: InputDecoration(
              hintText:txt ,
              hintStyle:  GoogleFonts.cairo(fontSize: 14.sp),
              prefixIcon: ImageIcon(
                AssetImage(img),
                color: ddGrey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: basicPink, width: 1.5),
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      );
}
