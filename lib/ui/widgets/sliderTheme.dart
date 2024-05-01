import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
class SliderWidget extends StatefulWidget {
  String icon;
  String txt1;
  String txt2;
  ValueChanged onSelect;
  SliderWidget({
    Key? key,
    this.icon = "assets/icon/nation.png",
    this.txt1="",
    this.txt2="",
    required this.onSelect,
  }) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderState();
}

class _SliderState extends State<SliderWidget> {
  RangeValues currentRangeValues =  const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        ImageIcon(
          AssetImage(widget.icon),
          size: 27.h,
          color: basicPink,
          // ),
        ),
        SizedBox(width:10.w,),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Row(children: [
            Align(
              child: Text(
                widget.txt1,
                style:
                GoogleFonts.cairo(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              widget.txt2,
              style: GoogleFonts.cairo(
                fontSize: 12.sp,
                color: darkblack,
              ),
            ),
          ]),
          SizedBox(
            height: 30.h,
            width: 285.w,
            child: SliderTheme(
              data: const SliderThemeData(
                  activeTrackColor: basicPink,
                  thumbColor: white,
                  inactiveTrackColor: ldarkGrey,
                  overlayColor: lightPink,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20)),
              child: RangeSlider(
                values: currentRangeValues,
                min: 0,
                max: 230,
                divisions: 10,
                labels: RangeLabels(
                  currentRangeValues.start.round().toString(),
                  currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  widget.onSelect(values);
                  setState(() {
                    widget.onSelect(values);
                    currentRangeValues = values;
                  });
                },
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
