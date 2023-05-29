import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:effa/controllers/personal_images_controller.dart';
import 'package:effa/helper/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';



class UploadPicRigister extends StatelessWidget {
  UploadPicRigister({Key? key}) : super(key: key);
  PersonalImagesController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 200.0.h,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "اختر صورة",
                        style: TextStyle(
                          fontSize: 20.0.sp,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextButton.icon(
                                icon: const Icon(Icons.image),
                                onPressed: (){
                                  controller.pickImageGallery(context);
                                },
                                label: const Text("الهاتف"),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              TextButton.icon(
                                icon: const Icon(Icons.camera),
                                onPressed: () {
                                  controller.pickImageCamera(context);
                                },
                                label: const Text("الكاميرا"),
                              ),
                            ]),
                      )
                    ],
                  ),
                );
              });
        },
        child: uploadProfile());
  }

  Widget uploadProfile() => Stack(children: [
    GetBuilder<PersonalImagesController>(
      builder: (controller){
        return SizedBox(
          width: 160.w,
          height: 160.h,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: cgrey, width: 8.w),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child:
              controller.myFile.path.toString().isEmpty
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
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
                  imageUrl:"",
                  width: 96.0,
                  height: 96.0,
                  placeholder: (context, url) {
                    return SvgPicture.asset("assets/icon/img.svg");
                  },
                  errorWidget: (context, url, error) {
                    return SvgPicture.asset("assets/icon/img.svg");
                  },
                ),
              )
                  : (controller.myFile.path.isNotEmpty
                  ?
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.file(
                  controller.myFile,
                  fit: BoxFit.cover,
                  width: 150.h,
                  height: 150.h,
                ),
              )
                  : SvgPicture.asset(
                "assets/image/addpic.svg",
                fit: BoxFit.cover,
              )),
            ),
          ),
        );
      },
    ),
    Positioned(
      left: 12.w,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: basicPink,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: ImageIcon(
            AssetImage("assets/icon/edit.png"),
            size: 45,
            color: white,
          ),
        ),
      ),
    )
  ]);
}
