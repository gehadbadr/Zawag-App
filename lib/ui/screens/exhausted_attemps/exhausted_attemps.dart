import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/filter/filter.dart';
import 'package:effa/ui/screens/notification/notification.dart';
import 'package:effa/ui/widgets/filter_button.dart';
import 'package:effa/ui/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ExhaustedAttemps extends StatelessWidget {
  final VoidCallback? onPressed;
  String mainBalance;
  String showCost;
   ExhaustedAttemps({super.key, required this.onPressed,
    required this.mainBalance,
    required this.showCost,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          // elevation: 1,

          shadowColor: Color(0xff707070),
          // foregroundColor: black,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 14.w),
              child: SvgPicture.asset(
                "assets/image/logo.svg",
                width: 66.w,
              ),
            ),
          ],
          leading: Padding(
            padding: EdgeInsets.only(
              left: 8.w,
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icon/notif.svg",
              ),
              onPressed: () {
                Get.to(() => Notifications());
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Notifications()));
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 50.h,right: 20.w,bottom: 20.h,left:20.w ),
           // padding: EdgeInsets.all(10),
            decoration:BoxDecoration(
              color: Colors.white,
                borderRadius:BorderRadius.circular(12)
            ),
            child: Stack(
              children: [
                Padding(
                   padding: EdgeInsets.only(top: 10,right: 10,bottom: 20,left:10),

                child: Column(children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Image.asset(
                      "assets/image/empty_coin.png",
                      width: 300.w,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "نفذت المحاولات المجانية",
                              style: GoogleFonts.cairo(color: basicPink, fontSize: 18.sp,fontWeight:FontWeight.bold ),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text("نأسف لقد نفذت المحاولات المجانية . يمكنك الانتظار 24 ساعة حتي يتم التجديد او يمكنك شراء نقاط الآن",
                              style: GoogleFonts.cairo(color: darkblack, fontSize: 16.sp),
                            ),
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                        ],
                      ),
                    ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       InkWell(
                         onTap: () {
                         //  onPressed!();
                         },
                         child: Align(
                             alignment: Alignment.bottomRight,
                             child: Container(
                               padding: EdgeInsets.only(top:  10,right: 25,bottom: 10,left: 25),

                               // width: MediaQuery.of(context).size.height <= 500
                               //     ? 180.w
                               //     : 180.w,
                               // height: MediaQuery.of(context).size.height <= 500
                               //     ? 100.h
                               //     : 44.h,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(12),

                                   color: basicPink),
                               child: Center(
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [

                                     Text('شراء نقاط',style: GoogleFonts.cairo(color: Colors.white,
                                         fontSize:
                                         MediaQuery.of(context).size.height <= 500
                                             ? 10.sp
                                             : 15.sp,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             )),
                       ),
                       SizedBox(width: 10.w,),
                       // RoundedButton(mywidget: Text('شراء نقاط',style: GoogleFonts.cairo(color: Colors.white,fontSize : MediaQuery.of(context).size.height <= 500
                       //     ? 10.sp
                       //     : 15.sp, ),), raduis: 10, myfun: (){}, color: basicPink),
                       InkWell(
                         onTap: () {
                           onPressed!();
                         },
                         child: Align(
                             alignment: Alignment.bottomRight,
                             child: Container(
                               padding: EdgeInsets.all( 10),

                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(12),
                                   border: Border.all(
                                     color: basicPink,
                                   ),
                                   color: white),
                               child: Center(
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     const Image(
                                       image:
                                       AssetImage("././assets/icon/filter_icon.png"),
                                     ),
                                     SizedBox(
                                       width: 10.w,
                                     ),
                                     Text(
                                       "اظهر مقابل $showCost",
                                       style: GoogleFonts.cairo(
                                         color: black,
                                         fontSize:
                                         MediaQuery.of(context).size.height <= 500
                                             ? 10.sp
                                             : 15.sp,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             )),
                       ),

                     ],
                   )


                  ]),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.only(top: 10.0,right: 15,bottom: 10
                    ,left: 15.0),
                    // width: 100.w,
                    // height:
                    // MediaQuery.of(context).size.height <= 500 ? 100.h : 48.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: red,
                       boxShadow:  [
                    BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(8,8), // changes position of shadow
                  ),
                  ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage("././assets/icon/filter_icon.png"),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          mainBalance,
                          style: GoogleFonts.cairo(
                              color: white,
                              fontSize: MediaQuery.of(context).size.height <= 500
                                  ? 14.sp
                                  : 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}
