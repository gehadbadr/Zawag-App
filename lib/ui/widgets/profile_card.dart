import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:effa/controllers/my_profile_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/models/user/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({Key? key}) : super(key: key);
  MyProfileController controller = Get.find();
  final CarouselController controllerImages = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: white,
        child: Column(children: [
          GetBuilder<MyProfileController>(
            builder: (controller) {
              return Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CarouselSlider(
                      items: generateImageTiles(controller.userImages),
                      options: CarouselOptions(
                          padEnds: false,
                          aspectRatio: 1,
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          scrollDirection: Axis.vertical,
                          onPageChanged: (index, reason) {
                            controller.updateIndex(index.toDouble());
                          }),
                      carouselController:controllerImages,
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Positioned(
                      bottom: 18.h,
                      right: 30.w,
                      child: Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Spacer(),
                            Row(children: [
                              Text(
                                "احمد احمد",
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.sp,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ",",
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "22",
                                style: GoogleFonts.cairo(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(children: [
                              SvgPicture.asset("assets/icon/stat.svg"),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'اعزب',
                                style: GoogleFonts.cairo(
                                    fontSize: 14.sp, color: white),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              SvgPicture.asset("assets/icon/al.svg"),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'مصري',
                                style: GoogleFonts.cairo(
                                    fontSize: 14.sp, color: white),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              SvgPicture.asset("assets/icon/ba.svg"),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'مهندس',
                                style: GoogleFonts.cairo(
                                    fontSize: 14.sp, color: white),
                              ),
                            ]),
                          ]),
                    ),
                  ),
                  Positioned(
                    left: 10.w,
                    top: 10.h,
                    child: Transform.rotate(
                      angle: -math.pi / -1,
                      child: DotsIndicator(
                        dotsCount: controller.totalDots!,
                        position: controller.currentIndex,
                        axis: Axis.vertical,
                        reversed: true,
                        decorator: DotsDecorator(
                          size: const Size.square(8.0),
                          activeColor: red,
                          color: white,
                          activeSize: Size(8.0.w, 25.0.h),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Row(children: [
                SvgPicture.asset("assets/icon/stu.svg"),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  'تعليم عالي',
                  style: GoogleFonts.cairo(fontSize: 12.sp, color: black),
                ),
                SizedBox(
                  width: 16.h,
                ),
                const SizedBox(height: 25, child: VerticalDivider(color: grey)),
                SvgPicture.asset("assets/icon/loc.svg"),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  'القاهره',
                  style: GoogleFonts.cairo(fontSize: 12.sp, color: black),
                ),
              ]),
            ),
          )
        ]),
      ),
    );
  }

  List<Widget> generateImageTiles(List<ImagesUser> images) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: CachedNetworkImage(
              imageUrl: element.image!,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const Center(
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator())),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        )
        .toList();
  }
}
