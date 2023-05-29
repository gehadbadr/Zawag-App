import 'dart:async';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:effa/controllers/my_profile_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/custom_steps.dart';
import 'package:effa/ui/widgets/custom_user_images.dart';
import 'package:effa/ui/widgets/custom_user_info.dart';
import 'package:effa/ui/widgets/girl_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


bool show = false;

class Home extends StatefulWidget {Home({Key? key,}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final controller = Get.lazyPut(() => MyProfileController());
  late TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bGround,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 8.w,
            left: 8.w,
            top: 15.h,
          ),
          child: GetBuilder<MyProfileController>(
            builder: (controller){
              return SingleChildScrollView(
                child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                  controller.gender?ImageUserCard(
                    name: "احمد",
                    age: "22",
                    socialStatus: "اعزب",
                    nationality: "مصري",
                    job: "مهندي",
                    dotsCount: controller.totalDots!,
                    position: controller.currentIndex,
                    study: "جامعي",
                    city: "الغربيه",
                    images: controller.userImages,
                    onPageChanged: (index,reason){
                      controller.updateIndex(index.toDouble());
                    },
                  ):GirlWidget(name: "نورهان", age: "22", job: "لاتوجد وظيفه", education: "عالي", socialSituation: "عزباء", nationality: "مصريه", address: "القاهره"),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: whiteRaduis),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child:TabBar(
                        labelColor: red,
                        unselectedLabelColor: black,
                        indicatorColor: red,
                        indicatorWeight: 5.3.w,
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 8.w),
                        labelStyle: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _tabcontroller,
                        tabs: const [
                          Tab(
                            text: 'المراحل',
                          ),
                          Tab(
                            text: 'المواصفات',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: double.maxFinite,
                    child: TabBarView(
                      controller: _tabcontroller,
                      children: <Widget>[
                        SingleChildScrollView(
                          child: CustomSteps(
                            showParentData: controller.parentDataShow,
                            onPressed:
                              controller.showParent,
                            guardianName: "احمد احمد",
                            guardianRelate: "الاب",
                            phone: "0151581424",
                            mainBalance: "250",
                            showCost: "150",
                            isGirl: false,
                          ),
                        ),
                        SingleChildScrollView(
                          child: CustomUserInfoCard(
                            personalData: controller.personal,
                            relegion: controller.relegion,
                            study: controller.study,
                            family: controller.family,
                            interests: controller.interests,
                            userImages: controller.userImages,
                            aboutMe: "مطور تطبيقات هاتف",
                            aboutPartner: "محترمه ومؤدبه وبنت ناس",
                            cost: "150",
                            isRequest: controller.isRequest,
                            onSendRequest: (){
                              controller.requestFatherData();
                              Get.back();
                            },
                            isGirl: false,
                            cancelFather:(){ controller.cancelFather();},
                            onCancel: (){},
                            onSubmitRep: (){
                              Get.back();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }

  // Widget _manWidget(var imageSliders, var screenSize) => SizedBox(
  //   width: double.infinity,
  //   child: Card(
  //     // margin: EdgeInsets.only(
  //     //   // top: 20.0,
  //     //   //bottom: 20.0,
  //     // ),
  //     elevation: 6.0,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(15.0),
  //     ),
  //     color: white,
  //     child: Padding(
  //       padding: const EdgeInsets.only(bottom: 20.0),
  //       child: Column(children: [
  //         Stack(
  //           children: [
  //             SizedBox(
  //               width: double.infinity,
  //               // height: 200,
  //               child: CarouselSlider(
  //                 items: imageSliders,
  //                 options: CarouselOptions(
  //                   // height: double.infinity,
  //                   //autoPlay: true,
  //                     enlargeCenterPage: true,
  //                     // scrollDirection: Axis.vertical,
  //                     //  enlargeCenterPage: true,
  //                     //aspectRatio: 18 / 8,
  //                     onPageChanged: (index, reason) {
  //                       setState(() {
  //                         _current = index;
  //                       });
  //                     }),
  //                 carouselController: _controller,
  //               ),
  //             ),
  //             AspectRatio(
  //               aspectRatio: 18 / 8,
  //               child: Directionality(
  //                 textDirection: TextDirection.rtl,
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(right: 20),
  //                   child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: [
  //                         Row(children: [
  //                           Text(
  //                             // places[_current],
  //                             "حسام وليد",
  //                             style: GoogleFonts.cairo(
  //                               letterSpacing: 8,
  //                               decoration: TextDecoration.none,
  //                               fontWeight: FontWeight.bold,
  //                               fontFamily: 'Electrolize',
  //                               fontSize: screenSize.width / 25,
  //                               color: white,
  //                             ),
  //                           ),
  //                           Text(
  //                             ",",
  //                             style: GoogleFonts.cairo(
  //                               letterSpacing: 8,
  //                               fontWeight: FontWeight.bold,
  //                               decoration: TextDecoration.none,
  //                               fontFamily: 'Electrolize',
  //                               fontSize: screenSize.width / 25,
  //                               color: white,
  //                             ),
  //                           ),
  //                           Text(
  //                             "24",
  //                             style: GoogleFonts.cairo(
  //                               letterSpacing: 8,
  //                               decoration: TextDecoration.none,
  //                               fontFamily: 'Electrolize',
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: screenSize.width / 25,
  //                               color: white,
  //                             ),
  //                           ),
  //                         ]),
  //                         Row(children: [
  //                           const ImageIcon(
  //                             AssetImage("assets/icon/stat.png"),
  //                             size: 40,
  //                             color: red,
  //                           ),
  //                           const Text(
  //                             'أعزب',
  //                             style: GoogleFonts.cairo(fontSize: 20, color: white),
  //                           ),
  //
  //                           const SizedBox(
  //                             width: 20,
  //                           ),
  //
  //                           const ImageIcon(
  //                             AssetImage("assets/icon/al.png"),
  //                             size: 40,
  //                             color: red,
  //                           ),
  //                           const Text(
  //                             'مصري',
  //                             style: GoogleFonts.cairo(fontSize: 20, color: white),
  //                           ),
  //
  //                           const SizedBox(
  //                             width: 20,
  //                           ),
  //
  //                           const ImageIcon(
  //                             AssetImage("assets/icon/ba.png"),
  //                             size: 40,
  //                             color: red,
  //                           ),
  //                           const Text(
  //                             'مدرس',
  //                             style: GoogleFonts.cairo(fontSize: 20, color: white),
  //                           ),
  //
  //                           const SizedBox(
  //                             width: 20,
  //                           ),
  //                           //  Text(
  //                           //   // places[_current],
  //                           //   "nnnnnn",
  //                           //   style: GoogleFonts.cairo(
  //                           //     letterSpacing: 8,
  //                           //     decoration: TextDecoration.none,
  //                           //     fontFamily: 'Electrolize',
  //                           //     fontSize: screenSize.width / 25,
  //                           //     color: Colors.white,
  //                           //   ),
  //                           // ),
  //                         ]),
  //                       ]),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         Directionality(
  //           textDirection: TextDirection.rtl,
  //           child: Row(children: [
  //             const ImageIcon(
  //               AssetImage("assets/icon/stu.png"),
  //               size: 40,
  //               color: red,
  //             ),
  //             const Text(
  //               'مؤهل جامعي',
  //               style: GoogleFonts.cairo(fontSize: 20, color: black),
  //             ),
  //             const SizedBox(
  //               width: 20,
  //             ),
  //             const Padding(
  //               padding: EdgeInsets.symmetric(vertical: 8.0),
  //               child: Text(
  //                 '|',
  //                 style: GoogleFonts.cairo(fontSize: 20, color: grey),
  //               ),
  //             ),
  //             const ImageIcon(
  //               AssetImage("assets/icon/loc.png"),
  //               size: 40,
  //               color: red,
  //             ),
  //             const Text(
  //               'مصر',
  //               style: GoogleFonts.cairo(fontSize: 20, color: black),
  //             ),
  //             const Text(
  //               '/',
  //               style: GoogleFonts.cairo(fontSize: 20, color: black),
  //             ),
  //             const Text(
  //               'القاهرة',
  //               style: GoogleFonts.cairo(fontSize: 20, color: black),
  //             ),
  //             const Text(
  //               '/',
  //               style: GoogleFonts.cairo(fontSize: 20, color: black),
  //             ),
  //             const Text(
  //               'المعادي',
  //               style: GoogleFonts.cairo(fontSize: 20, color: black),
  //             ),
  //           ]),
  //         )
  //       ]),
  //     ),
  //   ),
  // );

}
