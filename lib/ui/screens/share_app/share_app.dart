import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart' as ShareApp;
import 'package:share_plus/share_plus.dart';

class Share extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bGround,
      resizeToAvoidBottomInset: false,
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: lliGrey,
              offset: Offset(0, 4.0),
              blurRadius: 5.0,
            )
          ]),
          child: AppBar(
            scrolledUnderElevation: 0,
            elevation: 0.0,
            // foregroundColor: Colors.white,
            // shadowColor: lliGrey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            backgroundColor: white,
            title: Center(
              child: Text(
                "مشاركة التطبيق",
                style: GoogleFonts.cairo(color: black, fontSize: 18.sp),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("./././assets/icon/arrow_back.png"),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
            ],
            leading: Container(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "شارك التطبيق للحصول علي نقاط يمكنك استخدامها داخل التطبيق",
                      style: GoogleFonts.cairo(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Container(
                    // height: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Stack(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 25, right: 40, bottom: 30),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/image/shar.png",
                                    fit: BoxFit.fill,
                                    width: 75,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text("حسام وليد",
                                        style: GoogleFonts.cairo(
                                          color: black,
                                        ),),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "948494#",
                                        style: GoogleFonts.cairo(
                                          color: const Color(0xffFF8297),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                final boxWidth = constraints.constrainWidth();
                                const dashWidth = 4.0;
                                const dashHeight =4.0;
                                final dashCount =
                                    (boxWidth / (2* dashWidth)).floor();
                                return Flex(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  direction: Axis.horizontal,
                                  children: List.generate(dashCount, (_) {
                                    return const SizedBox(
                                      width: dashWidth,
                                      height: dashHeight,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 190, 188, 188),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                           Center(
                              child: Text(
                            "امسح الكود",
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          )),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: QrImageView(
                                data: "https://github.com/AhmedElmagdob",
                                version: QrVersions.auto,
                                size: 200.0,
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        // left: -30,
                        right: -10,
                        top: -180.h,
                        bottom: 0,
                        child:  Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            color: Color(0xffF0F0F0),
                            shape: BoxShape.circle,
                          ),
                        )
                      ),
                      Positioned(
                        left: -10,
                        // right: -50,
                        top: -180.h,
                        bottom: 0,
                        child:
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            color: bGround,
                            shape: BoxShape.circle,
                          ),
                        )

                      ),
                    ]),
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 20, left: 10),
                          child: Divider(
                            thickness: 2,
                            color: lliGrey ,

                          ),
                        ),
                      ),
                      Text(
                        "أو",
                        style: GoogleFonts.cairo(
                            fontSize: 20,),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 10, left: 20),
                          child: Divider(
                            thickness: 2,
                            color:lliGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left:60.w,right: 60.w,top: 5,bottom: 5),
                      child: Container(
                        // width: 208.h,
//height: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                              color: basicPink,
                              width: 2,
                            )),
                        child: TextButton(
                            onPressed: () async{
                              ShareResult shareResult;
                               shareResult =
                               await  ShareApp.Share.shareWithResult('check out my website https://github.com/AhmedElmagdob', subject: 'Look what I made!');
                              if(shareResult.status == ShareResultStatus.success){
                                Get.snackbar(
                                  "تمت المشاركه",
                                  "Thank You!",backgroundColor: const Color(
                                    0xffffd5e0),
                                  borderRadius: 10,

                                );
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                Text(
                                  "اضغط للمشاركة  ",
                                  style: GoogleFonts.cairo(
                                      color: basicPink,
                                      fontSize: 18),
                                ),
                              Image(
                                  height: 20.h,
                                  image: const AssetImage(
                                      "././assets/icon/Mask Group 297.png",),
                                  color: basicPink,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}


