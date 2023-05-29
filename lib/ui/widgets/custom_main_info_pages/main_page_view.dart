import 'package:effa/controllers/basic_pages_controller.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/widgets/custom_main_info_pages/pages/gender.dart';
import 'package:effa/ui/widgets/custom_main_info_pages/pages/nationalty.dart';
import 'package:effa/ui/widgets/custom_main_info_pages/pages/religions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/bairth_date.dart';
import 'pages/name.dart';

class CustomRegisterView extends StatelessWidget {
  CustomRegisterView({Key? key}) : super(key: key);
  BasicPagesController controller = Get.find();
  Future<bool> _onWillPop() async{

    return true;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GetBuilder<BasicPagesController>(
        builder: (controller){
          return Directionality(
            textDirection: TextDirection.rtl,
            child: controller.loader?const Center(child: CircularProgressIndicator(color: basicPink,),):PageView(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Gender(),
                FullName(),
                BirthDate(),
                NationalityInfo(),
                Religion()
              ],
            ),
          );
        },

      ),
    );
  }
}
