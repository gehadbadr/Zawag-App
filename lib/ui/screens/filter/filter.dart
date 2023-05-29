import 'package:effa/controllers/switch_filter_controllrt.dart';
import 'package:effa/helper/app_colors.dart';
import 'package:effa/ui/screens/filter/unsubscribed_user.dart';
import 'package:effa/ui/screens/filter_option/filter_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class Filter extends StatelessWidget {
  Filter({Key? key}) : super(key: key);

  final controller = Get.lazyPut(() => FilterSwitchController(),fenix: true);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterSwitchController>(
        builder: (controller){
          return controller.switchWidget?UnsubscribedUser():FilterOptions();
        }
    );
  }
}
