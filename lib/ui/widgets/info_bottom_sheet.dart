import 'package:effa/controllers/bottom_sheet_msg_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class WaitBottomSheet extends StatefulWidget {
  int id;
   WaitBottomSheet({Key? key,required this.id}) : super(key: key);

  @override
  State<WaitBottomSheet> createState() => _WaitBottomSheetState();
}

class _WaitBottomSheetState extends State<WaitBottomSheet> {
  BottomSheetController controller = Get.put(BottomSheetController(), permanent: false);
  @override
  void initState() {
    controller.fetchMsgData(widget.id);    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetController>(
        builder: (controller) {
          return  controller.loader?const Center(child: CircularProgressIndicator(color: basicPink,),):SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: gGrey,
                              spreadRadius: 0.2,
                              blurRadius: 4,
                              offset: Offset(0, 3)),
                        ],
                      ),
                      child: Card(
                        color: white,
                        elevation: 6,
                        shadowColor: black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20.0.h),
                                    child: Text(
                                      "${controller.messageBs!.title}",
                                      style: GoogleFonts.cairo(
                                          decoration: TextDecoration.underline,
                                          color: basicPink,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 10.h),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "${controller.messageBs!.content}",
                                        style: GoogleFonts.cairo(fontSize: 16.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    )),
              ],
            ),
          );
        }
    );
  }
}
