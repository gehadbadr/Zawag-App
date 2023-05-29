import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: use_key_in_widget_constructors


class Report extends StatelessWidget {

  List names = [
    {'name': "اسماء سعيد", 'img': "assets/image/report3.png"},
    {'name': "حسام وليد", 'img': "assets/image/report2.png"},
    {'name': "احمد معتز", 'img': "assets/image/report1.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "الابلاغ عن الحسابات",
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
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
          child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0.h),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0.h),
                      child: Row(
                        children: [
                          Expanded(
                              child:
                              CachedNetworkImage(
                                imageUrl:names[index]["img"],
                                height: 72.w ,
                                width: 72.w ,
                                placeholder: (context, url) =>Center(child: SizedBox(
                                    width: 72.w,
                                    height: 72.h,
                                    child: const CircularProgressIndicator())),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              )
                          ),
                          Expanded(
                              child: Text(
                                names[index]["name"],
                                style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              )),
                          const Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                barrierColor: llightGrey.withOpacity(0.8),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(28),
                                  ),
                                ),
                                builder: (context) {
                                  return SizedBox(
                                    height: 290.h,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 30.h,
                                          ),
                                          child: Text(
                                            "الابلاغ عن حساب",
                                            style: GoogleFonts.cairo(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20.h),
                                          child: Text(
                                            "${names[index]["name"]} هل تريد تأكيد الابلاغ عن ",
                                            style:
                                            GoogleFonts.cairo(fontSize: 16.sp),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 20.h,
                                              left: 22.w,
                                              right: 22.w),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                      decoration:
                                                      BoxDecoration(
                                                          color:
                                                          basicPink,
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              40),
                                                          border: Border
                                                              .all(
                                                            color:
                                                            transparnt,
                                                            width: 2.w,
                                                          )),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            vertical:
                                                            5.h),
                                                        child: TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              "نعم",
                                                              style: GoogleFonts.cairo(
                                                                  color:
                                                                  white,
                                                                  fontSize:
                                                                  16.sp),
                                                            )),
                                                      ))),
                                              SizedBox(
                                                width: 20.w,
                                              ),
                                              Expanded(
                                                child: Container(
                                                    decoration:
                                                    BoxDecoration(
                                                        color: midGrey,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            40),
                                                        border:
                                                        Border.all(
                                                          color:
                                                          transparnt,
                                                          width: 2.w,
                                                        )),
                                                    child: Padding(
                                                      padding: EdgeInsets
                                                          .symmetric(
                                                          vertical:
                                                          5.h),
                                                      child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "لا",
                                                            style: GoogleFonts.cairo(
                                                                color:
                                                                white,
                                                                fontSize:
                                                                16.sp),
                                                          )),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "ابلاغ",
                              style: GoogleFonts.cairo(
                                  fontSize: 18.sp,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ));
  }
}
