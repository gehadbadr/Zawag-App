import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:effa/controllers/id_images_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/button.dart';
import 'package:effa/ui/widgets/id_image.dart';
import 'package:effa/ui/widgets/info_bottom_sheet.dart';
import 'package:effa/ui/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ConfirmInfo extends StatelessWidget {
  ConfirmInfo({Key? key}): super(key: key);
  IdImagesController controller = Get.put(IdImagesController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GetBuilder<IdImagesController>(
            builder: (controller){
              return  SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 45.h,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(children: [
                          SvgPicture.asset("assets/icon/nextto.svg"),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'تأكيد بياناتي',
                            // textAlign: TextAlign.right,
                            style: GoogleFonts.cairo(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      controller.hide1?const SizedBox():Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(children: [
                            SvgPicture.asset("assets/icon/pic.svg"),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'صور الهوية الشخصية ',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.cairo(
                                fontSize: 16.sp,
                              ),
                            ),
                          ])),
                      controller.hide1?const SizedBox():SizedBox(
                        height: 15.h,
                      ),
                      controller.hide1?const SizedBox():
                      Row(children: [
                        Expanded(
                            child: UploadID(
                              context: context,
                              myFile: controller.image1,
                              press: controller.pressed1,
                              isImg1: true,
                              isImg2: false,
                              isImg3: false,
                              txt: 'الصورة الخلفية',
                              isFileChanged: (value) => (controller.updateImage1(value)),
                
                              myWidget: Padding(
                                padding: EdgeInsets.only(top: 20.h, bottom: 5.h),
                                child:
                                    controller.image1.uri
                                    .toString()
                                    .isEmpty?
                                CachedNetworkImage(
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      width: 96.0,
                                      height: 96.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                
                                      ),
                                      child: CircleAvatar(
                                        radius: 96.0,
                                        backgroundImage: imageProvider,
                                      ),
                                    );
                                  },
                                  imageUrl: "ApiConstants.imagebaseUrl+model.identity_back!",
                                  width: 96.0,
                                  height: 96.0,
                                  placeholder: (context, url) {
                                    return SvgPicture.asset("assets/icon/img.svg");
                                  },
                                  errorWidget: (context, url, error) {
                                    return SvgPicture.asset("assets/icon/img.svg");
                                  },
                                ) :
                                controller.image1.uri
                                    .toString()
                                    .isNotEmpty ? Image.file(
                                  controller.image1,
                                  fit: BoxFit.cover,
                                ) :SvgPicture.asset("assets/icon/img.svg"),
                              ),
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                            child: UploadID(
                              context: context,
                              myFile: controller.image2,
                              press: controller.pressed2,
                              isFileChanged: (value) => (controller.updateImage2(value)),
                              isImg1: false,
                              isImg2: true,
                              isImg3: false,
                              txt: 'الصورة الأمامية',
                              myWidget: Padding(
                                padding: EdgeInsets.only(top: 20.h, bottom: 5.h),
                                child:
                                // model.identity_face != null&&
                                    controller.image2.uri
                                    .toString()
                                    .isEmpty  ?
                                CachedNetworkImage(
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      width: 96.0,
                                      height: 96.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        //border: Border.all(color: Appc.colorPrimary,width: 1),
                
                                      ),
                                      child: CircleAvatar(
                                        radius: 96.0,
                                        backgroundImage: imageProvider,
                                      ),
                                    );
                                  },
                                  imageUrl: "ApiConstants.imagebaseUrl+model.identity_face!",
                                  width: 96.0,
                                  height: 96.0,
                                  placeholder: (context, url) {
                                    return SvgPicture.asset("assets/icon/img.svg");
                                  },
                                  errorWidget: (context, url, error) {
                                    return SvgPicture.asset("assets/icon/img.svg");
                                  },
                                ) : controller.image2.uri
                                    .toString()
                                    .isNotEmpty ? Image.file(
                                  controller.image2,
                                  fit: BoxFit.cover,
                                ) : SvgPicture.asset("assets/icon/img.svg"),
                              ),
                            )),
                      ]),
                      controller.hide1?const SizedBox():SizedBox(
                        height: 30.h,
                      ),
                      controller.hide1||controller.hide2?const SizedBox():Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 30.w, left: 10.w),
                              child: Divider(
                                thickness: 1.w,
                                color: black,
                              ),
                            ),
                          ),
                          Text(
                            "او",
                            style: GoogleFonts.cairo(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.w, left: 30.w),
                              child: Divider(
                                thickness: 1.w,
                                color: black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      controller.hide2?const SizedBox():const SizedBox(
                        height: 30,
                      ),
                      controller.hide2?const SizedBox(): Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(children: [
                            SvgPicture.asset("assets/icon/pic.svg"),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'صورة جواز السفر',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.cairo(
                                fontSize: 16.sp,
                              ),
                            ),
                          ])),
                      controller.hide2?const SizedBox():SizedBox(
                        height: 15.h,
                      ),
                      controller.hide2?const SizedBox(): Expanded(
                          child: UploadID(
                            context: context,
                            myFile: controller.image3,
                            press: controller.pressed3,
                            isImg1: false,
                            isImg2: false,
                            isImg3: true,
                            isFileChanged: (value) => (controller.updateImage3(value)),
                            txt: 'صورة جواز السفر',
                            myWidget: Padding(
                              padding: EdgeInsets.only(top: 20.h, bottom: 5.h),
                              child:
                              // model.passport_image != null &&
                                  controller.image3.uri
                                  .toString()
                                  .isEmpty?
                              CachedNetworkImage(
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    width: 96.0,
                                    height: 96.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CircleAvatar(
                                      radius: 96.0,
                                      backgroundImage: imageProvider,
                                    ),
                                  );
                                },
                                imageUrl:"ApiConstants.imagebaseUrl+ model.passport_image!",
                                width: 96.0,
                                height: 96.0,
                                placeholder: (context, url) {
                                  return SvgPicture.asset("assets/icon/img.svg");
                                },
                                errorWidget: (context, url, error) {
                                  return SvgPicture.asset("assets/icon/img.svg");
                                },
                              ) :
                              controller.image3.uri
                                  .toString()
                                  .isNotEmpty ? Image.file(
                                controller.image3,
                                fit: BoxFit.cover,
                              ) :
                              SvgPicture.asset("assets/icon/img.svg"),
                            ),
                          )),
                      RegisterButton(
                        title: Text('تـأكيد',
                            style: GoogleFonts.cairo(
                              color: white,
                              fontSize: 16.sp,
                            )),
                        function: (){
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: transparnt,
                              builder: (context) {
                                return  WaitBottomSheet(id: 3);
                              });
                        },
                        nav: (){
                          if((UploadID.isUploadedImg1 &&
                              UploadID.isUploadedImg2)  || UploadID.isUploadedImg3){
                            controller.confirmInfo();
                          }
                        },
                        color: ((UploadID.isUploadedImg1 &&
                                  UploadID.isUploadedImg2)  || UploadID.isUploadedImg3)
                              ?basicPink:gmGrey,
                      ),
                      // MainButton(
                      //   isEnd: true,
                      //   background: ((UploadID.isUploadedImg1 &&
                      //       UploadID.isUploadedImg2)  || UploadID.isUploadedImg3)
                      //   ?basicPink:gmGrey,
                      //   title: Text('تأكيد',
                      //       style: GoogleFonts.cairo(
                      //         color: white,
                      //         fontSize: 16.sp,
                      //       )),
                      //   function: () {},
                      // ),
                      // Row(children: [
                      //   Expanded(
                      //     child: TextButton(
                      //       child: Padding(
                      //         padding: EdgeInsets.symmetric(vertical: 8.h),
                      //         child: Text('تأكيد',
                      //             style: GoogleFonts.cairo(
                      //                 color: white,
                      //                 fontSize: 16.sp,
                      //                 fontWeight: FontWeight.w500)),
                      //       ),
                      //       style: TextButton.styleFrom(
                      //         backgroundColor: ((UploadID.isUploadedImg1 == false ||
                      //             UploadID.isUploadedImg2 == false) &&
                      //             UploadID.isUploadedImg3 == false) ?gmGrey:basicPink,
                      //         shape: const RoundedRectangleBorder(
                      //             borderRadius:
                      //             BorderRadius.all(Radius.circular(10))),
                      //       ),
                      //       onPressed: () {
                      //
                      //         print(UploadID.isUploadedImg1);
                      //
                      //         if ((UploadID.isUploadedImg1 == false ||
                      //             UploadID.isUploadedImg2 == false) &&
                      //             UploadID.isUploadedImg3 == false) {
                      //           ScaffoldMessenger.of(context)
                      //               .showSnackBar(const SnackBar(
                      //             backgroundColor: orginalRed,
                      //             content: Directionality(
                      //                 textDirection: TextDirection.rtl,
                      //                 child: Text(
                      //                     "تأكد من رفع الصورة الأمامية والخلفية أو صورة الجواز")),
                      //           ));
                      //         } else {
                      //           UserImages user = UserImages();
                      //           print("dddd${image1.uri.toString()}");
                      //           user.image1 = image1;
                      //           user.image2 = image2;
                      //           user.image3 = image3;
                      //           uploadimages(user, widget.id, context);
                      //         }
                      //         _updateProgress(context);
                      //         // Navigator.push(
                      //         //     context,
                      //         //     MaterialPageRoute(
                      //         //         builder: (context) =>
                      //         //             BirthDateInfo(progress: _progressValue)));
                      //       },
                      //     ),
                      //   ),
                      //   SizedBox(
                      //     width: 15.h,
                      //   ),
                      //   InkWell(
                      //     onTap: () {
                      //       showModalBottomSheet(
                      //           context: context,
                      //           //   barrierColor: liGrey.withOpacity(0.8),
                      //           backgroundColor: transparnt,
                      //           builder: (context) {
                      //             return WaitBottomSheet();
                      //           });
                      //     },
                      //     child: Container(
                      //       decoration: const BoxDecoration(
                      //           color: ggrey,
                      //           borderRadius: BorderRadius.all(Radius.circular(10))),
                      //       child: Padding(
                      //         padding: EdgeInsets.symmetric(
                      //             vertical: 15.h, horizontal: 12.w),
                      //         child: SvgPicture.asset(
                      //           // AssetImage(
                      //             "assets/icon/9.svg"),
                      //       ),
                      //       //   size: 50,
                      //       //   color: white,
                      //       // ),
                      //     ),
                      //   ),
                      // ]),
                      SizedBox(
                        height: 20.h,
                      )
                    ]),
              );
            },
          ),
        ),
      ),
    );
  }
}

