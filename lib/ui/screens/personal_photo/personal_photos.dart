import 'dart:io';
import 'package:effa/controllers/personal_images_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/button.dart';
import 'package:effa/ui/widgets/image_picker.dart';
import 'package:effa/ui/widgets/info_bottom_sheet.dart';
import 'package:effa/ui/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalPic extends StatelessWidget {
  PersonalPic({Key? key}) : super(key: key);
  PersonalImagesController controller =
      Get.put(PersonalImagesController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: GetBuilder<PersonalImagesController>(
              builder: (controller) {
                return SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 35.h,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(children: [
                        SvgPicture.asset("assets/icon/nextto.svg"),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'الصور الشخصية',
                          // textAlign: TextAlign.right,
                          style: GoogleFonts.cairo(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    UploadPicRigister(),
                    SizedBox(
                      height: 35.h,
                    ),
                    Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(children: [
                          SvgPicture.asset("assets/icon/pic.svg"),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'المزيد من الصور الشخصية',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.cairo(
                              fontSize: 16.sp,
                            ),
                          ),
                        ])),
                    SizedBox(
                      height: 20.h,
                    ),
                    controller.imageFileList!.isNotEmpty
                        ? SingleChildScrollView(
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.445,
                                child: controller.imageFileList!.isNotEmpty
                                    ? Wrap(
                                        children: List.generate(
                                        controller.imageFileList!.length + 1,
                                        (index) {return index == 0
                                              ? InkWell(
                                                  onTap: () {
                                                    controller.selectImages();
                                                  },
                                                  child: Container(
                                                      margin: EdgeInsets.symmetric(
                                                          horizontal: MediaQuery.of(context).size.width*0.02, vertical: 10),
                                                      height: 100,
                                                      width: MediaQuery.of(context).size.width/3-0.12-30.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.grey[300],
                                                      ),
                                                      child: const Icon(Icons.add, size: 40)),
                                                )
                                              : Stack(children: [
                                                  Container(margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02,vertical: 10),
                                                      height: 100,
                                                      width: MediaQuery.of(context).size.width / 3 -
                                                              0.12 -
                                                              30.w,
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child: Image.file(
                                                            File(controller
                                                                .imageFileList![
                                                                    index - 1]
                                                                .path),
                                                            fit: BoxFit.fill,
                                                          ))),
                                                  IconButton(
                                                    onPressed: () {
                                                      controller.removeItemList(
                                                          index);
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ),
                                                  )
                                                ]);
                                        },
                                      ))
                                    : const SizedBox(),
                              ),
                            ),
                          )
                        : Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.selectImages();
                                  },
                                  child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.grey[300],
                                      ),
                                      child: const Icon(Icons.add, size: 40)),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 20.h,
                    ),
                    controller.imageFileList!.isNotEmpty
                        ? RegisterButton(
                      title: controller.loader?const CircularProgressIndicator(color: Colors.black,):Text('تـأكيد',
                          style: GoogleFonts.cairo(
                            color: white,
                            fontSize: 16.sp,
                          )),
                      function: (){
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: transparnt,
                            builder: (context) {
                              return const WaitBottomSheet();
                            });
                      },
                      nav: (){
                        controller.updateImgs();
                      },
                      color: basicPink
                    )
                        : const SizedBox(),
                    SizedBox(
                      height: 20.h,
                    )
                  ]),
                );
              },
            )),
      ),
    );
  }
}
