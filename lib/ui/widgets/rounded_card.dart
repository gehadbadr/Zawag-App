import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedCard extends StatelessWidget {
  const RoundedCard(
      {Key? key,
        required this.width,
        required this.height,
        required this.mywidget})
      : super(key: key);
  final double width, height;
  final Widget mywidget;

  // @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     color: Colors.white,
  //     elevation: 0.2,
  //     shadowColor: const Color(0xff707070),
  //     shape: RoundedRectangleBorder(
  //       side: const BorderSide(color: Colors.white70, width: 2),
  //       borderRadius: BorderRadius.circular(15),
  //     ),
  //     child:  SizedBox(width: width, height: height, child: mywidget),
  //
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: Colors.white70, width: 1
        ),
        boxShadow: [
          BoxShadow(
            color: gGrey,
              spreadRadius: 0.2,
            blurRadius:4,
            offset: Offset(0,3)
          ),
        ],
      ),
      child:  SizedBox(width: width, height: height, child: mywidget),

    );
  }
}
