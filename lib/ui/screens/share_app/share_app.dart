import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Share extends StatelessWidget {
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
            "مشاركة التطبيق",
            style: GoogleFonts.cairo(
                color: black,
                fontSize: 20),
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
          const SizedBox(
            width: 15,
          ),
        ],
        leading: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
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
                              child: QrImage(
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
                            color: Color(0xffF0F0F0),
                            shape: BoxShape.circle,
                          ),
                        )

                      ),
                    ]),
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 25, left: 10),
                          child: Divider(
                            thickness: 1.5,
                            color: Color.fromARGB(255, 45, 45, 45),
                          ),
                        ),
                      ),
                      Text(
                        "أو",
                        style: GoogleFonts.cairo(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 10, left: 25),
                          child: Divider(
                            thickness: 1.5,
                            color: Color.fromARGB(255, 45, 45, 45),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      width: 208.h,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          border: Border.all(
                            color: basicPink,
                            width: 2,
                          )),
                      child: TextButton(
                          onPressed: () {
                           
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text(
                                "اضغط للمشاركة  ",
                                style: GoogleFonts.cairo(
                                    color: basicPink,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Image(
                                image: AssetImage(
                                    "././assets/icon/Mask Group 297.png"),
                                color: basicPink,
                              ),
                            ],
                          )),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}


