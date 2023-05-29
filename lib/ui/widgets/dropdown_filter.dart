import 'package:effa/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class DropDownFilter extends StatefulWidget {
  String icon;
  String txt;
  List<String> menuItems;
  ValueChanged onSelect;
  DropDownFilter({
    Key? key,
    this.icon = "assets/icon/nation.png",
    this.txt="",
    required this.onSelect,
    this.menuItems = const [
       "sadasd",
      "asdadas",
      "asdasddasdas",
      "asdasasdasdas",
    ],

  }) : super(key: key);

  @override
  State<DropDownFilter> createState() => _DropDownFilterState();
}

class _DropDownFilterState extends State<DropDownFilter> {
  String? selectedValue = null;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ImageIcon(
            AssetImage(widget.icon),
            size: 40,
            color: basicPink,
            // ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Align(
              child: Text(
                widget.txt,
                style: GoogleFonts.cairo(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30.h,
              width: 284.w,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      isExpanded: true,
                      icon: const ImageIcon(
                        AssetImage("assets/icon/combo.png"),
                        size: 40,
                        color: black,
                      ),
                      hint: Text(
                        "اختر",
                        style: GoogleFonts.cairo(
                          color: black,
                          fontSize: 14.sp,
                        ),
                      ),
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        widget.onSelect(newValue);
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: widget.menuItems.map((String item) =>
                          DropdownMenuItem<String>(child: Text(item), value: item))
                          .toList(),
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
