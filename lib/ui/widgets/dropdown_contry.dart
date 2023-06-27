import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownLogin extends StatelessWidget {
  final TextEditingController? phoneController;
  final Function onChanged;
  final String? errorText;
  final String? txt;
  final String? countrycode;
  DropDownLogin(
      {Key? key,
        required this.onChanged,
        this.errorText,
        this.phoneController,
        this.txt,
        this.countrycode
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    return DropdownButtonHideUnderline(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: 50.h,
          // decoration: const InputDecoration(),
          child: Row(
            children: [
              Text(countrycode!),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                //  flex: 3,
                child: Text(
                  '$txt' ,
                  style: GoogleFonts.cairo(
                      color: Colors.black,
                      fontSize: 14.sp
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Utils {
  static String countryCodeToEmoji(String countryCode) {
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }
}